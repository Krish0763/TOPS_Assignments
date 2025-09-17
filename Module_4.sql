CREATE database assignment;
USE assignment;

CREATE table company(
	companyID int,
    companyName varchar(45),
    street varchar(45),
    city varchar(45),
    state varchar(2),
    zip varchar(10)
);

CREATE table contact(
	contactID int,
    comapnyID int,
    FirstName varchar(45),
    LastName varchar(45),
    street varchar(45),
    city varchar(45),
    state varchar(2),
    zip varchar(10),
    IsMain boolean,
    email varchar(45),
    phone varchar(12)
);

CREATE table contactemployee(
	ContactEmployeeID int,
    ContactID int,
    EmployeeID int,
    ContactDate date,
    Description varchar(100)
);

CREATE table employee(
	EmployeeID int,
    FirstName varchar(45),
    LastName varchar(45),
    Salary decimal(10,2),
    HireDate date,
    JobTitle varchar(25),
    Email varchar(45),
    Phone varchar(12)
);

SET SQL_SAFE_UPDATES = 0;

#Question - 4
UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

#Question - 5
UPDATE Company
SET CompanyName = "Urban Outfitters" 
WHERE CompanyID = 24;

#Question - 6
DELETE ContactEmployee
FROM ContactEmployee
JOIN Contact 
ON Contact.ContactID = ContactEmployee.ContactID
JOIN Employee 
ON Employee.EmployeeID = ContactEmployee.EmployeeID
WHERE Contact.FirstName = 'Dianne' 
  AND Contact.LastName = 'Connor'
  AND Employee.FirstName = 'Jack' 
  AND Employee.LastName = 'Lee';
  
#Question - 7
SELECT DISTINCT
	Employee.FirstName, 
    Employee.LastName
FROM Company
JOIN Contact 
ON Company.CompanyID = Contact.CompanyID
JOIN ContactEmployee 
ON Contact.ContactID = ContactEmployee.ContactID
JOIN Employee 
ON Employee.EmployeeID = ContactEmployee.EmployeeID
WHERE Company.CompanyName = 'Toll Brothers';
	
SELECT * FROM Employee; 
SELECT * FROM Company;
SELECT * FROM ContactEmployee;
SELECT * FROM Contact;

/*
#Question - 8 = Significance of % and _ in operators in the LIKE statement?
Answer: % = matches zero or more characters.
Example: WHERE name LIKE 'A%' → “A”, “Andy”, “Anita”.

Answer: _ = matches exactly one character.
Example: WHERE code LIKE 'A_3' → “AA3”, “AB3”, but not “A33” or “A3”.

#Question - 9 = Explain Normalization in context of database.
Asnwer: Normalization organizes data to minimize redundancy and improve integrity. Typical normal forms:

Types :-
1NF: Atomic columns; no repeating groups (each cell single value).
2NF: 1NF + every non-key attribute fully depends on the whole primary key (fix partial dependency in composite keys).
3NF: 2NF + no transitive dependencies (non-key attrs depend only on the key).

BCNF: Stronger 3NF; every determinant is a candidate key.
Benefits: less duplication, fewer update anomalies, clearer relationships; often queried with JOINs.

#Question - 10 = What does a JOIN in MySQL mean?
Answer: A JOIN combines rows from two (or more) tables based on a related column (usually a key), producing a single result set.

#Question - 11 = What do you understand about DDL, DCL, and DML in MySQL?
Asnwer: DDL (Data Definition Language): defines/changes schema objects.
Examples: CREATE, ALTER, DROP, TRUNCATE, RENAME.

DML (Data Manipulation Language): reads/changes table data.
Examples: SELECT, INSERT, UPDATE, DELETE.

DCL (Data Control Language): permissions and security.
Examples: GRANT, REVOKE.

#Question - 12 = What is the role of the MySQL JOIN clause in a query, and what are some common types of joints?
Asnwer:
Role: To query across normalized tables by relating keys, so you can retrieve coherent business entities in one result set (e.g., employees with their contacts/companies). It enables powerful filtering/aggregation over multiple tables.

Common types:
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
CROSS JOIN
SELF JOIN
*/