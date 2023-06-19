CREATE TABLE Departments(
	Id INT PRIMARY KEY NOT NULL,
	Name VARCHAR(100) NOT NULL
);

INSERT INTO Departments
VALUES
(1, 'management'),
(2, 'human resources'),
(3, 'marketing'),
(4, 'quality control');

CREATE TABLE Statuses(
	Id INT PRIMARY KEY NOT NULL,
	StatusName VARCHAR(30) NOT NULL
);

INSERT INTO Statuses
VALUES
(1, 'works'),
(2, 'vacation'),
(3, 'fired');

CREATE TABLE Employees(
	Id INT PRIMARY KEY NOT NULL,
	DepartmentId INT NOT NULL,
	StatusId INT NOT NULL,
	Name VARCHAR(150) NOT NULL,
	DateOfBirth DATE NOT NULL,
	EmploymentDate DATE NOT NULL,
	Salary DECIMAL NOT NULL,
	FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
	FOREIGN KEY (StatusId) REFERENCES Statuses(Id)
);

INSERT INTO Employees
VALUES
(1,1,1,'Борисов Максим Александрович','1980-04-27','2014-02-16',22477),
(2,2,1,'Кириллова Милана Никитична','1978-08-09','2014-09-22',40041),
(3,3,1,'Соколова Милана Елисеевна','1980-03-01','2010-02-03',31415),
(4,4,1,'Григорьева Алиса Егоровна','1973-06-11','2011-12-09',27850),
(5,1,1,'Горшков Илья Фёдорович','1978-04-26','2010-10-28',9500),
(6,2,2,'Игнатьев Матвей Михайлович','1974-08-05','2013-06-03',46338),
(7,3,2,'Голованов Роман Григорьевич','1975-06-03','2015-02-14',18965),
(8,4,1,'Захаров Матвей Денисович','1971-05-24','2015-02-12',9800),
(9,4,1,'Морозова Алисия Ивановна','1950-01-24','2000-02-12',28000)

SELECT Departments.Name, Statuses.StatusName, Employees.Name, Employees.DateOfBirth, Employees.EmploymentDate, Employees.Salary
FROM Employees
INNER JOIN Departments ON Employees.DepartmentId = Departments.Id
INNER JOIN Statuses ON Employees.StatusId = Statuses.Id;

SELECT Employees.Name, EmploymentDate, Departments.Name FROM Employees
INNER JOIN Departments ON Employees.DepartmentId = Departments.Id
WHERE Employees.Salary > 10000;

UPDATE Employees
SET Salary=15000
WHERE Salary < 15000;

DELETE FROM Employees 
WHERE DateOfBirth < CURRENT_DATE - INTERVAL '70 years';



