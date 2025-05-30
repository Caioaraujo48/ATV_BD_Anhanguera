CREATE DATABASE atv3;
USE atv3;

DELIMITER //
CREATE FUNCTION verifica_maioridade (data_nascimento DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE idade INT;
    SET idade = TIMESTAMPDIFF(YEAR, data_nascimento, DATE(NOW()));
    
    IF idade < 18 THEN
		RETURN "Menor de idade";
    ELSE
		RETURN "Maior de idade";
	END IF;
END //
DELIMITER ;

CREATE TABLE participantes (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nascimento DATE
);


INSERT INTO participantes (nome, data_nascimento) VALUES
('Alice Ferreira', '2007-04-15'),
('Bruno Lima', '1998-08-21'),
('Carla Souza', '2010-11-30'),
('Daniel Monteiro', '2003-01-09');

SELECT nome, data_nascimento, verifica_maioridade(data_nascimento) AS status_maioridade 
FROM participantes;