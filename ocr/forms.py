from django import forms
from .models import SaveFile

class FileUploadForm(forms.ModelForm):
    class Meta:
        model = SaveFile
        fields = ['report']