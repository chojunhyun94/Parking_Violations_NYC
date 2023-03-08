-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Parking_Violations_Raw" (
    "Summons_Number" float   NOT NULL,
    "Plate_ID" varchar(10)   NOT NULL,
    "Registration_State" varchar(2)   NOT NULL,
    "Plate_Type" varchar(3)   NOT NULL,
    "Issue_Date" timestamp   NOT NULL,
    "Violation_Code" int   NOT NULL,
    "Vehicle_Body_Type" varchar(4)   NOT NULL,
    "Vehicle_Make" varchar(5)   NOT NULL,
    "Issuing_Agency" varchar(1)   NOT NULL,
    "Street_Code1" int   NOT NULL,
    "Street_Code2" int   NOT NULL,
    "Street_Code3" int   NOT NULL,
    "Vehicle_Expiration_Date" int   NOT NULL,
    "Violation_Location" int   NOT NULL,
    "Violation_Precint" int   NOT NULL,
    "Issuer_Precinct" int   NOT NULL,
    "Issuer_Code" int   NOT NULL,
    "Issuer_Command" int   NOT NULL,
    "Issuer_Squad" int   NOT NULL,
    "Violation_Time" varchar(5)   NOT NULL,
    "First_Time_Observed" varchar(5)   NOT NULL,
    "Violation_County" varchar(2)   NOT NULL,
    "Violation_In_Front_Of_Or_Opposite" varchar(1)   NOT NULL,
    "House_Number" int   NOT NULL,
    "Street_Name" varchar(20)   NOT NULL,
    "Intersecting_Street" varchar(20)   NOT NULL,
    "Date_First_Observed" varchar(10)   NOT NULL,
    "Law_Section" int   NOT NULL,
    "Sub_Division" varchar(2)   NOT NULL,
    "Violation_Legal_Code" varchar(1)   NOT NULL,
    "Days_Parking_In_Effect" varchar(7)   NOT NULL,
    "From_Hours_In_Effect" varchar(5)   NOT NULL,
    "To_Hours_In_Effect" varchar(5)   NOT NULL,
    "Vehicle_Color" varchar(6)   NOT NULL,
    "Unregistered_Vehicle" bool   NOT NULL,
    "Vehicle_Year" int   NOT NULL,
    "Meter_Number" varchar(10)   NOT NULL,
    "Feet_From_Curb" int   NOT NULL,
    "Violation_Post_Code" varchar(5)   NOT NULL,
    "Violation_Description" varchar(20)   NOT NULL
);

CREATE TABLE "Parking_Violations_Clean" (
    "Registration_State" varchar(2)   NOT NULL,
    "Plate_Type" varchar(3)   NOT NULL,
    "Violation_Code" int   NOT NULL,
    "Vehicle_Body_Type" varchar(4)   NOT NULL,
    "Vehicle_Make" varchar(5)   NOT NULL,
    "Vehicle_Expiration_Date" int   NOT NULL,
    "Violation_Location" int   NOT NULL,
    "Violation_Time" varchar(5)   NOT NULL,
    "Street_Name" varchar(20)   NOT NULL,
    "Vehicle_Color" varchar(6)   NOT NULL,
    "Vehicle_Year" int   NOT NULL
);

CREATE TABLE "Moving_Violations_Raw" (
    "EVNT_KEY" int   NOT NULL,
    "VIOLATION_DATE" timestamp(D/M/Y)   NOT NULL,
    "VIOLATION_TIME" timestamp(h/m/s)   NOT NULL,
    "CHG_LAW_CD" varchar(5)   NOT NULL,
    "VIOLATION_CODE" varchar(10)   NOT NULL,
    "VEH_CATEGORY" varchar(10)   NOT NULL,
    "CITY_NM" varchar(10)   NOT NULL,
    "RPT_OWNING_CMD" int   NOT NULL,
    "X_COORD_CD" int   NOT NULL,
    "Y_COORD_CD" int   NOT NULL,
    "Latitude" float   NOT NULL,
    "Longitude" float   NOT NULL,
    "Location" varchar(50)   NOT NULL,
    "Zip_Codes" int   NOT NULL,
    "Community_Districts" int   NOT NULL,
    "Borough_Boundaries" int   NOT NULL,
    "City_Council_Districts" int   NOT NULL,
    "Police_Precints" int   NOT NULL
);

CREATE TABLE "Moving_Violations_Clean" (
    "VIOLATION_DATE" timestamp(D/M/Y)   NOT NULL,
    "VIOLATION_TIME" timestamp(h/m/s)   NOT NULL,
    "VEH_CATEGORY" varchar(10)   NOT NULL,
    "Latitude" float   NOT NULL,
    "Longitude" float   NOT NULL
);

ALTER TABLE "Parking_Violations_Raw" ADD CONSTRAINT "fk_Parking_Violations_Raw_Registration_State_Plate_Type_Violation_Code_Vehicle_Body_Type_Vehicle_Make_Vehicle_Expiration_Date_Violation_Location_Violation_Time_Street_Name_Vehicle_Color_Vehicle_Year" FOREIGN KEY("Registration_State", "Plate_Type", "Violation_Code", "Vehicle_Body_Type", "Vehicle_Make", "Vehicle_Expiration_Date", "Violation_Location", "Violation_Time", "Street_Name", "Vehicle_Color", "Vehicle_Year")
REFERENCES "Parking_Violations_Clean" ("Registration_State", "Plate_Type", "Violation_Code", "Vehicle_Body_Type", "Vehicle_Make", "Vehicle_Expiration_Date", "Violation_Location", "Violation_Time", "Street_Name", "Vehicle_Color", "Vehicle_Year");

ALTER TABLE "Moving_Violations_Raw" ADD CONSTRAINT "fk_Moving_Violations_Raw_VIOLATION_DATE_VIOLATION_TIME_VEH_CATEGORY_Latitude_Longitude" FOREIGN KEY("VIOLATION_DATE", "VIOLATION_TIME", "VEH_CATEGORY", "Latitude", "Longitude")
REFERENCES "Moving_Violations_Clean" ("VIOLATION_DATE", "VIOLATION_TIME", "VEH_CATEGORY", "Latitude", "Longitude");

