from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import account

choices = [(0,'Hospital'),(1,'Company')]
class UserRegisterForm(UserCreationForm):
	email = forms.EmailField(label='',widget=forms.TextInput(attrs={'placeholder': 'Email Address'}))
	reg_name = forms.CharField(label='',widget=forms.TextInput(attrs={'placeholder': 'Registered Name'}))
	role = forms.IntegerField(label='Register as :',widget=forms.Select(choices=choices))
	city = forms.CharField(label = '',widget=forms.TextInput(attrs={'placeholder': 'City'}))
	state = forms.CharField(label = '',widget=forms.TextInput(attrs={'placeholder': 'State'}))
	country = forms.CharField(label = '',widget=forms.TextInput(attrs={'placeholder': 'Country'}))
	phone = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Phone Number'}))
	password1 = forms.CharField(label=("Password"),strip=False,widget=forms.PasswordInput)
	password2 = forms.CharField(label=("Password confirmation"),widget=forms.PasswordInput,strip=False)

	class Meta:
		model = account
		fields = ['email','reg_name','role','city','state','country','phone']

