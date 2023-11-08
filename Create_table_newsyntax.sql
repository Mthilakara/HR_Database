CREATE TABLE Regions (
    Region_id INT PRIMARY KEY,
    Region_name VARCHAR(25)
);
CREATE TABLE Countries (
    Country_ID CHAR(2) PRIMARY KEY,
    Country_Name VARCHAR(40),
    Region_ID INT,
    FOREIGN KEY (Region_ID) REFERENCES Regions(Region_ID)
);
CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    Street_Address VARCHAR(25),
    Postal_Code VARCHAR(25),
    City VARCHAR(25),
    State_Province VARCHAR(25),
    Country_ID CHAR(2),
    FOREIGN KEY (Country_ID) REFERENCES Countries(Country_ID)
);
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(30),
    Manager_ID INT,
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Email VARCHAR(25),
    Phone_Number VARCHAR(25),
    Hire_Date DATE,
    Job_ID VARCHAR(10),
    Salary INT,
    Commission_Pct INT,
    Manager_ID INT,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
    FOREIGN KEY (Job_ID) REFERENCES Jobs(Job_ID)
);

CREATE TABLE Jobs (
    Job_ID VARCHAR(20) PRIMARY KEY,
    Job_Title VARCHAR(35),
    Min_Salary INT,
    Max_Salary INT
);

CREATE TABLE Job_history (
    Employee_ID INT,
    Start_date DATE,
    End_date DATE,
    Job_ID VARCHAR(10),
    Department_ID INT,
    PRIMARY KEY (Employee_ID, Start_date),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID),
    FOREIGN KEY (Job_ID) REFERENCES Jobs(Job_ID),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Job_Grades (
    Grade_Level VARCHAR(2) PRIMARY KEY,
    Lowest_Sal INT,
    Highest_Sal INT
);