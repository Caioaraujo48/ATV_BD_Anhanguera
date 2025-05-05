CREATE DATABASE loja;
USE loja;

CREATE TABLE clientes (
	cod_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100),
    cidade VARCHAR(100),
	cep INT(8) 
);

CREATE TABLE pedidos (
	num_pedido INT PRIMARY KEY AUTO_INCREMENT,
    cod_cliente INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    item VARCHAR(100),
    valor DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY(cod_cliente) REFERENCES clientes(cod_cliente)
);

INSERT INTO clientes(nome, endereco, cidade, cep)
VALUES ("Kauan", "Rua São João 275", "São Paulo", 68901695);
INSERT INTO clientes(nome, endereco, cidade, cep)
VALUES ("Roberto", "Rua Itau 44", "São Paulo", 69314038);

SELECT *
FROM clientes;

INSERT INTO pedidos(cod_cliente, item, valor)
VALUES (2, "Televisão", 1979.99);
INSERT INTO pedidos(cod_cliente, item, valor)
VALUES (2, "Playstation 5", 5699.00);
INSERT INTO pedidos(cod_cliente, item, valor)
VALUES(1, "Geladeira", 7099.99);
INSERT INTO pedidos(cod_cliente, item, valor)
VALUES(1, "Fogão", 1400.98);


SELECT *
FROM pedidos
WHERE cod_cliente = 2;
