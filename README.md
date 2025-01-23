# Home-Care-Company-Database
Project Title: Home Care Company Database

Team Members: Diana Nalivaiko, Roberto Rojas Perez, and Asal Mojtabaei

System Used: MySQL

In our Database Systems Management class, we developed a database for the Home Care Company, which provides healthcare assistance to seniors and disabled individuals. This database was designed to manage the company’s operations, including storing and tracking vital information about clients, nurses, and their interactions.

Project Overview:

The database includes the following key functionalities:

Client Information Management: Stores details about clients, such as their name, contact information, address, date of birth, and a brief description of their health conditions. Emergency contacts and prescribed medications are also tracked.
Nurse Information Management: Tracks data about nurses, including their names, contact details, Health Ministry registration numbers, and other professional credentials.
Contracts: Each client signs a contract with the company, and the database stores information about these agreements, including start and end dates.
Visit Reports: Nurses submit detailed reports after each client visit. These reports include whether the visit occurred on schedule, the client's health condition, and the services provided.
Substitute Nurses: In cases where a nurse cannot attend a scheduled visit, the system records the substitution details, including the substitute nurse's information and the duration of the substitution.
Billing and Supervision: Tracks client billing information and records hierarchical relationships among nurses, including supervisors and supervisees.

Technical Highlights:

Entity-Relationship Modeling: We created an ER diagram to represent the relationships between entities, including nurses, clients, contracts, reports, and more.
Database Normalization: The database was normalized to BCNF to eliminate redundancy and maintain data integrity.
SQL Implementation: We wrote SQL scripts for creating tables, inserting data, and querying information efficiently.
