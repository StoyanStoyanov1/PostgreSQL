CREATE OR REPLACE PROCEDURE sp_players_team_name (
    player_name VARCHAR(50),
    OUT team_name VARCHAR(45)
)
AS
$$
BEGIN
    team_name := (
		SELECT t.name
		FROM players p
		LEFT JOIN teams t ON p.team_id = t.id
		WHERE CONCAT(p.first_name, ' ', p.last_name) = player_name
	);

    IF team_name IS NULL THEN
        team_name := 'The player currently has no team';
    END IF;
END;
$$
LANGUAGE plpgsql;