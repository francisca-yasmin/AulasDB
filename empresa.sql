-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;
-- Criar tabela clientes
CREATE TABLE clientes (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100),
 email VARCHAR(100),
 cidade VARCHAR(100),
 estado CHAR(2)
);
-- Inserir dados fictícios
INSERT INTO clientes (nome, email, cidade, estado) VALUES
('Ana Silva', 'ana.silva@email.com', 'Campinas', 'SP'),
('Bruno Souza', 'bruno.souza@email.com', 'Belo Horizonte', 'MG'),
('Carla Mendes', 'carla.mendes@email.com', 'São Paulo', 'SP'),
('Diego Rocha', 'diego.rocha@email.com', 'Rio de Janeiro', 'RJ'),
('Eduarda Lima', 'eduarda.lima@email.com', 'Sorocaba', 'SP'),
('Fernando Alves', 'fernando.alves@email.com', 'Curitiba', 'PR');

SELECT * FROM clientes;

-- questão 1 -> Crie a VIEW clientes_sp com clientes do estado de SP.
CREATE VIEW  clientes_sp AS
SELECT id, nome, email, cidade, estado
FROM clientes
WHERE estado = 'SP';
-- drop view clientes_sp;

-- questão 2 -> Consulte a VIEW clientes_sp usando SELECT *.
SELECT * FROM clientes_sp;

-- questão 3 -> Crie a VIEW clientes_upper com nomes em letras maiúsculas (UPPER)
CREATE VIEW clientes_upper AS
SELECT UPPER(nome) as nome_maiusculo
FROM clientes;

SELECT * FROM clientes_upper;
-- drop view clientes_upper;

-- questão 4 -> Tente dar UPDATE na VIEW clientes_upper. O que acontece?
UPDATE clientes_upper
SET nome_maiusculo = LOWER(nome);

SELECT * FROM clientes_upper;

-- qestão 5 -> Crie a VIEW clientes_editaveis com id, nome e cidade. Altere a cidade de um cliente pela VIEW.

-- drop view clientes_editaveis
CREATE VIEW clientes_editaveis AS
SELECT id, nome, cidade 
FROM clientes;

UPDATE clientes_editaveis 
SET cidade = 'VIEW'
WHERE id = 6;

SELECT * FROM clientes_editaveis;

-- questão 6 -> Liste as VIEWs criadas e veja o SQL da clientes_editaveis usando SHOW FULL TABLES e SHOW CREATE VIEW.
SHOW FULL TABLES;	
SHOW CREATE VIEW clientes_editaveis;
SHOW CREATE VIEW clientes_sp;
SHOW CREATE VIEW clientes_upper;
