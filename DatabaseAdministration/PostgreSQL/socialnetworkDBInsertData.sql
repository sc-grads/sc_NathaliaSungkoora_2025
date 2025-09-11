/*INSERT DATA INTO SOCIALNETWORK DB*/

INSERT INTO users(bio,username)
VALUES 
	('This is my bio.', 'Alyson14'),
	('This is about me!', 'Gia67');

SELECT * FROM users;












SELECT * FROM public.users
ORDER BY id ASC 