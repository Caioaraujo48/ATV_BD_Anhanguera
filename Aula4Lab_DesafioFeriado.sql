-- DDL
CREATE DATABASE escola;
USE escola;

CREATE TABLE alunos (
	id_aluno INT PRIMARY KEY,
	nome VARCHAR(100),
	data_nascimento DATE,
	email VARCHAR(100)
);

CREATE TABLE cursos (
	id_curso INT PRIMARY KEY,
	nome_curso VARCHAR(100),
	carga_horaria INT
);

CREATE TABLE matriculas (
	id_matricula INT PRIMARY KEY,
	id_aluno INT,
	id_curso INT,
	data_matricula DATE,
	FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
	FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- adicionando novo atributo em 'alunos'
ALTER TABLE alunos ADD telefone VARCHAR(20);

-- modificando o tipo de atributo de 'carga_horaria' para SMALLINT
ALTER TABLE cursos MODIFY COLUMN carga_horaria SMALLINT;

-- DML
INSERT INTO alunos (id_aluno, nome, data_nascimento, email, telefone)
VALUES
(1, 'Ana Souza', '2000-05-10', 'ana@email.com', '11999990000'),
(2, 'Carlos Lima', '1999-11-22', 'carlos@email.com', '11988887777');

INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES
(101, 'Lógica de Programação', 60),
(102, 'Banco de Dados', 80);

INSERT INTO matriculas (id_matricula, id_aluno, id_curso, data_matricula)
VALUES
(1001, 1, 101, '2024-03-10'),
(1002, 2, 102, '2024-03-12');

-- atualizando telefone de Ana Souza
UPDATE alunos SET telefone = '11911112222' WHERE id_aluno = 1;

-- removendo curso 'Lógica de Programação'
DELETE FROM matriculas WHERE id_curso = 101;
DELETE FROM cursos WHERE nome_curso = 'Lógica de Programação';  

-- inserindo novo curso
INSERT INTO cursos 
VALUES (103, 'Lógica de Programação', 75);
INSERT INTO matriculas (id_matricula, id_aluno, id_curso, data_matricula)
VALUES
(1001, 1, 103, '2024-03-10');


-- DQL
SELECT * FROM alunos;

SELECT * FROM cursos 
WHERE carga_horaria > 70;

SELECT * FROM matriculas 
WHERE data_matricula > '2024-03-01';

SELECT nome, data_nascimento
FROM alunos;

SELECT * FROM cursos 
ORDER BY carga_horaria DESC;

SELECT a.nome AS aluno, c.nome_curso AS curso
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN cursos c ON c.id_curso = m.id_curso;

-- DESAFIO
SELECT a.nome AS Nome_aluno, c.nome_curso AS Nome_curso, 
YEAR(NOW()) - YEAR(a.data_nascimento) AS Idade_aluno, m.data_matricula AS Data_matrícula 
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN cursos c ON c.id_curso = m.id_curso;
