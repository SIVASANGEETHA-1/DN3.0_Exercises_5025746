CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
  v_balance NUMBER;
BEGIN
  IF :NEW.TransactionType = 'WITHDRAWAL' THEN
    SELECT Balance INTO v_balance
    FROM Accounts
    WHERE AccountID = :NEW.AccountID;
    
    IF v_balance < :NEW.Amount THEN
      RAISE_APPLICATION_ERROR(-20001, 'Withdrawal amount exceeds balance');
    END IF;
  ELSIF :NEW.TransactionType = 'DEPOSIT' THEN
    IF :NEW.Amount <= 0 THEN
      RAISE_APPLICATION_ERROR(-20002, 'Deposit amount must be positive');
    END IF;
  END IF;
END CheckTransactionRules;
