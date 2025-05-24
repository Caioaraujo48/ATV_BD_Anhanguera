CREATE DATABASE streaming;
use streaming;

CREATE TABLE movies (
	movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_title VARCHAR(100),
    genre VARCHAR(50)
);

CREATE TABLE clients (
	client_id INT PRIMARY KEY AUTO_INCREMENT,
	client_name VARCHAR(100),
    email VARCHAR(50)
);

CREATE TABLE subscriptions (
	subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    movie_id INT,
    subscription_date DATE, 
    
    FOREIGN KEY(client_id) REFERENCES clients(client_id),
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);

INSERT INTO movies (movie_title, genre)
VALUES
('The Shawshank Redemption', 'Drama'),
('The Dark Knight', 'Action'),
('Inception', 'Sci-Fi'),
('Forrest Gump', 'Drama');

INSERT INTO clients (client_name, email)
VALUES
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com'),
('Carlos Souza', 'carlos.souza@example.com'),
('Ana Costa', 'ana.costa@example.com');

INSERT INTO subscriptions (client_id, movie_id, subscription_date)
VALUES
(1, 4, '2025-05-20'),
(2, 3, '2025-05-21'),
(3, 2, '2025-05-22'),
(4, 1, '2025-05-23');

SELECT s.subscription_id, c.client_name, m.movie_title, s.subscription_id
FROM subscriptions s
INNER JOIN clients c ON c.client_id = s.client_id 
INNER JOIN movies m ON m.movie_id  = s.movie_id;

SELECT c.client_name, s.subscription_id, m.movie_title, s.subscription_date
FROM clients c
LEFT JOIN subscriptions s ON c.client_id = s.client_id
LEFT JOIN movies m ON s.movie_id = m.movie_id;

SELECT m.movie_title, s.subscription_id, c.client_name, s.subscription_date
FROM movies m
RIGHT JOIN subscriptions s ON m.movie_id = s.movie_id
RIGHT JOIN clients c ON c.client_id = s.client_id



