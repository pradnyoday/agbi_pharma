from django.db import models
from django.conf import settings


def saveimage(instance,filename):
    return 'images/{0}/{1}'.format(instance.user.reg_name,filename)

class Drugs(models.Model):
    drug_id = models.AutoField(primary_key=True)
    drug_name = models.CharField(max_length=1000)
    nct_no = models.CharField(unique=True, max_length=50)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    drug_image_path = models.ImageField(upload_to=saveimage,default='default.jpg')
    min_age = models.IntegerField()
    max_age = models.IntegerField()
    other_medications = models.CharField(max_length=2000)
    comorbid_conditions = models.CharField(max_length=2000)
    blood_pressure_req = models.IntegerField()
    posology = models.CharField(max_length=200)
    efficacy = models.DecimalField(max_digits=5, decimal_places=2)
    drug_category = models.CharField(max_length=200)
    upload_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'drugs'

    def __str__(self):
        return str(self.user.reg_name)+' '+str(self.drug_name)
    

    def save_model(self, request, obj, form, change):
        obj.user = request.user
        super().save_model(request, obj, form, change)
