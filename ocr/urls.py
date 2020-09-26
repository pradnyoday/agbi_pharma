from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='ocr-home'),
    path('upload/', views.uploadDocument, name='ocr-upload')
]