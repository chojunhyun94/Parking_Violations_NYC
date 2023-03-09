# Group_Final_Project
Final Group Project involving ETL, Visualizations, and Machine Learning

Status As of 3/5/2023

We have changed the goal of out project and the data set. We are sitll in the middle of cleaning the data. We have been able to clarify the different tables we will be creating and using machine learning on. Additionally, we are leaning towards making an unsupervised machine learning model.
In this project we will be focusing on trying to predict the car model that is most likely to recieve a parking ticket including which areas they are most likely to be pulled over. When given certain variables, will we be able to predict whether or not a car model will be pulled over there?

Here are is some of our cleaned data ( we know that all of the data needs to be numbers for machine learning so we are in the process of doing this at the moment):

![image](https://user-images.githubusercontent.com/113560850/223585965-2b71bbe1-0192-4737-b96c-80e733719677.png)

Some code that I have enetered relates to using the lambda function to change the names of the car colors to numbers:

```
#Vehicle Color Encoded
car_color = {
      "BLK": 0,
      "RED": 1,
      "BLUE": 2,
      "GRAY": 3,
      "WHITE": 4,
   
  }

df["car_color"] = df["Vehicle Color"].apply(lambda x: car_color[x])
```

Changing the "Violaton Time" data from a string to datetime also involves removing incomplete data or inaccurate data. 

The original "Violaton Time" format was stored as HHMMA or HHMMP (Hour, Minute, A for AM or P for PM). A few issues were encountered when applying the datatime formula. When cleaning the data, it was found that some rows were missing the A or P indicators for AM or PM, so in order to drop the incomplete rows, the len() formula was used to count the length of the object of each row, and then using the loc() function, any length that were less than 5 digits long (HHMMA) were dropped. The lette M was applied to all the rows in order to help with the datetime formula later. Another issue was that not all data were correctly inputed, such as the hour. Since the hour indicators should only go up to 12 (12:00 AM or PM), anything above 12 for the hour (12MMA) such as 73MMA, should be dropped. Lastly, some of the data included spaces for 0, for example 01 6AM instead of 0106AM, which results in an error when applying the datatime formula. Code used to replace the spaces with 0 was applied. Datetime was used to change formula to format into either HH:MM AM or HH:MM PM

## Description of Data
Public data on NYCOpenData from NYC Department of Finance (DOF), we have a data set with traffic violations. Our variables of interest include registration data, vehicle data, violation data and location.
Also from NYCOpenData, the NY Police Department (NYPD) provides another dataset for moving violations.
Once the data is cleaned, it should look similar to this DB mock-up:
![traffic_db_wip.png](images/traffic_db_wip.png)

