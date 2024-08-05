CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  p_department_id IN NUMBER,
  p_bonus_percentage IN NUMBER
)
AS
  v_bonus_amount NUMBER;
BEGIN
  -- Calculate the bonus amount based on the bonus percentage
  v_bonus_amount := p_bonus_percentage / 100;

  -- Update the salary of employees in the given department
  UPDATE Employees
  SET salary = salary * (1 + v_bonus_amount)
  WHERE department_id = p_department_id;

  -- Commit the transaction
  COMMIT;
END UpdateEmployeeBonus;
