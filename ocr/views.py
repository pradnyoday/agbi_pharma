from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def home(request):
    return render(request, 'ocr/home.html')

def uploadDocument(request):
    return HttpResponse('<h1>OCR Upload Document Page</h1>')