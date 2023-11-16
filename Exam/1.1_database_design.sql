CREATE TABLE towns (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45) NOT NULL
);

CREATE TABLE stadiums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	capacity INTEGER CHECK(capacity > 0) NOT NULL,
	town_id INTEGER NOT NULL,
	
	CONSTRAINT fk_stadiums_towns
	FOREIGN KEY (town_id)
	REFERENCES towns(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE teams (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	established DATE NOT NULL,
	fan_base INTEGER CHECK (fan_base >= 0) DEFAULT 0 NOT NULL,
	stadium_id INTEGER NOT NULL,
	
	CONSTRAINT fk_teams_stadiums
	FOREIGN KEY (stadium_id)
	REFERENCES stadiums(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE coaches (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(10) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	salary NUMERIC(10, 2) CHECK(salary >= 0) DEFAULT 0 NOT NULL,
	coach_level INTEGER CHECK(coach_level >= 0) DEFAULT 0 NOT NULL
);

CREATE TABLE skills_data (
	id SERIAL PRIMARY KEY,
	dribbling INTEGER CHECK(dribbling >= 0) DEFAULT 0,
	pace INTEGER CHECK(pace >= 0) DEFAULT 0,
	passing INTEGER CHECK(passing >= 0) DEFAULT 0,
	shooting INTEGER CHECK(shooting >= 0) DEFAULT 0,
	speed INTEGER CHECK(speed >= 0) DEFAULT 0,
	strength INTEGER CHECK(strength >= 0) DEFAULT 0
);

CREATE TABLE players (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(10) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	age INTEGER CHECK(age >= 0) DEFAULT 0 NOT NULL,
	position CHAR(1) NOT NULL,
	salary NUMERIC(10, 2) CHECK(salary >= 0) DEFAULT 0 NOT NULL,
	hire_date TIMESTAMP,
	skills_data_id INTEGER NOT NULL,
	team_id INTEGER,
	
	CONSTRAINT fk_players_skills_data
	FOREIGN KEY (skills_data_id)
	REFERENCES skills_data(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_players_teams
	FOREIGN KEY (team_id)
	REFERENCES teams(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE players_coaches (
	player_id INTEGER,
	coach_id INTEGER,
	
	CONSTRAINT fk_players_coaches_players
	FOREIGN KEY (player_id)
	REFERENCES players(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_players_coaches_coaches
	FOREIGN KEY (coach_id)
	REFERENCES coaches(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
