DROP DATABASE IF EXISTS BibliotecaOnline;
CREATE DATABASE BibliotecaOnline;
USE BibliotecaOnline;

-- Tabela: Categoria (inicia em 101)
CREATE TABLE Categoria (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL
) AUTO_INCREMENT=101;

-- Tabela: Autor (inicia em 201)
CREATE TABLE Autor (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
data_nascimento DATE,
biografia TEXT
) AUTO_INCREMENT=201;

-- Tabela: Livro (inicia em 301)
CREATE TABLE Livro (
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(200) NOT NULL,
isbn VARCHAR(20) UNIQUE NOT NULL,
descricao TEXT
) AUTO_INCREMENT=301;

-- Tabela: LivroCategoria
CREATE TABLE LivroCategoria (
livro_id INT,
categoria_id INT,
PRIMARY KEY (livro_id, categoria_id),
FOREIGN KEY (livro_id) REFERENCES Livro(id),
FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

-- Tabela: LivroAutor
CREATE TABLE LivroAutor (
livro_id INT,
autor_id INT,
PRIMARY KEY (livro_id, autor_id),
FOREIGN KEY (livro_id) REFERENCES Livro(id),
FOREIGN KEY (autor_id) REFERENCES Autor(id)
);

-- Tabela: Usuario (inicia em 401)
CREATE TABLE Usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
numero_identificacao VARCHAR(20) UNIQUE NOT NULL,
email VARCHAR(100),
data_cadastro DATE,
nivel_associacao ENUM('regular', 'premium') DEFAULT 'regular'
) AUTO_INCREMENT=401;

-- Tabela: Emprestimo (inicia em 501)
CREATE TABLE Emprestimo (
id INT PRIMARY KEY AUTO_INCREMENT,
usuario_id INT,
livro_id INT,
data_emprestimo DATE,
data_devolucao_limite DATE,
data_devolucao DATE,
FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
FOREIGN KEY (livro_id) REFERENCES Livro(id)
) AUTO_INCREMENT=501;

-- Categoria
INSERT INTO Categoria (nome) VALUES 
('Ficção'), ('Não-Ficção'), ('Romance'), ('Mistério'),
('Fantasia'), ('História'), ('Autoajuda'), ('Tecnologia'),
('Biografia'), ('Ciência');

-- Autor
INSERT INTO Autor (nome, data_nascimento, biografia) VALUES 
('João da Silva', '1975-04-12', 'Autor brasileiro de ficção.'),
('Maria Souza', '1980-11-22', 'Especialista em romances.'),
('Carlos Mendes', '1968-06-30', 'Historiador renomado.'),
('Ana Beatriz Lima', '1990-03-17', 'Escreve fantasia e ficção.'),
('Pedro Alencar', '1972-01-10', 'Biografista.'),
('Helena Rocha', '1985-08-09', 'Mistério e suspense.'),
('Ricardo Alves', NULL, 'Jovem autor de tecnologia.'),
('Lúcia Ferreira', '1979-05-14', 'Autoajuda e desenvolvimento pessoal.'),
('Paulo Cesar', '1965-07-03', 'Ficção científica.'),
('Fernanda Costa', '1988-12-19', 'Autora versátil de vários gêneros.');

-- Livro
INSERT INTO Livro (titulo, isbn, descricao) VALUES 
('O Enigma da Floresta', '9781234567890', 'Mistério em uma vila remota.'),
('Amor nas Estrelas', '9781234567891', 'Romance intergaláctico.'),
('O Guia da Vida', '9781234567892', 'Dicas para o dia a dia.'),
('Código do Futuro', '9781234567893', 'Impacto da tecnologia no futuro.'),
('A Jornada do Herói', '9781234567894', 'Fantasia e aventura.'),
('História do Brasil', '9781234567895', 'Resumo cronológico da história do Brasil.'),
('Programação Descomplicada', '9781234567896', 'Aprenda a programar.'),
('Biografia de um Gênio', '9781234567897', 'Vida e obra de um cientista.'),
('Além da Mente', '9781234567898', 'Autoajuda e psicologia.'),
('O Mistério do Farol', '9781234567899', 'Suspense em uma ilha isolada.');

-- LivroCategoria (usando IDs automáticos gerados na ordem dos inserts)
INSERT INTO LivroCategoria (livro_id, categoria_id) VALUES 
(301, 104), (301, 101), -- Livro 1
(302, 103), (302, 101), -- Livro 2
(303, 107), -- Livro 3
(304, 108), (304, 102), -- Livro 4
(305, 105), (305, 101), -- Livro 5
(306, 106), -- Livro 6
(307, 108), -- Livro 7
(308, 109), -- Livro 8
(309, 107), -- Livro 9
(310, 104), (310, 101); -- Livro 10

-- LivroAutor (mesma lógica)
INSERT INTO LivroAutor (livro_id, autor_id) VALUES 
(301, 206),
(302, 202),
(303, 208),
(304, 207),
(305, 204),
(306, 203),
(307, 207),
(308, 205),
(309, 208),
(310, 206);

-- Usuario
INSERT INTO Usuario (nome, numero_identificacao, email, data_cadastro, nivel_associacao) VALUES 
('Lucas Santos', 'USR001', 'lucas@email.com', '2023-01-10', 'regular'),
('Mariana Lima', 'USR002', 'mariana@email.com', '2023-02-05', 'premium'),
('João Pedro', 'USR003', 'joao@email.com', '2023-03-15', 'regular'),
('Ana Clara', 'USR004', 'ana@email.com', '2023-04-20', 'premium'),
('Rafael Nunes', 'USR005', 'rafael@email.com', '2023-05-25', 'regular'),
('Beatriz Souza', 'USR006', 'bia@email.com', '2023-06-18', 'regular'),
('Carlos Silva', 'USR007', 'carlos@email.com', '2023-07-01', 'premium'),
('Larissa Alves', 'USR008', 'larissa@email.com', '2023-08-09', 'regular'),
('Eduardo Rocha', 'USR009', 'edu@email.com', '2023-09-11', 'premium'),
('Juliana Costa', 'USR010', 'juliana@email.com', '2023-10-05', 'regular'),
-- usuario novo
('fran', 'USR11', 'fran@gmail.com', '2023-10-06', 'regular');
-- Usuario
INSERT INTO Usuario (nome, numero_identificacao, email, data_cadastro, nivel_associacao) VALUES 
-- usuario novo
('fran', 'USR11', 'fran@gmail.com', '2023-10-06', 'regular');

-- Emprestimo (ordem respeitada conforme PDF)
INSERT INTO Emprestimo (usuario_id, livro_id, data_emprestimo, data_devolucao_limite, 
data_devolucao) VALUES 
(401, 301, '2024-01-05', '2024-01-20', '2024-01-18'),
(402, 302, '2024-01-10', '2024-01-25', '2024-01-25'),
(403, 303, '2024-01-15', '2024-01-30', NULL),
(404, 304, '2024-01-17', '2024-02-01', '2024-01-31'),
(405, 305, '2024-01-20', '2024-02-04', NULL),
(406, 306, '2024-01-22', '2024-02-06', '2024-02-03'),
(407, 307, '2024-01-25', '2024-02-09', NULL),
(408, 308, '2024-01-28', '2024-02-12', '2024-02-11'),
(409, 309, '2024-02-01', '2024-02-16', '2024-02-15'),
(410, 310, '2024-02-03', '2024-02-18', NULL);

SELECT * FROM Usuario;
-- SELECT * FROM Livro;
-- SELECT * FROM Autor;
-- SELECT * FROM Categoria;

-- tabela auxiliar questão 1 -> Crie uma trigger que insira os dados do usuário excluído na tabela UsuarioExcluido.
DELETE FROM Usuario WHERE id= 411;
-- drop trigger trg_delete_usuario;
DELIMITER //

CREATE TRIGGER trg_delete_usuario
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO UsuarioExcluido(id, nome, email, data_exclusao)
    VALUES (OLD.id, OLD.nome, OLD.email, NOW());
END;

//
DELIMITER ;

CREATE TABLE UsuarioExcluido (
 id INT,
 nome VARCHAR(100),
 email VARCHAR(100),
 data_exclusao DATE
);

SELECT * FROM UsuarioExcluido;

-- questão 2 -> Crie uma trigger que preenche data_emprestimo com a data atual se ela vier nula.

INSERT INTO emprestimo(usuario_id, livro_id)
VALUES
	(410, 301);

DELIMITER //

CREATE TRIGGER trg_insert_data_emprestimo
BEFORE INSERT ON emprestimo
FOR EACH ROW
BEGIN
	IF NEW.data_emprestimo IS NULL THEN
    SET NEW.data_emprestimo = CURDATE();
	END IF;
END;

//
DELIMITER ;

SELECT * FROM Emprestimo;

-- questão 3 -> Crie uma trigger para registrar toda vez que o nome de um livro for alterado.

CREATE TABLE LogTituloLivro (
 id_livro INT,
 titulo_antigo VARCHAR(200),
 titulo_novo VARCHAR(200),
 data_alteracao DATE
);

-- novo livro pra editar
INSERT INTO livro (titulo, isbn, descricao) VALUES
('Mil beijos de garoto', '123654789', 'A menina é doente e morre e depois ele morre também (não leiam).');

SELECT * FROM livro;
-- drop trigger trg_update_titulo;

DELIMITER //

CREATE TRIGGER trg_update_titulo
AFTER UPDATE ON livro
FOR EACH ROW 
BEGIN
	INSERT INTO LogTituloLivro(id_livro, titulo_antigo, titulo_novo, data_alteracao)
	VALUES (OLD.id, OLD.titulo, NEW.titulo, NOW());
END;
//

DELIMITER ;

SELECT * FROM livro;
-- atualizar o titulo do livro
UPDATE Livro SET titulo = 'Mil beijos de garoto' WHERE id = 311;
-- Verificar o log
SELECT * FROM LogTituloLivro;

-- questão 4 -> Crie uma trigger que registre todo novo usuário em uma tabela de log.

CREATE TABLE LogNovoUsuario (
 id_usuario INT,
 nome VARCHAR(100),
 data_criacao DATE
);

-- drop trigger trg_insert_usuario

DELIMITER  //

CREATE TRIGGER trg_insert_usuario
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO LogNovoUsuario(id_usuario, nome, data_criacao)
    VALUES (NEW.id, NEW.nome, NOW());
END;

//
DELIMITER ;

SELECT * FROM usuario;

INSERT INTO Usuario (nome, numero_identificacao, email, data_cadastro, nivel_associacao) VALUES 
-- usuario novo
('fran', 'USR11', 'fran@gmail.com', '2024-10-06', 'premium');

SELECT * FROM LogNovoUsuario;

-- questão 5 -> Crie uma trigger que grave o título e o ISBN de todo novo livro inserido.

CREATE TABLE LogInsercaoLivro (
 id_livro INT,
 titulo VARCHAR(200),
 isbn VARCHAR(20),
 data_insercao DATE
);

DELIMITER //

CREATE TRIGGER trg_insert_livro
AFTER INSERT ON Livro
FOR EACH ROW
BEGIN
	INSERT INTO LogInsercaoLivro (id_livro, titulo, isbn, data_insercao)
    VALUES (NEW.id, NEW.titulo, NEW.isbn, NOW());
END;

// 
DELIMITER ;

SELECT * FROM livro;

-- inserção no banco
INSERT INTO Livro (titulo, isbn, descricao) VALUES 
('Melhor do que nos filmes', '987654321', 'Livro de romance clichê águia com açúcar');

-- tabela de auditoria
SELECT * FROM LogInsercaoLivro;


