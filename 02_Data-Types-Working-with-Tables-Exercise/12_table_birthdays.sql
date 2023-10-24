CREATE TABLE minions_birthdays (
	id serial PRIMARY KEY NOT NULL
	,"name" VARCHAR(50)
	,date_of_birth DATE
	,age INTEGER 
	,present VARCHAR(30)
	,party TIMESTAMPTZ
);