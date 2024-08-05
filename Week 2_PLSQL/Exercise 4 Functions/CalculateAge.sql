CREATE OR REPLACE FUNCTION CalculateAge(
  p_date_of_birth IN DATE
)
RETURN NUMBER
AS
  v_current_date DATE;
  v_age NUMBER;
BEGIN
  -- Get the current date
  v_current_date := SYSTIMESTAMP;

  -- Calculate the age in years
  v_age := TRUNC(MONTHS_BETWEEN(v_current_date, p_date_of_birth) / 12);

  RETURN v_age;
END CalculateAge;
