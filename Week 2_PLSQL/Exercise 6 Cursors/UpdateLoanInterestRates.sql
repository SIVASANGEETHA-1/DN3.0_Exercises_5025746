DECLARE
  -- Define the cursor to retrieve all loans
  CURSOR loan_cur IS
    SELECT LoanID, InterestRate, LoanType
    FROM Loans;

  -- Variable to store the loan data
  loan_rec loan_cur%ROWTYPE;

  -- New interest rates based on the new policy
  v_new_interest_rate NUMBER;

BEGIN
  -- Open the loan cursor
  OPEN loan_cur;

  -- Loop through each loan
  LOOP
    FETCH loan_cur INTO loan_rec;
    EXIT WHEN loan_cur%NOTFOUND;

    -- Determine the new interest rate based on the loan type
    CASE loan_rec.LoanType
      WHEN 'PERSONAL' THEN
        v_new_interest_rate := 0.08;  -- 8% interest rate for personal loans
      WHEN 'MORTGAGE' THEN
        v_new_interest_rate := 0.05;  -- 5% interest rate for mortgage loans
      WHEN 'AUTO' THEN
        v_new_interest_rate := 0.06;  -- 6% interest rate for auto loans
      ELSE
        v_new_interest_rate := 0.07;  -- 7% interest rate for other loan types
    END CASE;

    -- Update the interest rate for the loan
    UPDATE Loans
    SET InterestRate = v_new_interest_rate
    WHERE LoanID = loan_rec.LoanID;

    -- Commit the change
    COMMIT;

    -- Print a message indicating the interest rate was updated
    DBMS_OUTPUT.PUT_LINE('Interest rate updated to '| TO_CHAR(v_new_interest_rate, '99.99') || '% for loan '| loan_rec.LoanID);
  END LOOP;

  -- Close the loan cursor
  CLOSE loan_cur;
END UpdateLoanInterestRates;
