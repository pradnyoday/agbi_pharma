from django import forms
from .models import SaveFile

class FileUploadForm(forms.ModelForm):
    class Meta:
        model = SaveFile
        report = forms.FileField(label='Report', required=False)
        fields = ['report']