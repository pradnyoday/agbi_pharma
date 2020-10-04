from django.shortcuts import render,redirect
from django.http import HttpResponse
import io
from PIL import Image
import cv2
import pytesseract
import numpy as np 
from wand.image import Image as wi 
import pymysql
from datetime import datetime
from .forms import FileUploadForm
from django.contrib import messages
# Create your views here.

def uploadDocument(request):
	if(request.user.role == 0):
		if(request.method == 'POST'):
			form = FileUploadForm(request.POST, request.FILES)
			if(form.is_valid()):
				file_path = 'media/reports/' + str(form.cleaned_data.get('report'))
				obj = form.save(commit = False)
				obj.save()
				reportToDatabase(file_path)
				messages.success(request, f'Record Added Successfully!! ')
				form = FileUploadForm(request.POST)
				return redirect('uploadreport')

		else:
			form = FileUploadForm()
		return render(request, 'ocr/upload.html', {'form':form})
	else:
		return redirect('homepage')


def reportToDatabase(file_path):
	connection = pymysql.connect(host = 'localhost', user = 'root', password = '', database = 'pharmarket_portal')
	pdf = wi(filename = file_path, resolution = 300)
	pdfImage = pdf.convert('jpeg')
	imageBlobs = []

	##Change this as per your installed location
	########################################################################################
 
	pytesseract.pytesseract.tesseract_cmd = 'C:\\Program Files\\Tesseract-OCR\\tesseract.exe'
 
	########################################################################################
	for img in pdfImage.sequence:
		imgPage = wi(image = img)
		imageBlobs.append(imgPage.make_blob('jpeg'))

	recognized_text = []

	count = 0

	patientReportCols = ['gender', 'address', 'city', 'birthdate', 'blood_group', 'contact_info', 'entry_date']
	patientDiagnosisCols = ['p_id', 'diagnosis_date', 'height', 'weight', 'comorbid_conditions', 'hereditary_diseases', 'allergies', 'diagnosis', 'severity', 'blood_pressure', 'past_medications', 'prescribed_drug', 'prescribed_treatment', 'precautions']
	replaceWordsPatient = ['date of birth', 'blood group', 'contact info', 'entry date']
	withReplaceWordsPatient = ['birthdate', 'blood_group', 'contact_info', 'entry_date']

	replaceWordsDiagnosis = ['patient id', 'diagnosis date', 'comorbid conditions', 'hereditary diseases', 'past medications', 'prescribed drug', 'prescribed treatment']
	withReplaceWordsDiagnosis = ['p_id', 'diagnosis_date', 'comorbid_conditions', 'hereditary_diseases', 'past_medications', 'prescribed_drug', 'prescribed_treatment']

	docToJSON = dict()
	for imgBlob in imageBlobs:
		count += 1
		im = Image.open(io.BytesIO(imgBlob))
		text = pytesseract.image_to_string(im,lang='eng',config='--psm 6')
		text = text.lower()
		

		
		if(count == 1):
			for i in range(len(replaceWordsPatient)):
				text = text.replace(replaceWordsPatient[i], withReplaceWordsPatient[i], 1)

			patientReportData = text.split()
			patientReportData = patientReportData[3:]
			countCols = 0
			dataString = ''
			colString = 'name'
			for data in patientReportData:
				if(data in patientReportCols):
					docToJSON[colString] = dataString
					dataString = ''
					colString = data
					countCols += 1
				else:
					dataString += data + ' '
			docToJSON[colString] = dataString


		else:
			for i in range(len(replaceWordsDiagnosis)):
				text = text.replace(replaceWordsDiagnosis[i], withReplaceWordsDiagnosis[i], 1)

			text = text.replace('blood pressure', 'blood_pressure')
			text = text.replace('\n', '@')
			text = text.split('@')
			str_list = list(filter(None, text))
			str_list = str_list[2:len(str_list)-1]
			countCols = 0
			dataString = ''


			for data in str_list:
				dataList = data.split()[0]
				if(dataList in patientDiagnosisCols):
					colString = dataList
					dataString = data[len(dataList)+1:]
					docToJSON[colString] = dataString
				else:
					dataString += ', ' + data
					docToJSON[colString] = dataString

			bp_val = docToJSON['blood_pressure']
			bp_val = bp_val.split('/')
			bp_sys = bp_val[0]
			bp_dys = bp_val[1].split()[0]
			docToJSON['bp_sys'] = bp_sys
			docToJSON['bp_dys'] = bp_dys
			docToJSON.pop('blood_pressure')
	
	old_dob = docToJSON['birthdate'].strip(' ')
	old_dob_obj = datetime.strptime(old_dob, '%d-%m-%Y')
	new_dob = old_dob_obj.strftime('%Y-%m-%d')
	docToJSON['birthdate'] = new_dob

	old_entry = docToJSON['entry_date'].strip(' ')
	old_entry = datetime.strptime(old_entry, '%d-%m-%Y')
	new_entry = old_entry.strftime('%Y-%m-%d')
	docToJSON['entry_date'] = new_entry

	old_diag_date = docToJSON['diagnosis_date'].strip(' ')
	old_diag_date = datetime.strptime(old_diag_date, '%d-%m-%Y')
	new_diag_date = old_diag_date.strftime('%Y-%m-%d')
	docToJSON['diagnosis_date'] = new_diag_date

	try:
		with connection.cursor() as cursor:
			t = (docToJSON['name'], docToJSON['gender'], docToJSON['address'], docToJSON['city'], docToJSON['blood_group'], docToJSON['birthdate'], docToJSON['contact_info'], docToJSON['comorbid_conditions'], docToJSON['hereditary_diseases'], docToJSON['allergies'], docToJSON['entry_date'])
			sql = "INSERT INTO patients (name, gender, address, city, blood_group, birthdate, contact_info, comorbid_conditions, hereditary_diseases, allergies, entry_date) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
			cursor.execute(sql, t)
			connection.commit()

			t1 = (docToJSON['p_id'], docToJSON['diagnosis'], docToJSON['severity'], docToJSON['height'], docToJSON['weight'], docToJSON['bp_sys'], docToJSON['bp_dys'], docToJSON['prescribed_drug'], docToJSON['prescribed_treatment'], docToJSON['precautions'], docToJSON['past_medications'], docToJSON['diagnosis_date'])
			sql1 = "INSERT INTO diagnosis (p_id, diagnosis, severity, height, weight, bp_sys, bp_dys, prescribed_drug, prescribed_treatment, precautions, past_medications, diagnosis_date) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
			cursor.execute(sql1, t1)
			connection.commit()

	finally:
		connection.close()