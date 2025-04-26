#atv1: Update
CREATE DATABASE atv1;
USE atv1;

CREATE TABLE vendas(
id_venda BIGINT PRIMARY KEY AUTO_INCREMENT,
nome_cliente VARCHAR(50) NOT NULL,
item_pedido VARCHAR(50),
qt BIGINT,
valor FLOAT
);

INSERT INTO vendas (id_venda, nome_cliente, item_pedido, qt, valor)
VALUES 
(1, 'Alice Oliveira', 'Tênis', 2, 160.50),
(2, 'Angela Carla', 'Calça', 3, 189.20),
(3, 'Vinicius Ribeiro', 'Meia', 3, 29.50),
(4, 'Ricardo Ferreira', 'Notebook', 1, 1989.20),
(5, 'Fabricio Carreiro', 'Celular', 1, 1650.20);

UPDATE vendas
SET nome_cliente = 'Joana Maria' 
WHERE id_venda = 4;

UPDATE vendas
SET qt = 6, item_pedido = 'Geladeira',  valor = 15546.66
WHERE id_venda = 2;

SELECT *
FROM vendas;


#ATV 2: Segurança

CREATE DATABASE atv2;
USE atv2;

CREATE TABLE cursos (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  duracao_meses INT
);

CREATE TABLE alunos (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  idade INT,
  curso_id INT,
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO cursos (id, nome, duracao_meses)
VALUES 
(1, 'Engenharia de Software', 48),
(2, 'Administração', 36),
(3, 'Arquitetura', 60),
(4, 'Marketing', 24),
(5, 'Direito', 48);

INSERT INTO alunos (id, nome, idade, curso_id)
VALUES 
(1, 'João Silva', 20, 1),
(2, 'Maria Santos', 22, 2),
(3, 'Carlos Oliveira', 25, 1),
(4, 'Ana Pereira', 23, 3),
(5, 'Pedro Costa', 21, 2);

CREATE USER 'analista'@'localhost' IDENTIFIED BY 'userAnalista';
CREATE USER 'sistema'@'localhost' IDENTIFIED BY 'userSistema';

GRANT SELECT ON atv2.* TO 'analista'@'localhost';
GRANT CREATE, SELECT, UPDATE, DELETE ON atv2.* TO 'sistema'@'localhost';

REVOKE CREATE ON atv2.* FROM 'sistema'@'localhost';
