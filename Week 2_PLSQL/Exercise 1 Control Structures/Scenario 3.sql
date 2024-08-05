DECLARE
  CURSOR loan_cursor IS
    SELECT customer_name, loan_amount, due_date
    FROM loans
    WHERE due_date IS NOT NULL AND due_date <= SYSDATE + 30;

  loan_rec loan_cursor%ROWTYPE;

BEGIN
  OPEN loan_cursor;

  LOOP
    FETCH loan_cursor INTO loan_rec;
    EXIT WHEN loan_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Reminder: Loan of $' || TO_CHAR(loan_rec.loan_amount) || ' due on ' || TO_CHAR(loan_rec.due_date, 'DD-MON-YYYY') || ' for customer ' || loan_rec.customer_name);
  END LOOP;

  CLOSE loan_cursor;
END;


