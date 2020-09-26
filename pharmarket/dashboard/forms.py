from django import forms
from .models import Drugs


class DrugRecordForm(forms.ModelForm):
    drug_name = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Drug Name'}))
    nct_no = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'NCT Number'}))
    drug_image_path = forms.ImageField(label='Image')
    min_age = forms.IntegerField(label='',widget=forms.TextInput(attrs={'placeholder': 'Minimum Age'}))
    max_age = forms.IntegerField(label='',widget=forms.TextInput(attrs={'placeholder': 'Maximum Age'}))
    other_medications = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Other Medications'}))
    comorbid_conditions = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Drug Name'}))
    blood_pressure_req = forms.IntegerField(label='',widget=forms.TextInput(attrs={'placeholder': 'Blood Pressure'}))
    posology = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Posology'}))
    efficacy = forms.DecimalField(label='',widget=forms.TextInput(attrs={'placeholder': 'Efficacy'}))
    drug_category = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Drug Category'}))
    class Meta:
        model = Drugs
        fields = ['drug_name','nct_no','drug_image_path','min_age','max_age','other_medications','comorbid_conditions','blood_pressure_req','posology','efficacy','drug_category']
