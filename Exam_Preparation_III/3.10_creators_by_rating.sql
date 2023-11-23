SELECT 
	c.last_name,
	ceil(avg(bg.rating)) AS average_rating,
	p.name AS publisher_name
FROM creators c
JOIN creators_board_games cbg ON cbg.creator_id = c.id
JOIN board_games bg ON bg.id = cbg.board_game_id
JOIN publishers p ON p.id = bg.publisher_id
WHERE p.name = 'Stonemaier Games'
GROUP BY c.last_name, p.name
ORDER BY average_rating DESC;