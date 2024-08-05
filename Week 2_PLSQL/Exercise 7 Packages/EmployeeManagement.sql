CREATE OR REPLACE PACKAGE EmployeeManagement AS
  PROCEDURE HireNewEmployee(p_EmployeeID NUMBER, p_Name VARCHAR2, p_Position VARCHAR2, p_Salary NUMBER, p_Department VARCHAR2, p_HireDate DATE);
  PROCEDURE UpdateEmployeeDetails(p_EmployeeID NUMBER, p_Name VARCHAR2, p_Position VARCHAR2, p_Salary NUMBER, p_Department VARCHAR2);
  FUNCTION CalculateAnnualSalary(p_EmployeeID NUMBER) RETURN NUMBER;
END EmployeeManagement;

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS
  PROCEDURE HireNewEmployee(p_EmployeeID NUMBER, p_Name VARCHAR2, p_Position VARCHAR2, p_Salary NUMBER, p_Department VARCHAR2, p_HireDate DATE) IS
  BEGIN
    INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
    VALUES (p_EmployeeID, p_Name, p_Position, p_Salary, p_Department, p_HireDate);
  END HireNewEmployee;

  PROCEDURE UpdateEmployeeDetails(p_EmployeeID NUMBER, p_Name VARCHAR2, p_Position VARCHAR2, p_Salary NUMBER, p_Department VARCHAR2) IS
  BEGIN
    UPDATE Employees
    SET Name = p_Name, Position = p_Position, Salary = p_Salary, Department = p_Department
    WHERE EmployeeID = p_EmployeeID;
  END UpdateEmployeeDetails;

  FUNCTION CalculateAnnualSalary(p_EmployeeID NUMBER) RETURN NUMBER IS
    v_Salary NUMBER;
  BEGIN
    SELECT Salary INTO v_Salary
    FROM Employees
    WHERE EmployeeID = p_EmployeeID;
    RETURN v_Salary * 12;
  END CalculateAnnualSalary;
END EmployeeManagement;

