CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
  p_loan_amount IN NUMBER,
  p_interest_rate IN NUMBER,
  p_loan_duration IN NUMBER
)
RETURN NUMBER
AS
  v_monthly_interest_rate NUMBER;
  v_number_of_months NUMBER;
  v_monthly_installment NUMBER;
BEGIN
  -- Convert the interest rate from annual to monthly
  v_monthly_interest_rate := p_interest_rate / 1200;

  -- Calculate the number of months
  v_number_of_months := p_loan_duration * 12;

  -- Calculate the monthly installment using the formula for monthly payments on a fixed-rate loan
  v_monthly_installment := p_loan_amount * v_monthly_interest_rate * POWER(1 + v_monthly_interest_rate, v_number_of_months) / (POWER(1 + v_monthly_interest_rate, v_number_of_months) - 1);

  RETURN v_monthly_installment;
END CalculateMonthlyInstallment;
