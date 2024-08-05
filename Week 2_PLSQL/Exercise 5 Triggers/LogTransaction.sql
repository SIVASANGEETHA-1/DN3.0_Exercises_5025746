CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
  INSERT INTO AuditLog (TransactionID, TransactionType, Amount, AuditDate)
  VALUES (:NEW.TransactionID, :NEW.TransactionType, :NEW.Amount, SYSTIMESTAMP);
END LogTransaction;
