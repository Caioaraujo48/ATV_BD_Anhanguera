CREATE DATABASE atv4;
USE atv4;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cargo VARCHAR(50)
);

CREATE TABLE auditoria_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    campo_alterado VARCHAR(50),
    valor_antigo VARCHAR(100),
    valor_novo VARCHAR(100),
    data_alteracao DATETIME
);

DELIMITER //
CREATE TRIGGER trg_auditoria_usuarios
AFTER UPDATE ON usuarios
FOR EACH ROW
BEGIN
	IF OLD.nome <> NEW.nome THEN
		INSERT INTO auditoria_usuarios (id_usuario, campo_alterado, valor_antigo, valor_novo, data_alteracao)
        VALUES (OLD.id, 'nome', OLD.nome, NEW.nome, NOW());
	END IF;
    
    IF OLD.email <> NEW.email THEN
		INSERT INTO auditoria_usuarios (id_usuario, campo_alterado, valor_antigo, valor_novo, data_alteracao)
        VALUES (OLD.id, 'email', OLD.email, NEW.email, NOW());
	END IF;
    
    IF OLD.cargo <> NEW.cargo THEN
		INSERT INTO auditoria_usuarios (id_usuario, campo_alterado, valor_antigo, valor_novo, data_alteracao)
        VALUES (OLD.id, 'cargo', OLD.cargo, NEW.cargo, NOW());
	END IF;
END //
DELIMITER ;

INSERT INTO usuarios (nome, email, cargo) VALUES
('João Pereira', 'joao.pereira@email.com', 'Analista'),
('Maria Oliveira', 'maria.oliveira@email.com', 'Gerente'),
('Carlos Mendes', 'carlos.mendes@email.com', 'Técnico');

UPDATE usuarios
SET nome = 'João Pedro Pereira', cargo = 'Supervisor'
WHERE id = 1;
SELECT * FROM auditoria_usuarios;