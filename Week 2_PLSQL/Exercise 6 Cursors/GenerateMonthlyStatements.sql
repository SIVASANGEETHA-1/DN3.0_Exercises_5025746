DECLARE
  -- Define the cursor to retrieve all customers
  CURSOR customer_cur IS
    SELECT CustomerID, Name
    FROM Customers;

  -- Define the cursor to retrieve all transactions for the current month
  CURSOR transaction_cur (p_customer_id IN NUMBER) IS
    SELECT TransactionID, TransactionType, Amount, TransactionDate
    FROM Transactions
    WHERE CustomerID = p_customer_id
    AND TRUNC(TransactionDate, 'MM') = TRUNC(SYSDATE, 'MM');

  -- Variables to store customer and transaction data
  customer_rec customer_cur%ROWTYPE;
  transaction_rec transaction_cur%ROWTYPE;

  -- Variables to store the statement details
  v_statement VARCHAR2(200);
  v_total_deposits NUMBER := 0;
  v_total_withdrawals NUMBER := 0;
  v_balance NUMBER := 0;

BEGIN
  -- Open the customer cursor
  OPEN customer_cur;

  -- Loop through each customer
  LOOP
    FETCH customer_cur INTO customer_rec;
    EXIT WHEN customer_cur%NOTFOUND;

    -- Initialize the statement details
    v_total_deposits := 0;
    v_total_withdrawals := 0;
    v_balance := 0;

    -- Open the transaction cursor for the current customer
    OPEN transaction_cur(customer_rec.CustomerID);

    -- Loop through each transaction for the current customer
    LOOP
      FETCH transaction_cur INTO transaction_rec;
      EXIT WHEN transaction_cur%NOTFOUND;

      -- Update the statement details
      IF transaction_rec.TransactionType = 'DEPOSIT' THEN
        v_total_deposits := v_total_deposits + transaction_rec.Amount;
      ELSIF transaction_rec.TransactionType = 'WITHDRAWAL' THEN
        v_total_withdrawals := v_total_withdrawals + transaction_rec.Amount;
      END IF;

      v_balance := v_balance + transaction_rec.Amount;
    END LOOP;

    -- Close the transaction cursor
    CLOSE transaction_cur;

    -- Generate the statement for the current customer
    v_statement := 'Statement for '| customer_rec.Name || ' '| TO_CHAR(SYSDATE, 'Month YYYY');
    v_statement := v_statement || CHR(10) || 'Total Deposits: '| TO_CHAR(v_total_deposits, '99,999.99');
    v_statement := v_statement || CHR(10) || 'Total Withdrawals: '| TO_CHAR(v_total_withdrawals, '99,999.99');
    v_statement := v_statement || CHR(10) || 'Balance: '| TO_CHAR(v_balance, '99,999.99');

    -- Print the statement
    DBMS_OUTPUT.PUT_LINE(v_statement);
  END LOOP;

  -- Close the customer cursor
  CLOSE customer_cur;
END GenerateMonthlyStatements;
