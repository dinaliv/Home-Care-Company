USE test;

INSERT INTO Client( name , dataOfBirth , phoneNumber, postalCode, city , street , clientType)
VALUES
('Asal Mojtabaei' , '2002-12-11' , '7786051234' , 'v3r2w1' , 'Vancouver' , 'metrotown 123' , 'Senior'),
('Roberto Rojas Perez', '2002-05-03', 6043401195, 'V5T2H4', 'Vancouver', 'Cool Street', 'Disabled'),
('Daniel Soltani', '2002-05-03', 6043401195, 'V5T2H4', 'Vancouver', 'Cool Street', 'Disabled'),
('Diana Nalivaiko', '2002-01-01', 1234567890, 'XXXXXX', 'Ontario', 'Fake Street', 'Disabled');

INSERT INTO Emergency(clientID, name , phone, relationship )
VALUES
((SELECT clientID FROM Client WHERE name = 'Asal Mojtabaei' AND dataOfBirth = '2002-12-11') , 'Nina Ghalambor' , '1234567891' , 'mother'),
((SELECT clientID FROM Client WHERE name = 'Roberto Rojas Perez' AND dataOfBirth = '2002-05-03') , 'John Ferr' , '1234545678' , 'friend'),
((SELECT clientID FROM Client WHERE name = 'Daniel Soltani' AND dataOfBirth = '2002-05-03') , 'Jennfier Lopez' , '1234567891' , 'friend'),
((SELECT clientID FROM Client WHERE name = 'Diana Nalivaiko' AND dataOfBirth = '2002-01-01') , 'Dani Lewis' , '1234567891' , 'Dad');

INSERT INTO Billing (clientID , billingDate, amount, status)
VALUES ((SELECT clientID FROM Client WHERE name = 'Asal Mojtabaei' AND dataOfBirth = '2002-12-11'),'2024-07-11', '3000000', 'ran away'),
((SELECT clientID FROM Client WHERE name = 'Roberto Rojas Perez' AND dataOfBirth = '2002-05-03'), '2024-07-12', '4000000', 'Overdue'),
((SELECT clientID FROM Client WHERE name = 'Daniel Soltani' AND dataOfBirth = '2002-05-03'),'2024-07-13', '5000000', 'who knows'),
((SELECT clientID FROM Client WHERE name = 'Diana Nalivaiko' AND dataOfBirth = '2002-01-01') ,'2024-07-13', '5000000', 'who knows');


INSERT INTO Illness (clientID, illness)
VALUES ((SELECT clientID FROM Client WHERE name = 'Asal Mojtabaei' AND dataOfBirth = '2002-12-11'), 'Hearing Loss'),
	   ((SELECT clientID FROM Client WHERE name = 'Roberto Rojas Perez' AND dataOfBirth = '2002-05-03'), 'Diabetes'),
               ((SELECT clientID FROM Client WHERE name = 'Daniel Soltani' AND dataOfBirth = '2002-05-03') ,'Dementia'),
   ((SELECT clientID FROM Client WHERE name = 'Diana Nalivaiko' AND dataOfBirth = '2002-01-01') ,'Chronic Obstructive Pulmonary Disease');

INSERT INTO Contract(clientID , startDate, endDate)
VALUES ((SELECT clientID FROM Client WHERE name = 'Asal Mojtabaei' AND dataOfBirth = '2002-12-11'),'2022-12-02 05:05:05', '2024-12-02 05:05:05'),
((SELECT clientID FROM Client WHERE name = 'Roberto Rojas Perez' AND dataOfBirth = '2002-05-03'),'2022-12-02 05:05:05', '2024-12-02 05:05:05'),
((SELECT clientID FROM Client WHERE name = 'Daniel Soltani' AND dataOfBirth = '2002-05-03'),'2022-12-02 05:05:05', '2024-12-02 05:05:05'),
((SELECT clientID FROM Client WHERE name = 'Diana Nalivaiko' AND dataOfBirth = '2002-01-01'), '2022-12-02 05:05:05', '2024-12-02 05:05:05') ;

INSERT INTO Nurse (licenseNO, nurseID, name, dateOfBirth, phoneNO)
VALUES (123456, 100200300, 'Katya', '1999-08-07',1234567898),
	   (123457, 100200301, 'Natalia', '1979-02-07',1234567899),
	   (123458, 100200302, 'Mike', '2001-09-01',1234567999),
               (123459, 100200303, 'Juan', '1959-05-07',1234569999) ;
               
INSERT INTO Report(nurseID, clientID, healthCondition, startService, endService, serviceProvided, date)
	VALUES (
	(SELECT nurseID FROM Nurse WHERE name = 'Juan' AND dateOfBirth = '1959-05-07'),
	(SELECT clientID FROM Client WHERE name = 'Roberto Rojas Perez' AND dataOfBirth = '2002-05-03'),
	'Client is okay he drank water and danced a little.', '2023-03-12 05:05:05', '2023-03-12 07:05:05', 'Gave him water.', '2023-03-12');

INSERT INTO Substitute (nurseID, substituteNurseID, startDate, endDate)
VALUES ((SELECT nurseID FROM Nurse WHERE nurseID = '100200300'), (SELECT nurseID FROM Nurse WHERE nurseID = '100200301'),'2024-08-07','2024-08-08');

INSERT INTO Medication(name , dosage , frequency , illnessID)
VALUES('Paracetamol', '500mg', 'Twice a day' , '1'),
    ('Amoxicillin', '250mg', 'Three times a day for 7 days' , '2'),
    ('Ibuprofen', '200mg', 'Every 6 hours as needed' , '3'),
    ('Metformin', '500mg', 'Once a day', '4');

select * from client;
