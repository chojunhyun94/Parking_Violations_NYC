SELECT * FROM Parking_Violations_Clean;

SELECT COUNT("clean.Violation_Code"), *
FROM Parking_Violations_Clean as clean
GROUP BY "clean.Violation_Code"
ORDER BY count;