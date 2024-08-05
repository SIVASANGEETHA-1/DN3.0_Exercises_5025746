CREATE OR REPLACE PROCEDURE UpdateSalary(
  p_employee_id IN NUMBER,
  p_percentage IN NUMBER
)
AS
  v_current_salary NUMBER;
  v_new_salary NUMBER;
  v_error_code NUMBER;
  v_error_message VARCHAR2(4000);
BEGIN
  -- Start a new transaction
  BEGIN
    -- Check if the employee ID exists
    SELECT salary INTO v_current_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    -- Calculate the new salary
    v_new_salary := v_current_salary * (1 + p_percentage / 100);

    -- Update the employee's salary
    UPDATE employees
    SET salary = v_new_salary
    WHERE employee_id = p_employee_id;

    -- Commit the transaction
    COMMIT;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_error_code := -20001;
      v_error_message := 'Employee ID not found';
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
END UpdateSalary; 



--To create an error_log table to store the error messages:
CREATE TABLE error_log (
  error_code NUMBER,
  error_message VARCHAR2(4000),
  timestamp TIMESTAMP
);
