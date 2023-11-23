SELECT
	bg.id,
    bg.name,
    bg.release_year,
    c.name
FROM board_games bg
JOIN categories c ON c.id = bg.category_id
WHERE c.name IN ('Strategy Games', 'Wargames') 
ORDER BY bg.release_year DESC;