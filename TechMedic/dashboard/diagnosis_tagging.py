import plotly.graph_objects as go 
import pymysql
import numpy as np 
import pandas as pd 
from collections import Counter
import collections
from datetime import date
import datetime
import operator
import json
import plotly
def showDiagnosisDrugs(diagnosis,connection):
    diagnosis = diagnosis.lower()
    sql = "SELECT prescribed_drug FROM diagnosis WHERE LOWER(diagnosis) = '{0}'".format(diagnosis)
    df = pd.read_sql(sql, connection)

    drugs_list = df['prescribed_drug'].values.tolist()
    drugs_list = [i.split(',') for i in drugs_list]
    drugs_list = [item for sublist in drugs_list for item in sublist if item]

    unique_drugs_list = list(Counter(drugs_list).keys())
    unique_drugs_count = list(Counter(drugs_list).values())

    d = {'list':unique_drugs_list, 'count':unique_drugs_count}
    return d

def showBloodGroupDrugs(diagnosis, blood_pressure,connection):
    diagnosis = diagnosis.lower()
    sql = "SELECT prescribed_drug FROM diagnosis WHERE LOWER(diagnosis) = '{0}' AND (CASE WHEN bp_sys < 90 OR bp_dys < 60 THEN '0' WHEN bp_sys > 130 OR bp_dys > 90 THEN '2' ELSE '1' END) IN ({1})".format(diagnosis, blood_pressure)
    df = pd.read_sql(sql, connection)

    prescribed_drug_list = df['prescribed_drug'].values.tolist()
    prescribed_drug_list = [i.split(',') for i in prescribed_drug_list]
    prescribed_drug_list = [item for sublist in prescribed_drug_list for item in sublist if item]

    unique_drugs_list = list(Counter(prescribed_drug_list).keys())
    unique_drugs_count = list(Counter(prescribed_drug_list).values())
    # fig = go.Figure(data=[go.Pie(labels=unique_drugs_list, values=unique_drugs_count, hole=.3)])
    # fig.update_layout(title_text='Drugs Distribution for selected Diagnosis and Blood Pressure', title_x = 0.5, legend_title="Drugs",
    # font=dict(
    #     family="Roboto",
    #     size=14,
    #     color="RebeccaPurple"
    # ))
    d = {'list':unique_drugs_list, 'count':unique_drugs_count}
    return d

def getPrescribedTreatment(diagnosis,connection):
    diagnosis = diagnosis.lower()
    sql = "SELECT prescribed_treatment FROM diagnosis WHERE LOWER(diagnosis) = '{0}'".format(diagnosis)
    df = pd.read_sql(sql, connection)

    df.drop(df[(df.prescribed_treatment == 'nil')].index, inplace = True)
    prescribed_treatment = df['prescribed_treatment'].values.tolist()
    prescribed_treatment = [i.split(',') for i in prescribed_treatment]
    prescribed_treatment = [item for sublist in prescribed_treatment for item in sublist if item]

    unique_treatment_list = list(Counter(prescribed_treatment).keys())
    unique_treatment_count = list(Counter(prescribed_treatment).values())
    treatment_dict = dict(zip(unique_treatment_list, unique_treatment_count))
    treatment_dict = dict( sorted(treatment_dict.items(), key=operator.itemgetter(1),reverse=True))

    return treatment_dict

def getPrecautions(diagnosis,connection):
    diagnosis = diagnosis.lower()
    sql = "SELECT precautions FROM diagnosis WHERE LOWER(diagnosis) = '{0}'".format(diagnosis)
    df = pd.read_sql(sql, connection)

    df.drop(df[(df.precautions == 'nil')].index, inplace = True)
    precautions = df['precautions'].values.tolist()
    precautions = [i.split(',') for i in precautions]
    precautions = [item for sublist in precautions for item in sublist if item]

    unique_precautions_list = list(Counter(precautions).keys())
    unique_precautions_count = list(Counter(precautions).values())
    precautions_dict = dict(zip(unique_precautions_list, unique_precautions_count))
    precautions_dict = dict(sorted(precautions_dict.items(), key=operator.itemgetter(1),reverse=True))
    return precautions_dict