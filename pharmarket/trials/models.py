from django.db import models

# Create your models here.
class trial(models.Model):
    name = models.CharField(max_length=50)
    user = models.ForeignKey("users.account", on_delete=models.CASCADE)

    class Meta:
        db_table = 'trial'