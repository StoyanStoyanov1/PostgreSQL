SELECT
    a.name AS address,
    CASE
        WHEN EXTRACT(HOUR FROM co.start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
    co.bill,
    cl.full_name,
    ca.make,
    ca.model,
    cat.name AS category_name
FROM courses co
JOIN addresses a ON co.from_address_id = a.id
JOIN clients cl ON co.client_id = cl.id
JOIN cars ca ON co.car_id = ca.id
JOIN categories cat ON ca.category_id = cat.id
ORDER BY co.id;
