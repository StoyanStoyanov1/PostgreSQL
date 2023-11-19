CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
	animal_name VARCHAR(30)
)
LANGUAGE plpgsql AS $$
DECLARE
    owner_name VARCHAR(50);
BEGIN
    SELECT owners.name
    INTO owner_name
    FROM animals
    LEFT JOIN owners ON animals.owner_id = owners.id
    WHERE animals.name = animal_name;

    IF owner_name IS NULL THEN
        owner_name := 'For adoption';
    END IF;

    RAISE INFO '%', owner_name;
END;
$$;


-- Second solution 
CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not (
	IN animal_name VARCHAR(30),
	OUT owner_name VARCHAR(50)
)
LANGUAGE plpgsql 
AS $$  
BEGIN
    owner_name := (SELECT owners.name
    FROM animals
    LEFT JOIN owners ON animals.owner_id = owners.id
    WHERE animals.name = animal_name);

    IF owner_name IS NULL THEN
        owner_name := 'For adoption';
    END IF;
    RAISE INFO '%', owner_name;
END;
$$;

-- To use the stored procedure, you can call it as follows:
CALL sp_animals_with_owners_or_not('Pumpkinseed Sunfish');
CALL sp_animals_with_owners_or_not('Hippo');
CALL sp_animals_with_owners_or_not('Brown bear');