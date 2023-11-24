SELECT 
	concat(c.first_name, ' ', c.last_name) AS full_name,
	c.email,
	max(bg.rating)
FROM creators c
JOIN creators_board_games cbg ON cbg.creator_id = c.id
JOIN board_games bg ON bg.id = cbg.board_game_id
WHERE c.email LIKE '%.com'
GROUP BY full_name, c.email
ORDER BY full_name;