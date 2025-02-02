
-- Table Schemas

CREATE TABLE Titles (
    Title_ID VARCHAR(5)   NOT NULL,
    Title VARCHAR(50)   NOT NULL,
    PRIMARY KEY (Title_ID)
);

CREATE TABLE Employees (
    Emp_No INTEGER NOT NULL,
    Title_ID VARCHAR(5) NOT NULL,
    Birth_Date DATE NOT NULL, 
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100) NOT NULL,
    Sex VARCHAR(1) NOT NULL,
    Hire_Date DATE NOT NULL, 
    PRIMARY KEY (Emp_No),
    FOREIGN KEY (Title_ID) REFERENCES Titles (Title_ID)
);

CREATE TABLE Salaries (
    Emp_No INTEGER   NOT NULL,
    Salary INTEGER   NOT NULL,
    PRIMARY KEY (Emp_No),
	FOREIGN KEY(Emp_No)REFERENCES Employees (Emp_No)
);

CREATE TABLE Departments (
    Dept_No VARCHAR(5)   NOT NULL,
    Dept_Name VARCHAR(50)   NOT NULL,
    PRIMARY KEY (Dept_No)
);

CREATE TABLE Department_Employees_Junction (
    Emp_No INTEGER   NOT NULL,
    Dept_No VARCHAR(5)   NOT NULL,
    PRIMARY KEY (Emp_No,Dept_No),
	FOREIGN KEY(Emp_No)REFERENCES Employees (Emp_No),
	FOREIGN KEY(Dept_No)REFERENCES Departments (Dept_No)
);

CREATE TABLE Department_Manager_Junction (
    Dept_No VARCHAR(5)   NOT NULL,
    Emp_No INTEGER   NOT NULL,
    PRIMARY KEY (Dept_No,Emp_No),
	FOREIGN KEY(Dept_No)REFERENCES Departments (Dept_No),
	FOREIGN KEY(Emp_No)REFERENCES Employees (Emp_No)
);

Select * from Titles
Select * from Employees 
Select * from Salaries
Select * from Departments
Select * from Department_Employees_Junction
Select * from Department_Manager_Junction

