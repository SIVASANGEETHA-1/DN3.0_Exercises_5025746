DECLARE
  CURSOR customer_cursor IS
    SELECT customer_id, date_of_birth, loan_interest_rate
    FROM customers
    WHERE date_of_birth IS NOT NULL AND loan_interest_rate IS NOT NULL;

  customer_rec customer_cursor%ROWTYPE;
  discount_rate NUMBER := 0.01;  -- 1% discount
  new_interest_rate NUMBER;

BEGIN
  OPEN customer_cursor;

  LOOP
    FETCH customer_cursor INTO customer_rec;
    EXIT WHEN customer_cursor%NOTFOUND;

    IF TRUNC(MONTHS_BETWEEN(SYSDATE, customer_rec.date_of_birth) / 12) > 60 THEN
      new_interest_rate := customer_rec.loan_interest_rate - (customer_rec.loan_interest_rate * discount_rate);
      UPDATE customers
      SET loan_interest_rate = new_interest_rate
      WHERE customer_id = customer_rec.customer_id;
    END IF;
  END LOOP;

  CLOSE customer_cursor;
END;
