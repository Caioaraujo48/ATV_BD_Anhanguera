CREATE DATABASE atv5;
USE atv5;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    valor_total DECIMAL(10,2),
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE participantes (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Assumindo que a tabela participantes também teria um ID autoincrementável
    nome VARCHAR(255), -- Assumindo um tamanho comum para nome
    data_nascimento DATE
);

INSERT INTO clientes (nome, email) VALUES
('Alice Costa', 'alice@email.com'),
('Bruno Silva', 'bruno@email.com'),
('Carla Mendes', 'carla@email.com');

INSERT INTO pedidos (id_cliente, valor_total, data_pedido) VALUES
(1, 350.00, '2025-01-10'),
(1, 1200.00, '2025-02-15'),
(2, 499.90, '2025-03-05'),
(3, 150.00, '2025-03-07'),
(2, 399.00, '2025-04-01');

INSERT INTO participantes (nome, data_nascimento) VALUES
('Alice Ferreira', '2007-04-15'),
('Bruno Lima', '1998-08-21'),
('Carla Souza', '2010-11-30'),
('Daniel Monteiro', '2003-01-09');

CREATE VIEW relatorio_clientes AS
SELECT c.nome, COUNT(p.id) AS total_pedidos, SUM(p.valor_total) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.id, c.nome;

SELECT * FROM relatorio_clientes;