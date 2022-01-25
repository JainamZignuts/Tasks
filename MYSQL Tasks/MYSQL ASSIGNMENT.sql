-- MYSQL TASKS
/*Create a database in MySQL with the following table
     -Department - id, name, created date
     -Employee - id, name, emp_no, dept_id (refers to Department > id), join_date, end_date
     -Salary - id, emp_id (refers to Employee > id), month, year, amount, generated_date */

create table jainams.Department(
    Dept_ID int NOT NULL AUTO_INCREMENT,
    Dept_name varchar(255),
    created_date DATE,
    PRIMARY KEY(Dept_ID)
);    
create table jainams.Employee(
    Emp_ID int NOT NULL AUTO_INCREMENT,
    Emp_name VARCHAR(255),
    Emp_no VARCHAR(15),
    Dept_ID int NOT NULL,
    join_date DATE,
    end_date DATE,
    PRIMARY KEY(Emp_ID),
    FOREIGN KEY(Dept_ID) REFERENCES Department(Dept_ID)
);
create table jainams.Salary(
    Sal_ID int NOT NULL AUTO_INCREMENT,
    Emp_ID int,
    Sal_Month int,
    Sal_year int,
    Amount int,
    generated_date Date,
    PRIMARY KEY(Sal_ID),
    FOREIGN KEY(Emp_ID) REFERENCES Employee(Emp_ID)
    );
    
-- a) Write a sql queries to insert data in above tables.
-- Department table
INSERT INTO Department VALUES (1,'JS',CURRENT_DATE());
INSERT INTO Department VALUES (2,'PHP',CURRENT_DATE());
INSERT INTO Department VALUES (3,'UI/UX',CURRENT_DATE());
INSERT INTO Department VALUES (4,'JAVA',CURRENT_DATE());
INSERT INTO Department VALUES (5,'Flutter',CURRENT_DATE());
select * from Department; 

-- Employee table
INSERT INTO Employee VALUES (1,'Jainam Shah',9016654500,1,CURRENT_DATE(),ADDDATE(CURRENT_DATE(),INTERVAL 10 YEAR));
INSERT INTO Employee VALUES (2,'Neer Rathod',9099560119,2,CURRENT_DATE(),ADDDATE(CURRENT_DATE(),INTERVAL 7 YEAR));
INSERT INTO Employee VALUES (3,'Dhruv Raval',9825468500,3,CURRENT_DATE(),ADDDATE(CURRENT_DATE(),INTERVAL 15 YEAR));
INSERT INTO Employee VALUES (4,'Dhruv Shah',8200758634,4,CURRENT_DATE(),ADDDATE(CURRENT_DATE(),INTERVAL 5 YEAR));
INSERT INTO Employee VALUES (5,'Soham Raval',7535621895,5,CURRENT_DATE(),ADDDATE(CURRENT_DATE(),INTERVAL 10 YEAR));
SELECT * FROM Employee;

-- Salary table   
INSERT INTO Salary VALUES (1,1,monthname(CURRENT_DATE()),YEAR(CURDATE()),20000,CURRENT_DATE());
INSERT INTO Salary VALUES (2,2,MONTHNAME(ADDDATE(CURDATE(), INTERVAL 1 MONTH)),YEAR(CURDATE()),20500,CURRENT_DATE());
INSERT INTO Salary VALUES (3,3,MONTHNAME(ADDDATE(CURDATE(), INTERVAL 2 MONTH)),YEAR(CURDATE()),25000,CURRENT_DATE());
INSERT INTO Salary VALUES (4,4,MONTHNAME(ADDDATE(CURDATE(), INTERVAL 1 MONTH)),YEAR(CURDATE()),15000,CURRENT_DATE());
INSERT INTO Salary VALUES (5,5,MONTHNAME(ADDDATE(CURDATE(), INTERVAL 2 MONTH)),YEAR(CURDATE()),22000,CURRENT_DATE());
SELECT * FROM Salary;

-- b) Write a sql query to get all employees details along with  department and salary details.
SELECT e.Emp_ID,d.Dept_ID,s.Sal_ID,e.Emp_name,e.Emp_no,e.join_date,e.end_date,d.Dept_name,d.created_date,s.Sal_Month,s.sal_year,s.Amount,s.generated_date
FROM ((Employee AS e
INNER JOIN Department AS d ON e.Dept_ID = d.Dept_ID)
INNER JOIN Salary AS s ON e.Emp_ID= s.Emp_ID);
    
 -- c) Write a sql queries to update data in above tables.
 -- Department table
UPDATE Department SET Dept_name = 'Ruby' WHERE Dept_ID = 4;
UPDATE Department SET created_date = '2022-02-01' WHERE Dept_name = 'Flutter';   
    
-- Employee table
UPDATE Employee SET end_date = '2027-01-31' WHERE Dept_ID = 5;
UPDATE Employee SET Emp_name = 'Darshan Kacha' WHERE Emp_ID = 4;

-- Salary table
UPDATE Salary SET Sal_Month = MONTHNAME(ADDDATE(CURDATE(), INTERVAL 3 MONTH)) WHERE Emp_ID = 5;
UPDATE Salary SET Amount = 25000, generated_date = '2022-02-05' WHERE Sal_ID = 1;
UPDATE Salary SET Amount = 20000, Sal_Month = 'January', generated_date = '2022-02-07' WHERE Sal_ID = 4;

-- d) Write a sql queries to delete data from above tables
-- Department table
DELETE FROM Department WHERE Dept_name = 'Ruby';

-- Employee table
DELETE FROM Employee WHERE Emp_name LIKE 'D_r__a%';

-- Salary table
DELETE FROM Salary ORDER BY Amount LIMIT 1;