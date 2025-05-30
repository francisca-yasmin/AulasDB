CREATE DATABASE IF NOT EXISTS Triggers;
USE Triggers;


CREATE TABLE produtos (
 id INT PRIMARY KEY,
 nome VARCHAR(100),
 preco DECIMAL(10,2)
);
CREATE TABLE auditoria_precos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 produto_id INT,
 preco_antigo DECIMAL(10,2),
 preco_novo DECIMAL(10,2),
 data_alteracao DATETIME,
 usuario VARCHAR(100)
);

-- para testes
INSERT INTO produtos (id, nome, preco) VALUES (1, 'Monitor', 800.00);
UPDATE produtos SET preco = 890.00 WHERE id = 1;
SELECT * FROM auditoria_precos;
SELECT * FROM produtos;

-- antes de atualizar a tabela produtos, verificar se o preço foi alterado, se sim, lançar na tabela auditoria

DELIMITER //

CREATE TRIGGER trg_before_insert_produto
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
	INSERT INTO auditoria_precos(produto_id, preco_antigo, preco_novo, data_alteracao, usuario)
    VALUES (OLD.id, OLD.preco, new.preco, NOW(), 'fran');
END ;

//
DELIMITER ;
	