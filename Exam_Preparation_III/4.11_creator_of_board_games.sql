CREATE OR REPLACE FUNCTION fn_creator_with_board_games(
    IN first_name VARCHAR(30)
)
RETURNS INTEGER
AS
$$
DECLARE
    total_games INT;
BEGIN
    total_games := (
        SELECT COUNT(*)
        FROM creators c
        JOIN creators_board_games cbg ON c.id = cbg.creator_id
        WHERE c.first_name = fn_creator_with_board_games.first_name
    );
    RETURN total_games;
END;
$$
LANGUAGE plpgsql;