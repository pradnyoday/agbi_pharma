from django.db import models

# Create your models here.
class Diagnosis(models.Model):
    d_id = models.AutoField(primary_key=True)
    p = models.ForeignKey("dashboard.Patients", on_delete = models.CASCADE)
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
        db_table = 'diagnosis'
        

class Drugs(models.Model):
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
        db_table = 'drugs'

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
        db_table = 'patients'
