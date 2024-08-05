CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
  v_interest_rate NUMBER := 0.01; -- 1% interest rate
BEGIN
  -- Update the balance of all savings accounts
  BEGIN
    UPDATE SavingsAccounts
    SET balance = balance * (1 + v_interest_rate);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20001, 'Error processing monthly interest');
  END;
END ProcessMonthlyInterest;
