from django.contrib import admin
from .models import Drugs,HospitalDrugs,Patients,Diagnosis
# Register your models here.
admin.site.register(Drugs)
admin.site.register(HospitalDrugs)
admin.site.register(Patients)
admin.site.register(Diagnosis)