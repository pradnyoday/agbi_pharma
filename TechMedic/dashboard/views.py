from django.shortcuts import render,redirect
from .forms import DrugRecordForm,SearchQueryForm,NewPatientForm,NewDiagnosisForm,DiagnosisSuggestionForm
from .models import Drugs,Diagnosis,Patients
from django.views.generic import ListView
from datetime import date
import xlwt 
from xlwt import Workbook 
import plotly.graph_objects as go 
import pymysql
import numpy as np 
import pandas as pd 
from collections import Counter
from datetime import date
from plotly.offline import plot
from itertools import chain
from .analytics import showFrequentDrugs,showFrequentDiseases,showAgeGroup,showGenderGroup,showCityGroup,showBloodGroup
from django.http import JsonResponse
from .diagnosis_tagging import showDiagnosisDrugs,showBloodGroupDrugs,getPrecautions,getPrescribedTreatment
from django.db.models.functions import Lower

# Create your views here.
def home(request):
    print(request.user)
    if(request.user.is_authenticated):
        if(request.user.role == 1):
            context = {'drugs': Drugs.objects.filter(user = request.user).order_by('-upload_date')}
            return render(request,'dashboard/drugs.html',context)
        else:return hospital(request)
    else:
        return render(request,'dashboard/index.html')

def add_drugs(request):
    if(request.method == 'POST'):
        form = DrugRecordForm(request.POST,request.FILES)
        if(form.is_valid()):
            form.user = request.user
            obj = form.save(commit=False)
            s = ''
            a = {'0':1,'1':1,'2':1,'-1':1}
            for i in obj.blood_pressure_req:
                if(i in a):
                    s += i +','
            s = list(s)
            del(s[-1])
            s = ''.join(s)
            obj.blood_pressure_req = s
            obj.user = request.user
            if(obj.other_medications == ''):obj.other_medications = 'nil'
            if(obj.comorbid_conditions == ''):obj.comorbid_conditions = 'nil'
            if(obj.hereditary_diseases == ''):obj.hereditary_diseases = 'nil'
            if(obj.allergies == ''):obj.allergies = 'nil'
            obj.save()
            return redirect('homepage')
    else:
        form = DrugRecordForm()
    return render(request,'dashboard/add_drugs.html',{'form':form})

def about(request):
    return render(request,'dashboard/about.html',{'title':'About Us'})

def hospital(request):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            data = Drugs.objects.filter(upload_date__startswith=date.today())
            context = {'data': data,'name':getname()}
            return render(request,'dashboard/hospital.html',context)
        else:return redirect('homepage')
    else:return redirect('homepage')


def searchpatients(request):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            data = Drugs.objects.all().order_by('-upload_date')
            return render(request,'dashboard/searchpatients.html',{'data':data})
        else:return redirect('homepage')
    else:return redirect('homepage')

def download(request):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            data = Drugs.objects.filter(upload_date__startswith=date.today())
            wb = Workbook()
            sheet1 = wb.add_sheet('Sheet 1')
            sheet1.write(0, 0, 'Drug Name')
            sheet1.write(0, 1, 'NCT Number')
            sheet1.write(0, 2, 'Company Name')
            sheet1.write(0, 3, 'Minimun Age')
            sheet1.write(0, 4, 'Maximum Age')
            sheet1.write(0, 5, 'Other Medications')
            sheet1.write(0, 6, 'Comorbid Conditions')
            sheet1.write(0, 7, 'Blood Pressure')
            sheet1.write(0, 8, 'Posology')
            sheet1.write(0, 9, 'Efficacy')
            sheet1.write(0, 10, 'Drug Category')
            r,c = 1,0
            for row in data:
                sheet1.write(r,0,row.drug_name)
                sheet1.write(r,1,row.nct_no)
                sheet1.write(r,2,row.user.reg_name)
                sheet1.write(r,3,row.min_age)
                sheet1.write(r,4,row.max_age)
                sheet1.write(r,5,row.other_medications)
                sheet1.write(r,6,row.comorbid_conditions)
                sheet1.write(r,7,row.blood_pressure_req)
                sheet1.write(r,8,row.posology)
                sheet1.write(r,9,row.efficacy)
                sheet1.write(r,10,row.drug_category)
                r += 1
            name = 'media/'+getname()
            print(name)
            wb.save(name)
            
        else:return redirect('homepage')
    else:return redirect('homepage')

def getname():
    return 'files/Drugs '+str(date.today())+'.xls'


def search(request):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            if(request.method == 'POST'):
                form = SearchQueryForm(request.POST)
                if(form.is_valid()):
                    jusname = False
                    q = form.cleaned_data.get('searchby')
                    val = form.cleaned_data.get('value')
                    if(q == 'name'):
                        
                        ans1 = Patients.objects.filter(name = val)
                        ans = Diagnosis.objects.filter(p_id__in=[row.p_id for row in ans1])
                        if(len(ans) == 0):
                            jusname = True
                            ans = ans1
                    elif(q == 'diagnosis'):
                        ans = Diagnosis.objects.filter(diagnosis=val)
                    else:
                        ans = Diagnosis.objects.filter(prescribed_drug__contains = val)
                    anslen = False
                    if(len(ans) >= 1):anslen = True
                    else:anslen = False
                    form = SearchQueryForm(request.POST)
                    context = {'form':form,'ans':ans,'anslen':anslen,'jusname':jusname}
                    return render(request,'dashboard/search.html',context)

            else:
                form = SearchQueryForm()
                context = {'form':form,'norecord':True}
            return render(request,'dashboard/search.html',context)
        else:return redirect('homepage')
    else:return redirect('homepage')

def get_patients(request,pk):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            candidates = generateCandidateList(pk)

            data = Patients.objects.filter(pk__in = candidates)
            return render(request,'dashboard/patients.html',{'data':data})
        else:return redirect('homepage')
    else:return reddirect('homepage')

def analytics(request):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            connection = pymysql.connect(host = 'localhost', user = 'root', password = '', database = 'pharmarket_portal')
            sql = "SELECT * FROM diagnosis"
            df = pd.read_sql(sql, connection)
            fig1 = showFrequentDrugs(df)
            fig2 = showFrequentDiseases(df)
            fig3 = showAgeGroup(connection)
            fig4 = showGenderGroup(connection)
            fig5 = showBloodGroup(connection)
            fig6 = showCityGroup(connection)
            return render(request,'dashboard/analytics.html',{'fig1':fig1,'fig2':fig2,'fig3':fig3,'fig4':fig4,'fig5':fig5,'fig6':fig6})
        else:return redirect('homepage')
    else:return redirect('homepage')
    
def pharmaAnalytics(request):
    if(request.user.is_authenticated):
        if(request.user.role == 1):
            connection = pymysql.connect(host = 'localhost', user = 'root', password = '', database = 'pharmarket_portal')
            sql = "SELECT * FROM diagnosis"
            df = pd.read_sql(sql, connection)
            fig2 = showFrequentDiseases(df)
            fig3 = showAgeGroup(connection)
            fig4 = showGenderGroup(connection)
            fig5 = showBloodGroup(connection)
            return render(request,'dashboard/pharmaAnalytics.html',{'fig2':fig2,'fig3':fig3,'fig4':fig4,'fig5':fig5,})
        else:return redirect('homepage')
    else:return redirect('homepage')



def generateCandidateList(drug_id):
	def checkComorbid(comorbid):
		comorbid_list = comorbid.split(',')
		for i in comorbid_list:
			i = i.replace(' ', '', i.count(' ')).lower()
			if(i in comorbid_conditions):
				flag = 'true'
				break
			else:
				flag = 'false'
		return flag

	def checkMedications(medications):
		medications_list = medications.split(',')
		for i in medications_list:
			i = i.replace(' ', '', i.count(' ')).lower()
			if(i in other_medications):
				flag = 'true'
				break
			else:
				flag = 'false'
		return flag

	def checkHereditary(hereditary):
		hereditary_list = hereditary.split(',')
		for i in hereditary_list:
			i = i.replace(' ', '', i.count(' ')).lower()
			if(i in hereditary_diseases):
				flag = 'true'
				break
			else:
				flag = 'false'
		return flag

	def checkAllergies(allergies):
		allergies_list = allergies.split(',')
		for i in allergies_list:
			i = i.replace(' ', '', i.count(' ')).lower()
			if(i in allergies):
				flag = 'true'
				break
			else:
				flag = 'false'
		return flag

	connection = pymysql.connect(host = 'localhost', user = 'root', password = '', database = 'pharmarket_portal')
	sql1 = "SELECT drug_name, min_age, max_age, other_medications, comorbid_conditions, blood_pressure_req, drug_category, hereditary_diseases, allergies from drugs where drug_id = %s"
	df_portal_drug = pd.read_sql_query(sql1, connection, params = [drug_id])
	
	drug_category = df_portal_drug['drug_category'].values.tolist()
	drug_category = f'{drug_category[0]}'
	min_age = int(df_portal_drug['min_age'].values.tolist()[0])
	max_age = int(df_portal_drug['max_age'].values.tolist()[0])
	blood_pressure_req = df_portal_drug['blood_pressure_req'].values.tolist()
	blood_pressure_req = (blood_pressure_req[0])

	comorbid_conditions = df_portal_drug['comorbid_conditions'].values.tolist()
	comorbid_conditions = comorbid_conditions[0].split(',')
	comorbid_conditions = [item.replace(' ', '', item.count(' ')).lower() for item in comorbid_conditions]


	other_medications = df_portal_drug['other_medications'].values.tolist()
	other_medications = other_medications[0].split(',')
	other_medications = [item.replace(' ', '', item.count(' ')).lower() for item in other_medications]

	hereditary_diseases = df_portal_drug['hereditary_diseases'].values.tolist()
	hereditary_diseases = hereditary_diseases[0].split(',')
	hereditary_diseases = [item.replace(' ', '', item.count(' ')).lower() for item in hereditary_diseases]

	allergies = df_portal_drug['allergies'].values.tolist()
	allergies = allergies[0].split(',')
	allergies = [item.replace(' ', '', item.count(' ')).lower() for item in allergies]

	sql = "SELECT d2.p_id as p_id, (CASE WHEN d2.bp_sys < 90 OR d2.bp_dys < 60 THEN '0' WHEN d2.bp_sys > 130 OR d2.bp_dys > 90 THEN '2' ELSE '1' END) blood_pressure_req, min(round(DATEDIFF(CURRENT_DATE,p.birthdate)/365)) as min_age, max(round(DATEDIFF(CURRENT_DATE,p.birthdate)/365)) as max_age, d2.past_medications as other_medications, p.comorbid_conditions as comorbid_conditions, p.hereditary_diseases as hereditary_diseases, p.allergies as allergies FROM `hospital_drugs` d, diagnosis d2, patients p WHERE (CASE WHEN d2.bp_sys < 90 OR d2.bp_dys < 60 THEN '0' WHEN d2.bp_sys > 130 OR d2.bp_dys > 90 THEN '2' ELSE '1' END) IN ({3}) AND d.drug_category = '{0}' AND d2.prescribed_drug LIKE CONCAT('%', d.drug_name, '%') and d2.p_id = p.p_id GROUP BY p.p_id HAVING min_age > {1} AND max_age < {2}".format(drug_category, min_age, max_age, blood_pressure_req)

	df = pd.read_sql(sql, connection)

	if(comorbid_conditions[0].find('nil') == -1):
		df['comorbid_conditions'] = df['comorbid_conditions'].apply(checkComorbid)
	if(other_medications[0].find('nil') == -1):
		df['other_medications'] = df['other_medications'].apply(checkMedications)
	if(hereditary_diseases[0].find('nil') == -1):
		df['hereditary_diseases'] = df['hereditary_diseases'].apply(checkHereditary)
	if(allergies[0].find('nil') == -1):
		df['allergies'] = df['allergies'].apply(checkAllergies)

	df.drop(df[(df.comorbid_conditions == 'true') | (df.other_medications == 'true') | (df.hereditary_diseases == 'true') | (df.allergies == 'true')].index, inplace = True)
	candidate_list = df['p_id'].values.tolist()

	return candidate_list


def get_diag_data(request,p_id):
    diagdata = Diagnosis.objects.filter(p_id = p_id)
    name = Patients.objects.filter(p_id = p_id).values_list('name',flat=True)
    return render(request,'dashboard/patientDiagnosis.html',{'data':diagdata,'name':name[0]})

def diagnosis_tagging(request):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            if(request.method == 'POST'):
                form = NewPatientForm(request.POST)
                if(form.is_valid()):
                    obj = form.save(commit=False)
                    obj.entry_date = date.today()
                    if(obj.comorbid_conditions == ''):obj.comorbid_conditions = 'nil'
                    if(obj.hereditary_diseases == ''):obj.hereditary_diseases = 'nil'
                    if(obj.allergies == ''):obj.allergies = 'nil'
                    obj.save()
                    return redirect('filldiagnosis')
                else:
                    form = NewPatientForm()
                    return render(request,'dashboard/diagnosis_tagging.html',{'form':form})
            else:
                form = NewPatientForm()
                return render(request,'dashboard/diagnosis_tagging.html',{'form':form})
        else:return redirect('homepage')
    else:return redirect('homepage')

def filldiagnosis(request):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            if(request.method == 'POST'):
                form = NewDiagnosisForm(request.POST)
                diag_form = DiagnosisSuggestionForm(request.POST)
                if(form.is_valid()):
                    pid = form.cleaned_data.get('pid')
                    obj = form.save(commit=False)
                    obj.diagnosis_date = date.today()
                    obj.p_id_id = pid
                    obj.height = str(obj.height)+' cms'
                    obj.weight = str(obj.weight)+' kg'
                    if(obj.past_medications == ''):obj.past_medications = 'nil'
                    if(obj.precautions == ''):obj.precautions = 'nil'
                    if(obj.prescribed_treatment == ''):obj.prescribed_treatment = 'nil'
                    obj.save()
                    return redirect('homepage')
            else:
                form = NewDiagnosisForm()
                diag_form = DiagnosisSuggestionForm()
                return render(request,'dashboard/filldiagnosis.html',{'form':form,'diag_form':diag_form})
        else:return redirect('homepage')
    else:return redirect('homepage')

def graph(request):
    connection = pymysql.connect(host = 'localhost', user = 'root', password = '', database = 'pharmarket_portal')
    diagnosis = request.POST.get('diagnosis')
    bp = request.POST.get('bp')
    fig1 = showDiagnosisDrugs(diagnosis,connection)
    fig2 = showBloodGroupDrugs(diagnosis,bp,connection)
    fig3 = getPrescribedTreatment(diagnosis,connection)
    fig4 = getPrecautions(diagnosis,connection)
    context = {'fig1':fig1,'fig2':fig2,'fig3':fig3,'fig4':fig4}
    print(fig4)
    return JsonResponse(context)

def getdrugs(request,drug_id):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            ans = Drugs.objects.filter(drug_id = drug_id)
            return render(request,'dashboard/getdrugs.html',{'ans':ans})
        else:return redirect('homepage')
    else:return redirect('homepage')

def drugDetails(request,pk):
    if(request.user.is_authenticated):
        if(request.user.role == 0):
            ans = Drugs.objects.filter(drug_id = pk)
            return render(request,'dashboard/drugDetails.html',{'ans':ans})
        else:return redirect('homepage')
    else:return redirect('homepage')