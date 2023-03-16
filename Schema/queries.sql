TRUNCATE TABLE "parking_violations_clean";

SELECT * FROM Parking_Violations_Clean;

SELECT COUNT(clean.violation_code), clean.registration_state, clean.plate_type, clean.violation_code, clean.vehicle_body_type, clean.vehicle_make, clean.vehicle_color, clean.vehicle_year
FROM Parking_Violations_Clean as clean
GROUP BY clean.registration_state, clean.plate_type, clean.violation_code, clean.vehicle_body_type, clean.vehicle_make, clean.vehicle_color, clean.vehicle_year
ORDER BY count DESC;

SELECT COUNT(clean.registration_state), clean.registration_state
FROM Parking_Violations_Clean as clean
GROUP BY clean.registration_state
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code
FROM Parking_Violations_Clean as clean
GROUP BY clean.violation_code
ORDER BY count DESC;

SELECT COUNT(clean.vehicle_color), clean.vehicle_color
FROM Parking_Violations_Clean as clean
GROUP BY clean.vehicle_color
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code, clean.registration_state
FROM Parking_Violations_Clean as clean
GROUP BY clean.violation_code, clean.registration_state
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code, clean.plate_type
FROM Parking_Violations_Clean as clean
GROUP BY clean.violation_code, clean.plate_type
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code, clean.vehicle_body_type
FROM Parking_Violations_Clean as clean
GROUP BY clean.violation_code, clean.vehicle_body_type
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code, clean.vehicle_make
FROM Parking_Violations_Clean as clean
GROUP BY clean.violation_code, clean.vahicle_make
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code, clean.vehicle_color
FROM Parking_Violations_Clean as clean
GROUP BY clean.violation_code, clean.vehicle_color
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code, clean.vehicle_year
FROM Parking_Violations_Clean as clean
GROUP BY clean.violation_code, clean.vehicle_year
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code, clean.vehicle_color
FROM Parking_Violations_Clean as clean
WHERE clean.vehicle_color = 'RED'
GROUP BY clean.violation_code, clean.vehicle_color
ORDER BY count DESC;

SELECT COUNT(clean.violation_code), clean.violation_code, clean.vehicle_color
FROM Parking_Violations_Clean as clean
GROUP BY clean.violation_code, clean.vehicle_color
ORDER BY vehicle_color, count DESC;