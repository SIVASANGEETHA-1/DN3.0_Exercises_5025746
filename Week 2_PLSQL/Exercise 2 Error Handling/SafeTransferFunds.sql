CREATE OR REPLACE PROCEDURE SafeTransferFunds(
  p_from_account_id IN NUMBER,
  p_to_account_id IN NUMBER,
  p_amount IN NUMBER
)
AS
  v_from_balance NUMBER;
  v_to_balance NUMBER;
  v_error_code NUMBER;
  v_error_message VARCHAR2(4000);
BEGIN
  -- Start a new transaction
  BEGIN
    -- Check if the from account has sufficient funds
    SELECT balance INTO v_from_balance
    FROM accounts
    WHERE account_id = p_from_account_id;

    IF v_from_balance < p_amount THEN
      RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in account ' || p_from_account_id);
    END IF;

    -- Check if the to account exists
    SELECT balance INTO v_to_balance
    FROM accounts
    WHERE account_id = p_to_account_id;

    -- Perform the fund transfer
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account_id;

    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_to_account_id;

    -- Commit the transaction
    COMMIT;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_error_code := -20002;
      v_error_message := 'Account not found';
      ROLLBACK;
    WHEN OTHERS THEN
      v_error_code := SQLCODE;
      v_error_message := SQLERRM;
      ROLLBACK;
  END;

  -- Log the error message if an error occurred
  IF v_error_code IS NOT NULL THEN
    INSERT INTO error_log (error_code, error_message, timestamp)
    VALUES (v_error_code, v_error_message, SYSTIMESTAMP);
    RAISE_APPLICATION_ERROR(v_error_code, v_error_message);
  END IF;
END SafeTransferFunds; 



-- To create an error_log table to store the error messages: 

CREATE TABLE error_log (
  error_code NUMBER,
  error_message VARCHAR2(4000),
  timestamp TIMESTAMP
);



