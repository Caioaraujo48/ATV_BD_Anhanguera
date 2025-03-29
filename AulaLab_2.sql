CREATE DATABASE Empresa;
USE Empresa;

#Criação das Tabelas
CREATE TABLE Departamentos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Cargos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nivel VARCHAR(50) NOT NULL
);

CREATE TABLE Funcionarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
	salario DECIMAL (10,2) NOT NULL,
    departamento_id INT NOT NULL,
    cargo_id INT NOT NULL,
    
    FOREIGN KEY(departamento_id) REFERENCES Departamentos(id),
    FOREIGN KEY(cargo_id) REFERENCES Cargos(id)
);

#Inserção de Dados nas Tabelas
INSERT INTO Departamentos(nome) 
VALUES ('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

INSERT INTO Cargos (nome, nivel) VALUES
('Analista', 'Pleno'),
('Gerente', 'Sênior'),
('Assistente', 'Júnior'),
('Coordenador', 'Sênior'),
('Desenvolvedor', 'Pleno');

INSERT INTO Funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id) VALUES
('Ana Silva', '1985-06-15', 5500.00, 1, 5),
('Carlos Santos', '1990-03-22', 2800.00, 2, 1),
('Bruna Costa', '1987-12-10', 6000.00, 3, 2),
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5),
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3),
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2),
('Helena Martins', '1983-11-17', 5300.00, 1, 4),
('Igor Ferreira', '1991-08-08', 2900.00, 2, 1),
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2),
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);

#1-Encontre o Maior Salário
SELECT MAX(salario) AS Maior_Salario
FROM Funcionarios;

#2-Encontrar o Menor Salario
SELECT MIN(salario) AS Menor_Salario
FROM Funcionarios;

#3-Qual a Quantidade de funcionários?
SELECT count(id) AS Qtd_Funcionarios
FROM Funcionarios;

#4-Filtre os Funcionários nascidos apartir de 1990
SELECT * 
FROM Funcionarios
WHERE YEAR(data_nascimento) = '1990';

#5-Encontre a Média Salarial
SELECT ROUND(AVG(salario), 2) AS media_salarial
FROM Funcionarios;

#6-Extraia os 3 primeiros caracteres do nome
SELECT SUBSTRING(nome, 1, 3) AS Nome
FROM Funcionarios;

#7-Contar quantos funcionários por departamento
SELECT d.nome AS Departamento,COUNT(f.departamento_id) AS Qtd_Funcionarios
FROM Funcionarios f
INNER JOIN Departamentos d ON f.departamento_id = d.id
GROUP BY d.id;

#8-Contar quantos Funcionário existem Cargo
SELECT c.nome AS Departamento,COUNT(f.departamento_id) AS Qtd_Funcionarios
FROM Funcionarios f
INNER JOIN Cargos c ON f.cargo_id = c.id
GROUP BY c.id;


