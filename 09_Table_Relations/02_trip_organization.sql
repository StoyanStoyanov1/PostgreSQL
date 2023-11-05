SELECT
	v.driver_id,
	v.vehicle_type,
	concat(c.first_name, ' ', c.last_name) AS driver_name	
FROM campers AS c 
JOIN vehicles AS v
ON c.id = v.driver_id;