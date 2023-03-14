-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
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

CREATE TABLE "parking_violations_clean" (
    "registration_state" varchar(2)   NOT NULL,
    "plate_type" varchar(3)   NOT NULL,
    "violation_code" int   NOT NULL,
    "vehicle_body_type" varchar(4)   NOT NULL,
    "vehicle_make" varchar(5)   NOT NULL,
    "violation_time" varchar(5)   NOT NULL,
    "vehicle_color" varchar(6)   NOT NULL,
    "vehicle_year" int   NOT NULL
);

CREATE TABLE "Parking_Violations_ML" (
    "registration_state_group" int   NOT NULL,
    "plate_type_group" int   NOT NULL,
    "violation_code" int   NOT NULL,
    "vehicle_body_type_group" int   NOT NULL,
    "vehicle_make_group" int   NOT NULL,
    "violation_time" datetime   NOT NULL,
    "vehicle_color_group" int   NOT NULL,
    "vehicle_year" int   NOT NULL
);

CREATE TABLE "Parking_Violations_Board" (
    "registration_state" varchar(2)   NOT NULL,
    "plate_type_group_name" varchar(3)   NOT NULL,
    "violation_code" int   NOT NULL,
    "vehicle_body_type_group_name" varchar(4)   NOT NULL,
    "vehicle_make_group_name" varchar(5)   NOT NULL,
    "vehicle_expiration_date" int   NOT NULL,
    "violation_location" int   NOT NULL,
    "violation_time" datetime   NOT NULL,
    "street_name" varchar(20)   NOT NULL,
    "vehicle_color_group_name" varchar(6)   NOT NULL,
    "vehicle_year" int   NOT NULL
);

ALTER TABLE "Parking_Violations_Raw" ADD CONSTRAINT "fk_Parking_Violations_Raw_Registration_State_Plate_Type_Violation_Code_Vehicle_Body_Type_Vehicle_Make_Violation_Time_Vehicle_Color_Vehicle_Year" FOREIGN KEY("Registration_State", "Plate_Type", "Violation_Code", "Vehicle_Body_Type", "Vehicle_Make", "Violation_Time", "Vehicle_Color", "Vehicle_Year")
REFERENCES "parking_violations_clean" ("registration_state", "plate_type", "violation_code", "vehicle_body_type", "vehicle_make", "violation_time", "vehicle_color", "vehicle_year");

