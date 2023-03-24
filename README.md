# Group_Final_Project

# Overview
The purpose of this project is to use machine learning to help understand the major factors that contribute to a car getting a parking ticket using public datasets from the City of New York (NYCOpenData) so that given a hypothetical instance, the probability in which the car getting a ticket could be predicted. We believe this data can lead to some interesting patterns about the cars based on some emerging patterns. This can then be used to create a profile of drivers based on these factors.

## Topic
Parking Violations in NYC. We were looking through datasets that were publically available and found this datset and we wanted to see if there were any trends in parking violations.

## Resources
We originally found the parking violations data for the entirety of 2023 year to date. The original file was way too large so we included the cleaned file instead under 'Resources.zip'.
Inside of 'Resources.zip', there are 3 csv files, each meant to represent our data at different points of our analysis.
'cleaned_data.csv' is our initial data that we got after removing many features that were deemed unusable by the group.
'tableau_data.csv' is further cleaned for easier visualization in tableau dashboard.
'training_data.csv' is the encoded file that we used as a checkpoint in our machine learning modeling.

# Description of Data
Public data on NYCOpenData from NYC Department of Finance (DOF), we have a data set with traffic violations. Our variables of interest include registration data, vehicle data, violation data and location.
Once the data is cleaned, it should look similar to this DB mock-up, with alternative tables for use in machine learning and presentations:

![traffic_db_wip.png](images/traffic_db_cleaned.png)
<br><a href="https://data.cityofnewyork.us/City-Government/Parking-Violations-Issued-Fiscal-Year-2023/pvqr-7yc4/data" target = "_blank">Link to Data</a>

Once sorted, a cursory look with pgAdmin's query tool can show us if there are any corelations between violation codes and other factors, such as car color or car maker. 
First, the overall distribution of violations and cars of the most common color: 

![violation_count_all.png](images/violation_count_all.png)
![violation_count_gry.png](images/violation_count_gry.png)
- Overall, these distributions are pretty similar, the top 5 are the same, with only minor ordering differences in the bottom 5 of the top 10. 
- No overt signs of bias from the people or systems that oversee tickets for grey cars. 

Next, let's look at red cars, which are frequently thought to be targeted by officers for tickets:

![violation_count_red.png](images/violation_count_red.png)
- Once again, similar to the overall distribution, and very similar to the distribution of grey cars. 
- No overt signs of bias towards red cars over grey cars. 
	- While this does not prove nor disprove officers having a bias against red cars, it does show that if that bias exists, it does not bleed over to New York City's traffic wardens and automated camera systems. 

There are more differences when we look at white cars and cars of rare colors:

![violation_count_wht.png](images/violation_count_wht.png)
![violation_count_oth.png](images/violation_count_oth.png)
- There is a significant increase in violation 14 offences, which are for Standing violations, and violation 69 offences, which are for failing to display Parking Meter Receipts. 
	- Expect this bias/increase is due to white cars and marked cars (which are included in other) being used for business purposes more than other colors of vehicles. Although how and why these biases exist are arguably out of scope of this project. 
	- Noticable bias that we hope the machine learning can recognise and utilize. 

Finally, let's see if there are similar biases from other metrics, like car manufacturer:

![violation_count_toyot.png](images/violation_count_toyot.png)
![violation_count_frueh.png](images/violation_count_frueh.png)
- While there are some differences, Toyota is similar to the overall data set, which is expected for such a popular manufacturer. 
- Fruehauf, which mainly produces trucks and trailers, is much different from the standard distribution. 
	- The increases in parking, double parking, and standing violations, and decreases in speeding violations makes sense for larger commercial vehicles and shows a very blatant bias that our models should be able to utilize.

A similar phenomenon can be observed in body types:

![violation_count_subn.png](images/violation_count_subn.png)
![violation_count_van.png](images/violation_count_van.png)
- The popular suburban sedan has a more similar distribution to the overal distribution and popular manufacturers/colors, while the more commercially used van has a much difference distribution of violations, more similar to the Fruehauf manufacturer, which mainly produces vehicles for commercial use. 

# Questions
- What relationship is there between the type, color, or make of car with violation?
- What color cars are more prone to violations (in comparison to the proportion of colors of cars)?
- Can vehicle type predict type of violation?

### Expectations:
- Overall, initial viewings of the data show that there are differences between in what kinds of vehicles are reported for certain kinds of violations. 
- It can be expected that variables like make and model of cars to have a higher impact and usefulness for the machine learning model than other variables like car color. 


# Results
The original dataset for 2023 Parking Violatons was taken from the OpenData source from the City of New York with more than 10 million datapoints. 
<img width="1090" alt="Screen Shot 2023-03-15 at 12 36 00 AM" src="https://user-images.githubusercontent.com/115126898/225173386-35c78b72-6767-4a68-95cf-ee8b8fa5b80d.png">

Original dataset includes detailed information for each individual ticket including 'Summons Number', 'Plate ID', 'Registration State', 'Plate Type', etc.
<img width="851" alt="Screen Shot 2023-03-15 at 12 42 05 AM" src="https://user-images.githubusercontent.com/115126898/225174764-d38e2049-7311-4e43-a96a-d3f6c8c766d6.png">

Using Python, the initial dataset was cleaned to drop incomplete data and to narrow down to the important factors that most likely contribute to getting a ticket such as vehicle type, color, violation type, etc. The dataset was saved to a much smaller 'cleaned_data.csv' to about 7 million datapoints.

Furthermore, the dataframe was encoded in preparation for some of the machine learning models we were planning to use. This is the result

![filtered_dataframe.png](images/filtered_dataframe.PNG)

Because we initially saw some correlations from our EDA, we decided to run a logistic regression machine learning model to see if it could pick up on the trends we found. Because of the scale of the project, we decided to run the model in batches using an algorithm to take randomized batches from the original dataset.

This is the batch_loader algorithm used to break down the dataframe

![batch_loader.png](images/batch_loader.PNG)

This produces a tuple of the randomized rows from the dataframe. Each batch will be added into different models. We started with a logistic regression.

### Logistic Regression

#### Reason For Model
As we completed our EDA, we realized that there were some patterns to be recognized . After seeing these patterns, we wanted to see if we can fit these models as well. After some trial and error, we decided to narrow the scope of the model to specific violations that would help increase the performance of the model. We narrowed it down to violation code 36: 'Speeding in School Zone' because this was the biggest violation. However, with more time we could develop for other violation codes.

#### Model Settings
'max_iter' = 500
'solver' = 'saga'
'random_state' = 2
We chose these settings because it performed the best from our testing. The larger iterations allowed the model to converge better. The solver we tried a few, but saga gave us the better performance. However, we would need further testing to get a better conclusion.

We also used a standard scalar on the model which improved the performance by 2%. It isn't much, but it certainly is an improvement.

#### Evaluation Metrics
![logistic_scaled_eval_metrics.PNG](images/logistic_scaled_eval_metrics.PNG)

### Random Forest

#### Reason for Model
Once we had our logistic regression complete, we wanted to test further using some supervised learning. This was mostly done because of our initial 0.03 accuracy score.

#### Model Settings
n_estimators = 50

#### Evaluation Metrics
![random_forest_eval_metrics.PNG](images/random_forest_eval_metrics.PNG)

### K Means

#### Reason for Model
We wanted to try some unsupervised learning to see if some unknown conclusions can be drawn from the model.

#### Elbow Curve
![kmeans_elbow_curve.png](images/kmeans_elbow_curve.PNG)

# Summary
<a href = "https://public.tableau.com/app/profile/mykhal.young/viz/FinalProject_16789899331220/ViolationCode?publish=yes">Link to tableau</a>

Tableau was used to help visualize the data and to see the patterns represented in the cleaned dataset. 

#### Multiple Regression Analysis
![image](https://user-images.githubusercontent.com/113560850/225720170-64d924a3-1833-49db-9e57-2f4794ff4902.png)


This data shows that given violation time, car model/make, vehicle color against violation code, we can somewhat predict whether or not a car will be issued a violation ticket. Our Multiple R Sqaured value is 23%, meaning only 23% of our values will be correctly predicted based on this model. With machine learning, we hope to be able to fine-tune this and have our model be able to predict violation ticket issues accurately. However this is a bit misleading because we have an enormous value for degrees of freedom, meaning we took into account too many values to make an accurate prediction.


#### Logistic Regression Analysis
![logistic_scaled_eval_metrics.PNG](images/logistic_scaled_eval_metrics.PNG)
Our initial results for a logistic regression model only had an accuracy of 0.031 at best. By helping the model focus on a specific violation code, we were able to bigger improvements. The accuracy score for the model came out to 0.576 or 57.6%. This is a significant improvement considering where we were. This confirms our initial observations from the EDA of some patterns forming in our data. However, there are further analysis that we would like to see in the future.

![random_forest_eval_metrics.PNG](images/random_forest_eval_metrics.PNG)
Our results with the random forests only further proved this case with a higher accuracy of 

Interestingly, our models (both logistic and random forest) is actually better at predicting which cars wouldn't get a speeding in school zone violation. This is something we didn't expect from our initial EDA, but it goes to show that there are specific car types, model, and/or color that would not speed in a school zone. Further analysis will need to be done for other violations, but we have created the initial base line that can easily be adapted to other violations.

####Chi Sqaure Test Analysis
![Screenshot 2023-03-16 143507](https://user-images.githubusercontent.com/113560850/227402997-8d7449cf-49de-47ba-89b4-0c5c9bf240cf.png)

The image shows that there is a high correlation between the variables we tested for and the independent variable. However, the R-sqaured value is extremely low. This is the case because with such large amounts of data, the variables would start to have some effect on the outcome, which is what is being shown. However, by looking at the data on a more granular level, we can see that the r-sqaured value starts to increase the more variables we add to the model. This means that if we stratify the dataset to offset the minority vaules then we would find a very strong r-squared value.


