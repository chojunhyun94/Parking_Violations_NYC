# Group_Final_Project
Final Group Project involving ETL, Visualizations, and Machine Learning

Status As of 3/5/2023

We have changed the goal of out project and the data set. We are sitll in the middle of cleaning the data. We have been able to clarify the different tables we will be creating and using machine learning on. Additionally, we are leaning towards making an unsupervised machine learning model.
In this project we will be focusing on trying to predict exam and graudation outcomes based on demographic and regional variables based in New York City. We wanted to focus on education as it was had the most accessible and organized data. Not only this but the variables were very agreeable with machine learning and its ability to make predictions on clear, relatable outcomes.

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
