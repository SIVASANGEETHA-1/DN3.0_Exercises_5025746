CREATE OR REPLACE PROCEDURE TransferFunds(
  p_source_account_id IN NUMBER,
  p_destination_account_id IN NUMBER,
  p_transfer_amount IN NUMBER
)
AS
  v_source_balance NUMBER;
  v_destination_balance NUMBER;
BEGIN
  -- Check if the source account has sufficient balance
  SELECT balance
  INTO v_source_balance
  FROM Accounts
  WHERE account_id = p_source_account_id;

  IF v_source_balance < p_transfer_amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance in source account');
  END IF;

  -- Debit the source account
  UPDATE Accounts
  SET balance = balance - p_transfer_amount
  WHERE account_id = p_source_account_id;

  -- Credit the destination account
  UPDATE Accounts
  SET balance = balance + p_transfer_amount
  WHERE account_id = p_destination_account_id;

  -- Commit the transaction
  COMMIT;
END TransferFunds;
