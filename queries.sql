/*1 List nurses who have never been substitued by another nurse */
SELECT n.name As NurseName 
FROM Nurse n
LEFT JOIN Substitute s ON n.nurseID = s.nurseID
WHERE s.nurseID IS NULL;

/*2 List nurses who have been substituted by another nurse and the number of days they have been substituted by */
SELECT n.name As NurseName, SUM(TIMESTAMPDIFF(DAY, s.startDate, s.endDate))  AS TotalDays 
FROM Nurse n
INNER JOIN Substitute s ON n.nurseID = s.nurseID
GROUP BY s.nurseID;

/*3 Create a view for clients with their medication details.*/
CREATE VIEW ClientMedication1 AS
SELECT c.name AS ClientName, m.name AS MedicationName, m.dosage, m.frequency
FROM Client c
INNER JOIN Illness i ON c.clientID = i.clientID
INNER JOIN Medication m ON i.illnessID = m.prescriptionNO;

/* 4 Update the billing information*/
UPDATE Billing
SET status = 'paid'
WHERE clientID = (
    SELECT c.clientID
    FROM Client c
    WHERE c.name = 'Asal Mojtabaei' AND c.dataOfBirth = '2002-12-11'
);

/*5 List nurses without any client*/
SELECT n.name As NurseName, r.clientID 
FROM  nurse n
LEFT JOIN report r ON r.nurseID = n.nurseID
WHERE r.clientID IS NULL;

/* 6 List nurses with maximum clients*/

WITH NurseClientCount AS (
    SELECT n.name, COUNT(r.clientID) AS ClientCount
    FROM Nurse n
    LEFT JOIN Report r ON n.nurseID = r.nurseID
    GROUP BY n.name
)

, MaxClientCount AS (
    SELECT MAX(ClientCount) AS MaxCount
    FROM NurseClientCount
)

SELECT ncc.name, ncc.ClientCount
FROM NurseClientCount ncc
JOIN MaxclientCount mcc ON ncc.ClientCount = mcc.MaxCount;

/* 7 List nurses and count the duration of their report for all client */
SELECT n.name AS Nurse, r.clientID AS ClientID, SUM(TIMESTAMPDIFF(MINUTE, r.startService, r.endService)) AS TotalDurationMinutes
FROM Report r
INNER JOIN Nurse n ON n.nurseID = r.nurseID
GROUP BY n.name, r.clientID;

/* 8 Find the nurse who has the most reports.*/
SELECT n.name, COUNT(r.reportID) AS ReportCount
FROM Nurse n
INNER JOIN Report r ON n.nurseID = r.nurseID
GROUP BY n.name
ORDER BY ReportCount DESC
LIMIT 1;

/* 9 List all clients who live in a specific city and their associated nurses.*/
SELECT c.name AS ClientName, n.name AS NurseName
FROM Client c
INNER JOIN Report r ON c.clientID = r.clientID
INNER JOIN Nurse n ON r.nurseID = n.nurseID
WHERE c.city = 'Vancouver';

/*10 List the start and end dates of contracts for a specific client.*/
SELECT startDate, endDate
FROM Contract
WHERE clientID = (SELECT clientID FROM Client WHERE name = 'Asal Mojtabaei' AND dataOfBirth = '2002-12-11');

/*11 Find the names of clients who are being served by a specific nurse.*/
SELECT c.name AS ClientName
FROM Client c
INNER JOIN Report r ON c.clientID = r.clientID
WHERE r.nurseID = (SELECT nurseID FROM Nurse WHERE name = 'Juan' AND dateOfBirth = '1959-05-07');

/*12 list all clients who have overdue bills*/
SELECT c.name, b.amount, b.billingDate
FROM Client c
INNER JOIN Billing b ON c.clientID = b.clientID
WHERE b.status = 'Overdue';

/* 13 Combine every nurse with every client to find potential assignments.*/
SELECT n.name AS NurseName, c.name AS ClientName
FROM Nurse n
CROSS JOIN Client c;


/*14 List all nurses and the reports they have created, showing nurses even if they don't have any reports.*/
SELECT n.name AS NurseName, r.healthCondition, r.date
FROM Nurse n
RIGHT JOIN Report r ON n.nurseID = r.nurseID;


/*15 Find clients who have more than one illness.*/
SELECT clientID, COUNT(illness) AS IllnessCount
FROM Illness
GROUP BY clientID
HAVING COUNT(illness) > 1;

/*16 Number of clients with a specific illness.*/
SELECT illness, COUNT(clientID) AS ClientCount
FROM Illness
GROUP BY illness;

/*17 Average billing amount.*/
SELECT AVG(amount) AS AverageBillingAmount
FROM Billing;

/*18 Delete a specific billing record.*/
DELETE FROM Billing
WHERE clientID = (SELECT clientID FROM Client WHERE name = 'Diana Nalivaiko' AND dataOfBirth = '2002-01-01')
AND billingDate = '2024-07-13';

/*19 Update the phone number of a specific client.*/
UPDATE Client
SET phoneNumber = '9876543210'
WHERE name = 'Asal Mojtabaei' AND dataOfBirth = '2002-12-11';

/* 20 List clients and their emergency contact names.*/
SELECT c.name AS ClientName, e.name AS EmergencyContactName
FROM Client c
INNER JOIN Emergency e ON c.clientID = e.clientID;
