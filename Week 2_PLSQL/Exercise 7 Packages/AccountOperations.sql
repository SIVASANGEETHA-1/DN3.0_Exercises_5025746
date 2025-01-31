CREATE OR REPLACE PACKAGE AccountOperations AS
  PROCEDURE OpenNewAccount(p_AccountID NUMBER, p_CustomerID NUMBER, p_AccountType VARCHAR2, p_Balance NUMBER);
  PROCEDURE CloseAccount(p_AccountID NUMBER);
  FUNCTION GetTotalBalance(p_CustomerID NUMBER) RETURN NUMBER;
END AccountOperations;

CREATE OR REPLACE PACKAGE BODY AccountOperations AS
  PROCEDURE OpenNewAccount(p_AccountID NUMBER, p_CustomerID NUMBER, p_AccountType VARCHAR2, p_Balance NUMBER) IS
  BEGIN
    INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
    VALUES (p_AccountID, p_CustomerID, p_AccountType, p_Balance, SYSDATE);
  END OpenNewAccount;

  PROCEDURE CloseAccount(p_AccountID NUMBER) IS
  BEGIN
    UPDATE Accounts
    SET LastModified = SYSDATE
    WHERE AccountID = p_AccountID;
  END CloseAccount;

  FUNCTION GetTotalBalance(p_CustomerID NUMBER) RETURN NUMBER IS
    v_Balance NUMBER;
  BEGIN
    SELECT SUM(Balance) INTO v_Balance
    FROM Accounts
    WHERE CustomerID = p_CustomerID;
    RETURN v_Balance;
  END GetTotalBalance;
END AccountOperations;
