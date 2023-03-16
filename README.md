# Group_Final_Project

## Topic
Parking Violations in NYC. We were looking through datasets that were publically available and found this datset and we wanted to see if there were any trends in parking violations.

## Resources
In the resources.zip, there is a data file which was too large for git's data budget. Inside is 'cleaned_data.csv'

## Description of Data
Public data on NYCOpenData from NYC Department of Finance (DOF), we have a data set with traffic violations. Our variables of interest include registration data, vehicle data, violation data and location.
Once the data is cleaned, it should look similar to this DB mock-up, with alternative tables for use in machine learning and presentations:
![traffic_db_wip.png](images/traffic_db_cleaned.png)

##Multiple Regression Analysis
![image](https://user-images.githubusercontent.com/113560850/225720170-64d924a3-1833-49db-9e57-2f4794ff4902.png)


This data shows that given violation time, car model/make, vehicle color against violation code, we can somewhat predict whether or not a car will be issued a violation ticket. Our Multiple R Sqaured value is 23%, meaning only 23% of ou values will be correctly predicted based on this model. With machine learning, we hope to be able to fine-tune this and have our model be able to predict violation ticket issues accurately.

## Questions
- What relationship is there between the type, color, or make of car with violation?
- What color car are more prone to violations (in comparison to the proportion of colors of cars)?
- Can vehicle type predict type of violation?



# Overview

The purpose of this project is to use machine learning to help understand the major factors that contribute to a car getting a parking ticket using public datasets from the City of New York (NYCOpenData) so that given a hypothetical instance, the probability in which the car getting a ticket could be predicted. 

# Results
The original dataset for 2023 Parking Violatons was taken from the OpenData source from the City of New York with more than 10 million datapoints. 
<img width="1090" alt="Screen Shot 2023-03-15 at 12 36 00 AM" src="https://user-images.githubusercontent.com/115126898/225173386-35c78b72-6767-4a68-95cf-ee8b8fa5b80d.png">

Original dataset includes detailed information for each individual ticket including 'Summons Number', 'Plate ID', 'Registration State', 'Plate Type', etc.
<img width="851" alt="Screen Shot 2023-03-15 at 12 42 05 AM" src="https://user-images.githubusercontent.com/115126898/225174764-d38e2049-7311-4e43-a96a-d3f6c8c766d6.png">

Using Python, the initial dataset was cleaned to drop incomplete data and to narrow down to the important factors that most likely contribute to getting a ticket such as vehicle type, color, violation type, etc. The dataset was saved to a much smaller 'cleaned_data.csv' to about 7 million datapoints.



# Summary





Tableau was used to help visualize the data and to see the patterns represented in the cleaned dataset. 
