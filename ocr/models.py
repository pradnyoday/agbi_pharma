from django.db import models

def getPath(filename):
    print(filename)
    ext = str(filename.split('.')[-1])
    return 'new.' + ext

# Create your models here.
class SaveFile(models.Model):
    report = models.FileField(upload_to = 'reports/')
    