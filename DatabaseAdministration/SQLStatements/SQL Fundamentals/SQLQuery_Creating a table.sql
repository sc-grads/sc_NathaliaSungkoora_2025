
-- Creating a a table and indentifying the PRIMARY and FOREIGN KEYS
USE Bikestores;

CREATE TABLE production.pokemon (
	id INT IDENTITY (1, 1) PRIMARY KEY,
	name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255),
);

CREATE TABLE production.trainer (
	id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25),
	poke_id INT NOT NULL,
	FOREIGN KEY (poke_id)
		REFERENCES production.pokemon (id)
		ON DELETE CASCADE ON UPDATE CASCADE
);