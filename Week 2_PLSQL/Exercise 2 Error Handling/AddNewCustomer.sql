CREATE OR REPLACE PROCEDURE AddNewCustomer(
  p_customer_id IN NUMBER,
  p_name IN VARCHAR2,
  p_email IN VARCHAR2,
  p_phone IN VARCHAR2,
  p_address IN VARCHAR2
)
AS
  v_error_code NUMBER;
  v_error_message VARCHAR2(4000);
BEGIN
  -- Start a new transaction
  BEGIN
    -- Check if a customer with the same ID already exists
    IF EXISTS (SELECT 1 FROM Customers WHERE customer_id = p_customer_id) THEN
      v_error_code := -20001;
      v_error_message := 'Customer ID already exists';
      RAISE_APPLICATION_ERROR(v_error_code, v_error_message);
    END IF;

    -- Insert the new customer
    INSERT INTO Customers (customer_id, name, email, phone, address)
    VALUES (p_customer_id, p_name, p_email, p_phone, p_address);

    -- Commit the transaction
    COMMIT;
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      v_error_code := -20002;
      v_error_message := 'Duplicate customer ID';
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
  END IF;
END AddNewCustomer;


-- to create an error_log table to store the error messages:

CREATE TABLE error_log (
  error_code NUMBER,
  error_message VARCHAR2(4000),
  timestamp TIMESTAMP
);
