from django.urls import path
from .views import home,about,add_drugs,hospital,download

urlpatterns = [
    path('',home,name='homepage'),
    path('drugs/',add_drugs,name='add_drugs'),
    path('about/',about,name='about'),
    path('hospital/',hospital,name='hospital'),
    path('download/',download,name="downloadexcel"),
]