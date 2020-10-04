import plotly.graph_objects as go 
import pymysql
import numpy as np 
import pandas as pd 
from collections import Counter
from datetime import date
from plotly.offline import plot

def showFrequentDrugs(df):
    df_frequent_drugs = pd.DataFrame()
    df_frequent_drugs = df.filter(['prescribed_drug'], axis = 1)

    df_frequent_drugs = df_frequent_drugs.prescribed_drug.str.split(',',expand = True)
    df_frequent_drugs_list = df_frequent_drugs.values.tolist()
    df_frequent_drugs_list = [item for sublist in df_frequent_drugs_list for item in sublist if item]
    # df_frequent_drugs_list = [i for i in df_frequent_drugs_list if i] 
    unique_drugs_list = list(Counter(df_frequent_drugs_list).keys())
    unique_drugs_count = list(Counter(df_frequent_drugs_list).values())

    frequent_drugs_dict = dict(zip(unique_drugs_list, unique_drugs_count))
    frequent_drugs_dict = {k: v for k, v in sorted(frequent_drugs_dict.items(), key=lambda item: item[1], reverse = True)}
    # frequent_drugs_dict = collections.OrderedDict(sorted_x)
    # print(type(unique_drugs_list))
    # print(unique_drugs_list)

    fig = go.Figure(data=[go.Pie(labels=unique_drugs_list, values=unique_drugs_count, hole=.3)])
    fig.update_layout(title_text='Frequently Used Drugs Distribution', title_x = 0.5, legend_title="Drugs",font=dict(family="Roboto",size=14,color="RebeccaPurple"))
    # fig.write_image("fig.png")
    plot_div = plot(fig,output_type = 'div')
    return plot_div

def showFrequentDiseases(df):
    df_frequent_diseases = pd.DataFrame()
    df_frequent_diseases = df.filter(['diagnosis'], axis = 1)
    df_frequent_diseases_list = df_frequent_diseases.values.tolist()
    df_frequent_diseases_list = [item for sublist in df_frequent_diseases_list for item in sublist if item]
    unique_diseases_list = list(Counter(df_frequent_diseases_list).keys())
    unique_diseases_count = list(Counter(df_frequent_diseases_list).values())
    fig = go.Figure(data=[go.Pie(labels=unique_diseases_list, values=unique_diseases_count, hole=.3)])
    fig.update_layout(title_text='Frequent Diseases Distribution', title_x = 0.5, legend_title="Diseases",
    font=dict(
        family="Roboto",
        size=14,
        color="RebeccaPurple"
    ))
    # fig.write_image("fig1.png")
    plot_div = plot(fig,output_type = 'div')
    return plot_div

def showAgeGroup(connection):
    df = pd.read_sql("SELECT (CASE when age <= 18 THEN 'Below 18' when age >= 19 and age <= 29 THEN '19 to 29' when age >=30 and age <=40 THEN '30 to 40' when age >=41 and age <=64 THEN '41 to 64' when age >=65 THEN '65 and above' END) agegroup, count(*) as count from (SELECT round(DATEDIFF(CURRENT_DATE,birthdate)/365) as age from patients) derived GROUP BY agegroup", connection)
    age_dict = {'Below 18':0, '19 to 29':0, '30 to 40':0, '41 to 64':0, '65 and above':0}
    age_labels_temp = df['agegroup'].values.tolist()
    age_count = df['count'].values.tolist()
    for i in range(len(age_labels_temp)):
        age_dict[age_labels_temp[i]] = age_count[i]
    fig = go.Figure(data=[go.Bar(x=list(age_dict.keys()), y=list(age_dict.values()),hovertext=list(age_dict.keys()))])
    fig.update_traces(marker_color='rgb(58,162,125)', marker_line_color='rgb(8,48,107)',marker_line_width=1.5, opacity=0.6)
    # fig.update_layout(title_text='Age Wise Patients Distribution')
    fig.update_layout(title_text='Age Wise Patients Distribution', title_x = 0.5, xaxis_title="Age Group",
                    yaxis_title="No. of Patients",
                    legend_title="Age Group",
                    font=dict(
                    family="Roboto",
                    size=14,
                    color="RebeccaPurple"
                    ))
    # fig.write_image("fig2.png")
    plot_div = plot(fig,output_type = 'div')
    return plot_div

def showGenderGroup(connection):
    df = pd.read_sql("SELECT gender, count(*) as count FROM patients GROUP BY gender", connection)
    gender_dict = {'Male':0, 'Female':0, 'Other':0}

    gender_labels = df['gender'].values.tolist()
    gender_count = df['count'].values.tolist()

    for i in range(len(gender_labels)):
        if(gender_labels[i] == 'm'):
            gender_dict['Male'] = gender_count[i]
        elif(gender_labels[i] == 'f'):
            gender_dict['Female'] = gender_count[i]
        else:
            gender_dict['Other'] = gender_count[i]

    fig = go.Figure(data=[go.Pie(labels=list(gender_dict.keys()), values=list(gender_dict.values()), textinfo='label+percent',
                            insidetextorientation='radial'
                        )])
    fig.update_layout(title_text='Gender Wise Patients Distribution', title_x = 0.5, legend_title="Gender",
    font=dict(
        family="Roboto",
        size=14,
        color="RebeccaPurple"
        ))
    # fig.write_image("fig3.png")
    plot_div = plot(fig,output_type = 'div')
    # print(gender_dict)
    return plot_div

def showBloodGroup(connection):
    df = pd.read_sql("SELECT UPPER(blood_group) as bloodgroup, count(*) as count FROM patients GROUP BY bloodgroup", connection)
    blood_dict = {'A RH POSITIVE':0, 'A RH NEGATIVE':0, 'B RH POSITIVE':0, 'B RH NEGATIVE':0, 'AB RH POSITIVE':0, 'AB RH NEGATIVE':0, 'O RH POSITIVE':0, 'O RH NEGATIVE':0}

    bloodgroup_labels = df['bloodgroup'].values.tolist()
    bloodgroup_count = df['count'].values.tolist()

    for i in range(len(bloodgroup_labels)):
        blood_dict[bloodgroup_labels[i]] = bloodgroup_count[i]

    fig = go.Figure(data=[go.Pie(labels=list(blood_dict.keys()), values=list(blood_dict.values()), textinfo='label+percent',
                            insidetextorientation='radial'
                        )])
    # fig.update_layout(title_text='Blood Group Wise Patients Distribution')
    fig.update_layout(title_text='Blood Group Wise Patients Distribution', title_x = 0.5, xaxis_title="Blood Group",
    yaxis_title="No. of Patients",
    legend_title="Blood Group",
    font=dict(
    family="Roboto",
    size=14,
    color="RebeccaPurple"
    ))
    # fig.write_image("fig4.png")
    plot_div = plot(fig,output_type = 'div')
    return plot_div

def showCityGroup(connection):
    df = pd.read_sql("SELECT UPPER(city) as user_city, count(*) as count FROM patients GROUP BY user_city", connection)
    cities_list = df['user_city'].values.tolist()
    cities_count = df['count'].values.tolist()

    fig = go.Figure(data=[go.Bar(x=cities_list, y=cities_count,
                    hovertext=cities_list)])
    fig.update_traces(marker_color='rgb(58,162,125)', marker_line_color='rgb(8,48,107)',
                    marker_line_width=1.5, opacity=0.6)
    fig.update_layout(title_text='City Wise Patients Distribution', title_x = 0.5, xaxis_title="City",
                    yaxis_title="No. of Patients",
                    legend_title="Cities",
                    font=dict(
                    family="Roboto",
                    size=14,
                    color="RebeccaPurple"
                    ))
    # fig.write_image("fig5.png")
    plot_div = plot(fig,output_type = 'div')
    return plot_div