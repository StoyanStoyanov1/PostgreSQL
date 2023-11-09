SELECT COUNT(*)
FROM bookings AS b
INNER JOIN customers AS c
USING (customer_id)
WHERE c.last_name = 'Hahn';
