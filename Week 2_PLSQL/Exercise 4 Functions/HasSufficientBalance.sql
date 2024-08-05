CREATE OR REPLACE FUNCTION HasSufficientBalance(
  p_account_id IN NUMBER,
  p_amount IN NUMBER
)
RETURN BOOLEAN
AS
  v_balance NUMBER;
BEGIN
  -- Retrieve the current balance for the specified account ID
  SELECT balance
  INTO v_balance
  FROM accounts
  WHERE account_id = p_account_id;

  -- Check if the balance is sufficient
  IF v_balance >= p_amount THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END HasSufficientBalance;

