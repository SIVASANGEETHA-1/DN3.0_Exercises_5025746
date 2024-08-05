CREATE OR REPLACE PACKAGE CustomerManagement AS
  PROCEDURE AddNewCustomer(p_CustomerID NUMBER, p_Name VARCHAR2, p_DOB DATE, p_Balance NUMBER);
  PROCEDURE UpdateCustomerDetails(p_CustomerID NUMBER, p_Name VARCHAR2, p_DOB DATE);
  FUNCTION GetCustomerBalance(p_CustomerID NUMBER) RETURN NUMBER;
END CustomerManagement;

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS
  PROCEDURE AddNewCustomer(p_CustomerID NUMBER, p_Name VARCHAR2, p_DOB DATE, p_Balance NUMBER) IS
  BEGIN
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_CustomerID, p_Name, p_DOB, p_Balance, SYSDATE);
  END AddNewCustomer;

  PROCEDURE UpdateCustomerDetails(p_CustomerID NUMBER, p_Name VARCHAR2, p_DOB DATE) IS
  BEGIN
    UPDATE Customers
    SET Name = p_Name, DOB = p_DOB, LastModified = SYSDATE
    WHERE CustomerID = p_CustomerID;
  END UpdateCustomerDetails;

  FUNCTION GetCustomerBalance(p_CustomerID NUMBER) RETURN NUMBER IS
    v_Balance NUMBER;
  BEGIN
    SELECT SUM(Balance) INTO v_Balance
    FROM Accounts
    WHERE CustomerID = p_CustomerID;
    RETURN v_Balance;
  END GetCustomerBalance;
END CustomerManagement;
