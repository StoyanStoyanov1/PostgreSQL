CREATE OR REPLACE PROCEDURE sp_transfer_money(
    sender_id INT,
    receiver_id INT,
    amount NUMERIC(10, 4)
)
LANGUAGE plpgsql
AS 
$$
BEGIN
    CALL sp_withdraw_money(sender_id, amount);
	UPDATE accounts
	SET balance = balance + amount
	WHERE id = receiver_id;
END;
$$;