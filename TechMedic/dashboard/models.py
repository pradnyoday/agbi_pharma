from django.db import models
from django.conf import settings
from datetime import datetime

def saveimage(instance,filename):
    return 'images/Drugs/{0}/{1}'.format(instance.user.reg_name,filename)

class Drugs(models.Model):
    drug_id = models.AutoField(primary_key=True)
    drug_name = models.CharField(max_length=1000)
    nct_no = models.CharField(unique=True, max_length=50)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    drug_image_path = models.ImageField(upload_to=saveimage,default='default.jpg')
    min_age = models.IntegerField()
    max_age = models.IntegerField()
    other_medications = models.CharField(max_length=2000,default = 'nil')
    comorbid_conditions = models.CharField(max_length=2000,default = 'nil')
    blood_pressure_req = models.CharField(max_length=200)
    posology = models.CharField(max_length=200)
    efficacy = models.DecimalField(max_digits=5, decimal_places=2)
    drug_category = models.CharField(max_length=200)
    upload_date = models.DateTimeField(auto_now_add=True)
    hereditary_diseases = models.CharField(max_length=2000,default = 'nil')
    allergies = models.CharField(max_length=1000,default = 'nil')

    class Meta:
        verbose_name_plural = 'Drugs'
        db_table = 'drugs'

    def __str__(self):
        return str(self.user.reg_name)+' '+str(self.drug_name)
    

    def save_model(self, request, obj, form, change):
        obj.user = request.user
        super().save_model(request, obj, form, change)


# Create your models here.
class Diagnosis(models.Model):
    d_id = models.AutoField(primary_key=True)
    p_id = models.ForeignKey("dashboard.Patients", on_delete = models.CASCADE,db_column = 'p_id')
    diagnosis = models.CharField(max_length=2000)
    severity = models.CharField(max_length=100)
    height = models.CharField(max_length=20)
    weight = models.CharField(max_length=20)
    bp_sys = models.IntegerField()
    bp_dys = models.IntegerField()
    prescribed_drug = models.CharField(max_length=1000)
    prescribed_treatment = models.CharField(max_length=1000)
    precautions = models.CharField(max_length=2000)
    past_medications = models.CharField(max_length=1000)
    diagnosis_date = models.DateField()
    admit_date = models.DateTimeField(blank=True, null=True)
    discharge_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        verbose_name_plural = 'Diagnosis'
        db_table = 'diagnosis'

    def __str__(self):
        return self.diagnosis
    
    @property
    def d_age(self):
        return int((self.diagnosis_date - self.p_id.birthdate).days / 365.25)
        

class HospitalDrugs(models.Model):
    drug_id = models.AutoField(primary_key=True)
    drug_name = models.CharField(max_length=1000)
    company_name = models.CharField(max_length=2000)
    min_age = models.IntegerField()
    max_age = models.IntegerField()
    other_medications = models.CharField(max_length=2000)
    comorbid_conditions = models.CharField(max_length=2000)
    blood_pressure_req = models.IntegerField()
    posology = models.CharField(max_length=100)
    drug_category = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = 'HospitalDrugs'
        db_table = 'hospital_drugs'

    def __str__(self):
        return self.drug_name

class Patients(models.Model):
    p_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=11)
    address = models.CharField(max_length=1000)
    city = models.CharField(max_length=100)
    blood_group = models.CharField(max_length=20)
    birthdate = models.DateField()
    contact_info = models.CharField(max_length=13)
    comorbid_conditions = models.CharField(max_length=2000)
    hereditary_diseases = models.CharField(max_length=2000)
    allergies = models.CharField(max_length=2000)
    entry_date = models.DateField()

    class Meta:
        verbose_name_plural = 'Patients'
        db_table = 'patients'
    
    @property
    def age(self):
        return int((datetime.now().date() - self.birthdate).days / 365.25)

    def __str__(self):
        return self.name
