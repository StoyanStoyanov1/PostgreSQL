WITH searched_players AS (
    SELECT
        p.id,
        CONCAT(p.first_name, ' ', p.last_name) AS full_name,
        p.age,
        p.position,
        p.salary,
        s.pace,
        s.shooting
    FROM players p
    JOIN skills_data s ON p.skills_data_id = s.id
    WHERE p.position = 'A' AND p.team_id IS NULL
)
SELECT *
FROM searched_players
WHERE pace + shooting > 130;