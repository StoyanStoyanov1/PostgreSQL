CREATE OR REPLACE FUNCTION fn_is_word_comprised(
    letters VARCHAR (50),
    word VARCHAR (50)
)
RETURNS BOOLEAN
AS
$$
DECLARE
    normalized_letters VARCHAR(50);
    normalized_word VARCHAR(50);
    i INT;
    letter CHAR;
    found_all_letters BOOLEAN := TRUE;
BEGIN
    normalized_letters := LOWER(letters);
    normalized_word := LOWER(word);

    FOR i IN 1..LENGTH(normalized_word) LOOP
        letter := SUBSTRING(normalized_word FROM i FOR 1);
        IF POSITION(letter IN normalized_letters) = 0 THEN
            found_all_letters := FALSE;
            EXIT;
        ELSE
            normalized_letters := REGEXP_REPLACE(normalized_letters, letter, '', 1, 1);
        END IF;
    END LOOP;

    RETURN found_all_letters;
END;
$$
LANGUAGE plpgsql;