# Generated by Django 3.1.1 on 2020-09-27 20:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ocr', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='savefile',
            name='report',
            field=models.FileField(upload_to='report/'),
        ),
    ]
