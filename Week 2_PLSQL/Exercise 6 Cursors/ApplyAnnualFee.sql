DECLARE
  -- Define the cursor to retrieve all accounts
  CURSOR account_cur IS
    SELECT AccountID, Balance
    FROM Accounts;

  -- Variable to store the annual fee
  v_annual_fee NUMBER := 25.00;  -- assume an annual fee of $25.00

  -- Variable to store the account data
  account_rec account_cur%ROWTYPE;

BEGIN
  -- Open the account cursor
  OPEN account_cur;

  -- Loop through each account
  LOOP
    FETCH account_cur INTO account_rec;
    EXIT WHEN account_cur%NOTFOUND;

    -- Check if the account has sufficient balance to deduct the annual fee
    IF account_rec.Balance >= v_annual_fee THEN
      -- Deduct the annual fee from the account balance
      UPDATE Accounts
      SET Balance = Balance - v_annual_fee
      WHERE AccountID = account_rec.AccountID;

      -- Commit the change
      COMMIT;

      -- Print a message indicating the annual fee was deducted
      DBMS_OUTPUT.PUT_LINE('Annual fee of $' || TO_CHAR(v_annual_fee, '99.99') || 'educted from account '| account_rec.AccountID);
    ELSE
      -- Print a message indicating the account has insufficient balance
      DBMS_OUTPUT.PUT_LINE('Insufficient balance in account '| account_rec.AccountID || 'o deduct annual fee');
    END IF;
  END LOOP;

  -- Close the account cursor
  CLOSE account_cur;
END ApplyAnnualFee;
