-- Inserting values into table
INSERT INTO production.pokemon (name, phone, email)
VALUES ('Squirtle', '999-999-9999', 'squirtle@gmail.com'),
	('Bulbasuar', '999-666-9999', 'bulbasuar@gmail.com');

	INSERT INTO production.pokemon 
	VALUES ('Charmander', '998-679-9999', 'charmander@gmail.com');

-- Updating table

UPDATE production.pokemon
SET name= 'Blastoise', phone= '777-777-7777'
WHERE id = 2;