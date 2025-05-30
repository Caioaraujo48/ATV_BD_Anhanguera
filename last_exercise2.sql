CREATE DATABASE atv2;
USE atv2;

CREATE TABLE eventos(
	event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(50),
    event_date DATE
);

CREATE TABLE participantes(
	participant_id INT PRIMARY KEY AUTO_INCREMENT,
    participant_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE registros(
	registration_id INT PRIMARY KEY AUTO_INCREMENT,
    participant_id INT,
    event_id INT,
    registration_date DATE,
    
    FOREIGN KEY(participant_id) REFERENCES participantes(participant_id),
    FOREIGN KEY(event_id) REFERENCES eventos(event_id)
);

INSERT INTO eventos (event_name, event_date) VALUES
	('Tech Conference', '2023-11-01'),
	('Music Festival', '2023-12-15'),
	('Art Exhibition', '2023-10-20'),
	('Food Fair', '2023-11-10');

INSERT INTO participantes (participant_name, email) VALUES
	('Emma', 'emma@example.com'),
	('Liam', 'liam@example.com'),
	('Olivia', 'olivia@example.com'),
	('Noah', 'noah@example.com');
    
INSERT INTO registros (participant_id, event_id, registration_date) VALUES
	(1, 1, '2023-10-01'),
	(2, 2, '2023-10-05'),
	(3, 3, '2023-09-20'),
	(4, 4, '2023-10-10'),
	(1, 2, '2023-10-15');
    
SELECT r.registration_id, p.participant_name, e.event_name, r.registration_date
FROM registros r
INNER JOIN participantes p ON r.participant_id = p.participant_id
INNER JOIN eventos e ON r.event_id = e.event_id
ORDER BY p.participant_id;

SELECT p.participant_name, r.registration_id ,e.event_name, r.registration_date
FROM participantes p 
LEFT JOIN registros r ON r.participant_id = p.participant_id
LEFT JOIN eventos e ON e.event_id = r.event_id
ORDER BY p.participant_id;

SELECT e.event_name, r.registration_id, p.participant_name, r.registration_date
FROM eventos e
RIGHT JOIN registros r ON r.event_id = e.event_id
RIGHT JOIN participantes p ON p.participant_id = r.participant_id;

SELECT p.participant_name, e.event_name, r.registration_id, r.registration_date
FROM participantes p
FULL OUTER JOIN registros r ON r.participant_id = p.participant_id
FULL OUTER JOIN eventos ON r.event_id = e.event_id;

SELECT p.participant_name, e.event_name
FROM participantes p
CROSS JOIN eventos e;