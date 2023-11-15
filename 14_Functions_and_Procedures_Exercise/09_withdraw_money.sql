CREATE OR REPLACE PROCEDURE sp_withdraw_money(
    account_id INT,
    money_amount NUMERIC(20, 4)
)
LANGUAGE plpgsql
AS 
$$
DECLARE
    current_balance NUMERIC(20, 4);
BEGIN
    current_balance := (SELECT balance
    	FROM accounts
    	WHERE id = account_id
	   );

    IF current_balance >= money_amount THEN
        UPDATE accounts
        SET balance = balance - money_amount
        WHERE id = account_id;

        COMMIT;
    ELSE
        RAISE NOTICE 'Insufficient balance for withdrawal %', money_amount;
    END IF;
END;
$$;