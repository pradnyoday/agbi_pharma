from django.shortcuts import render,redirect
from .forms import DrugRecordForm
from .models import Drugs
from django.views.generic import ListView
from datetime import date
import xlwt 
from xlwt import Workbook 

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
            obj.user = request.user
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
        else:return render(request,'dashboard/drugs.html')
    else:return render(request,'dashboard/drugs.html')
    

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
            wb.save('media/'+getname())
        else:return render(request,'dashboard/drugs.html')
    else:return render(request,'dashboard/drugs.html')

def getname():
    return 'files/Drugs '+str(date.today())+'.xls'