DECLARE
  CURSOR customer_cursor IS
    SELECT customer_id, balance
    FROM customers
    WHERE balance IS NOT NULL;

  customer_rec customer_cursor%ROWTYPE;

BEGIN
  OPEN customer_cursor;

  LOOP
    FETCH customer_cursor INTO customer_rec;
    EXIT WHEN customer_cursor%NOTFOUND;

    IF customer_rec.balance > 10000 THEN
      UPDATE customers
      SET is_vip = TRUE
      WHERE customer_id = customer_rec.customer_id;
    END IF;
  END LOOP;

  CLOSE customer_cursor;
END;
