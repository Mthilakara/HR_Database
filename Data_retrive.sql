SELECT Country_Name
FROM Countries
JOIN Regions ON Countries.Region_ID = Regions.Region_ID
WHERE Regions.Region_name = 'Asia';

SELECT DISTINCT City
FROM Location;

SELECT City, State_Province, Country_ID
FROM Location;

SELECT d.Department_ID, d.Department_Name
FROM Departments d
JOIN Location l ON d.Location_ID = l.Location_ID
WHERE l.City = 'Colombo';

SELECT DISTINCT j.Job_Title
FROM Jobs j
JOIN Employees e ON j.Job_ID = e.Job_ID
JOIN Departments d ON e.Department_ID = d.Department_ID
JOIN Location l ON d.Location_ID = l.Location_ID
JOIN Countries c ON l.Country_ID = c.Country_ID
WHERE c.Country_Name = 'Sri Lanka';

SELECT DISTINCT j.Job_Title
FROM Jobs j
JOIN Employees e ON j.Job_ID = e.Job_ID
JOIN Departments d ON e.Department_ID = d.Department_ID
JOIN Location l ON d.Location_ID = l.Location_ID
JOIN Countries c ON l.Country_ID = c.Country_ID
JOIN Regions r ON c.Region_ID = r.Region_ID
WHERE j.Min_Salary > 2000
AND r.Region_name = 'Asia';

SELECT DISTINCT e.First_Name, e.Last_Name
FROM Employees e
JOIN Job_history jh ON e.Employee_ID = jh.Employee_ID
WHERE jh.Start_date > '2023-01-01';

SELECT e.First_Name, e.Last_Name, d.Department_Name
FROM Employees e
JOIN Departments d ON e.Department_ID = d.Department_ID
JOIN Employees manager ON e.Manager_ID = manager.Employee_ID
JOIN Departments managerDepartment ON manager.Department_ID = managerDepartment.Department_ID
JOIN Location l ON managerDepartment.Location_ID = l.Location_ID
JOIN Countries c ON l.Country_ID = c.Country_ID
WHERE manager.Employee_ID = 2
AND c.Country_Name = 'Sri Lanka';

SELECT e.First_Name, e.Last_Name, j.Job_Title, l.City
FROM Employees e
JOIN Job_history jh ON e.Employee_ID = jh.Employee_ID
JOIN Jobs j ON jh.Job_ID = j.Job_ID
JOIN Departments d ON jh.Department_ID = d.Department_ID
JOIN Location l ON d.Location_ID = l.Location_ID
WHERE e.Employee_ID = 13;

SELECT DISTINCT l.City, c.Country_Name
FROM Employees e
JOIN Departments d ON e.Department_ID = d.Department_ID
JOIN Jobs j ON e.Job_ID = j.Job_ID
JOIN Location l ON d.Location_ID = l.Location_ID
JOIN Countries c ON l.Country_ID = c.Country_ID
WHERE j.Job_Title = 'Customer Service Representative' AND j.Min_Salary > 1000;

SELECT e.First_Name, e.Last_Name
FROM Employees e
JOIN Job_history jh ON e.Employee_ID = jh.Employee_ID
JOIN Departments d ON jh.Department_ID = d.Department_ID
JOIN Location l ON d.Location_ID = l.Location_ID
JOIN Countries c ON l.Country_ID = c.Country_ID
JOIN Regions r ON c.Region_ID = r.Region_id
WHERE r.Region_name = 'Asia' AND jh.End_date IS NULL;

SELECT d.Department_Name, c.Country_Name, COUNT(e.Employee_ID) AS Software_Engineers_Count
FROM Departments d
JOIN Employees e ON d.Department_ID = e.Department_ID
JOIN Jobs j ON e.Job_ID = j.Job_ID
JOIN Location l ON d.Location_ID = l.Location_ID
JOIN Countries c ON l.Country_ID = c.Country_ID
WHERE j.Job_Title = 'SOFTWARE_ENGINEER'
GROUP BY d.Department_Name, c.Country_Name
HAVING COUNT(e.Employee_ID) > 15;

SELECT e.First_Name, e.Last_Name
FROM Employees e
JOIN Jobs j ON e.Job_ID = j.Job_ID
WHERE j.Job_Title = 'SOFTWARE_ENGINEER'
AND e.Salary >= (SELECT MIN(Salary) + 1000 FROM Employees WHERE Job_ID = j.Job_ID);
