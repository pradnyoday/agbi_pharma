from django.urls import path
from . import views

urlpatterns = [
    path('upload/', views.uploadDocument, name='ocr-upload')
]