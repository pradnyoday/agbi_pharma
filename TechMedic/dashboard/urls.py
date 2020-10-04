from django.urls import path
from .views import (home,about,add_drugs,hospital,download,
                    search,searchpatients,get_patients,analytics,
                    get_diag_data,diagnosis_tagging,filldiagnosis,
                    graph,getdrugs,pharmaAnalytics,drugDetails)
from ocr.views import uploadDocument

urlpatterns = [
    path('',home,name='homepage'),
    path('drugs/',add_drugs,name='add_drugs'),
    path('hospital/',hospital,name='hospital'),
    path('download/',download,name="downloadexcel"),
    path('search/',search,name='search'),
    path('ocr/upload',uploadDocument,name='uploadreport'),
    path('searchpatients',searchpatients,name='searchpatients'),
    path('get_patients/<int:pk>',get_patients,name="get_patients"),
    path('analytics/',analytics,name="analytics"),
    path('get_diag_data/<int:p_id>',get_diag_data,name='get_diag_data'),
    path('diagnosis_tagging/',diagnosis_tagging,name='diagnosis_tagging'),
    path('filldiagnosis',filldiagnosis,name='filldiagnosis'),
    path('graph',graph,name='graph'),
    path('getdrugs/<int:drug_id>',getdrugs,name='getdrugs'),
    path('pharmaAnalytics/',pharmaAnalytics,name='pharmaAnalytics'),
    path('drugDetails/<int:pk>',drugDetails,name='drugDetails')
]