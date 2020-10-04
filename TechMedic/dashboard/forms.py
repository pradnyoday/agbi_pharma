from django import forms
from .models import Drugs,Patients,Diagnosis

choices = [(0,'Low Blood Pressure (below 90/60 mmHg)'),(1,'Normal (90/60 - 130/80 mmHg)'),(2,'High Blood Pressure (140/90 mmHg and above)'),(-1,'Not Applicable')]
posology = [('tablet','Tablet'),('syrup','Syrup'),('ointment','Ointment'),('syringe','Syringe'),]
categories = [('Analgesic & Antipyretic / Muscle Relaxants','Analgesic & Antipyretic / Muscle Relaxants'),('Antiallergic','Antiallergic'),
            ('Anticancer/Oncology','Anticancer/Oncology'),('Antidiabetic','Antidiabetic'),('Antiinfective','Antiinfective'),
            ('Cardiovascular System (CVS)','Cardiovascular System (CVS)'),('Central Nerve System (CNS)','Central Nerve System (CNS)'),
            ('Dermatology/Topical/External','Dermatology/Topical/External'),('Electrolytes/ Supplements/ Vitamins & Minerals','Electrolytes/ Supplements/ Vitamins & Minerals'),
            ('Eye / Ear drops','Eye / Ear drops'),('Gastrointestinal (GIT)','Gastrointestinal (GIT)'),('Gynaecology','Gynaecology'),
            ('Immunosuppresant','Immunosuppresant'),('Local/ General Anaesthetics','Local/ General Anaesthetics'),('Miscellaneous','Miscellaneous'),
            ('Respiratory','Respiratory'),('Steroids & Hormones','Steroids & Hormones'),('Urology','Urology'),('Vaccines / Toxoids','Vaccines / Toxoids')]


class DrugRecordForm(forms.ModelForm):
    drug_name = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Drug Name'}))
    nct_no = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'NCT Number'}))
    drug_image_path = forms.ImageField(label='Image',initial='default.jpg')
    drug_category = forms.CharField(label='Drug Category :',widget=forms.Select(choices=categories))
    efficacy = forms.DecimalField(label='',widget=forms.TextInput(attrs={'placeholder': 'Efficacy'}))
    posology = forms.CharField(label='Mode of Intake :',widget=forms.Select(choices=posology))
    text = forms.CharField(label='',widget=forms.TextInput(attrs={'readonly':'readonly','value':'Not Advised For :'}))
    min_age = forms.IntegerField(label='',widget=forms.TextInput(attrs={'placeholder': 'Minimum Age'}))
    max_age = forms.IntegerField(label='',widget=forms.TextInput(attrs={'placeholder': 'Maximum Age'}))
    other_medications = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Other Medications','id':'other_medications'}),required=False)
    comorbid_conditions = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Comorbid Conditions','id':'comorbid_conditions'}),required=False)
    hereditary_diseases = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Hereditary Diseases',}),required=False)
    allergies = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Allergies',}),required=False)
    blood_pressure_req = forms.MultipleChoiceField(label='Blood Pressure :',widget=forms.CheckboxSelectMultiple,choices=(choices))
    
    
    
    class Meta:
        model = Drugs
        fields = ['drug_name','nct_no','drug_image_path','drug_category','efficacy',
                'posology','text','min_age','max_age','other_medications','comorbid_conditions',
                'hereditary_diseases','allergies','blood_pressure_req',]



categ = [('name','Patient Name'),('diagnosis','Diagnosis'),('prescribed_drug','Prescribed Drug')]

class SearchQueryForm(forms.Form):
    searchby = forms.ChoiceField(label='Search By',choices=categ, required=False)
    value = forms.CharField(required=False,label='',widget=forms.TextInput(attrs={'placeholder': 'Enter Value'}))
    fields = ['searchby','value']

genders = [('m','Male'),('f','Female'),('o','Other')]
blood_groups = [('a rh positive','A Rh Positive'),
                ('a rh negative','A Rh Negative'),
                ('b rh positive','B Rh Positive'),
                ('b rh negative','B Rh Negative'),
                ('ab rh positive','AB Rh Positive'),
                ('ab rh negative','AB Rh Negative'),
                ('o rh positive','O Rh Positive'),
            ]



class NewPatientForm(forms.ModelForm):
    name = forms.CharField(label='',max_length=100,widget=forms.TextInput(attrs={'placeholder': 'Name'}))
    gender = forms.ChoiceField(label='Gender',choices=genders)
    address = forms.CharField(label='', max_length=1000,widget=forms.TextInput(attrs={'placeholder': 'Address'}))
    city = forms.CharField(label='',max_length=100,widget=forms.TextInput(attrs={'placeholder': 'City'}))
    blood_group = forms.ChoiceField(label='Blood Group',choices=blood_groups)
    birthdate = forms.DateField(label='Birthdate',widget=forms.TextInput(attrs={'type':'date'}))
    contact_info = forms.CharField(label='',max_length=13,widget=forms.TextInput(attrs={'placeholder': 'Contact Information'}))
    comorbid_conditions = forms.CharField(label='',max_length=1000, required=False,widget=forms.TextInput(attrs={'placeholder': 'Comorbidities'}))
    hereditary_diseases = forms.CharField(label='',max_length=1000, required=False,widget=forms.TextInput(attrs={'placeholder': 'Hereditary Diseases'}))
    allergies = forms.CharField(label='',max_length=1000, required=False,widget=forms.TextInput(attrs={'placeholder': 'Allergies',}))

    class Meta:
        model = Patients
        fields = ['name','gender','address','city','blood_group','birthdate','contact_info','comorbid_conditions','hereditary_diseases','allergies']

severityl = [('low','Low'),('medium','Medium'),('high','High')]
class NewDiagnosisForm(forms.ModelForm):
    pid = forms.IntegerField(label='',widget=forms.TextInput(attrs={'placeholder': 'Patient ID'}))
    diagnosis = forms.CharField(max_length=200,label='',widget=forms.TextInput(attrs={'placeholder': 'Diagnosis','id':'diagnosis'}))
    severity = forms.ChoiceField(label='Severity',choices=severityl)
    height = forms.CharField(max_length=20,label='',widget=forms.TextInput(attrs={'placeholder': 'Height'}))
    weight = forms.CharField(max_length=20,label='',widget=forms.TextInput(attrs={'placeholder': 'Weight'}))
    bp_sys = forms.IntegerField(label='',widget=forms.TextInput(attrs={'placeholder': 'Blood Presure Systolic'}))
    bp_dys = forms.IntegerField(label='',widget=forms.TextInput(attrs={'placeholder': 'Blood Presure Dystolic'}))
    prescribed_drug = forms.CharField(max_length=1000,label='',widget=forms.TextInput(attrs={'placeholder': 'Prescribed Drug'}))
    precautions = forms.CharField(max_length=2000,label='',widget=forms.TextInput(attrs={'placeholder': 'Precautions'}),required=False)
    prescribed_treatment = forms.CharField(max_length=2000,label='',widget=forms.TextInput(attrs={'placeholder': 'Prescribed Treatment'}),required=False)
    past_medications = forms.CharField(max_length=1000,label='',widget=forms.TextInput(attrs={'placeholder': 'Past Medications if any'}),required=False)
    class Meta:
        model = Diagnosis
        fields = ['pid','diagnosis','severity','height','weight','bp_sys','bp_dys','prescribed_drug','prescribed_treatment','precautions','past_medications']

diagnosislist = []
l = Diagnosis.objects.values_list('diagnosis').order_by('diagnosis').distinct() 
li = list(l)
li = [i+(i[0],) for i in li]

choices1 = [(0,'Low Blood Pressure (below 90/60 mmHg)'),(1,'Normal (90/60 - 130/80 mmHg)'),(2,'High Blood Pressure (140/90 mmHg and above)'),]
class DiagnosisSuggestionForm(forms.Form):
    diagnosis = forms.ChoiceField(choices=(li), required=False)
    blood_pressure = forms.ChoiceField(choices=(choices1),required=False)
    class Meta:
        fields = ['diagnosis','blood_pressure']