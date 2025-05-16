DROP DATABASE IF EXISTS biblioteca_joins;
CREATE DATABASE biblioteca_joins;
USE biblioteca_joins;

-- Tabela de autores (ID a partir de 200)
CREATE TABLE autores (
 id_autor INT PRIMARY KEY,
 nome_autor VARCHAR(50)
);

-- Tabela de editoras (ID a partir de 300)
CREATE TABLE editoras (
 id_editora INT PRIMARY KEY,
 nome_editora VARCHAR(50)
);

-- Tabela de livros (ID a partir de 100)
CREATE TABLE livros (
 id_livro INT PRIMARY KEY,
 titulo VARCHAR(100),
 id_autor INT,
 id_editora INT,
 FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
 FOREIGN KEY (id_editora) REFERENCES editoras(id_editora)
);

-- Tabela de leitores (ID a partir de 500)
CREATE TABLE leitores (
 id_leitor INT PRIMARY KEY,
 nome_leitor VARCHAR(50)
);

-- Tabela de empréstimos (ID a partir de 400)
CREATE TABLE emprestimos (
 id_emprestimo INT PRIMARY KEY,
 id_livro INT,
 data DATE
 -- sem FOREIGN KEY para simular dados inválidos
);

-- Associação entre empréstimos e leitores
CREATE TABLE emprestimos_leitores (
 id_emprestimo INT,
 id_leitor INT
 -- sem FOREIGN KEY para simular leitor inexistente
);

-- Autores
INSERT INTO autores VALUES
(200, 'Machado de Assis'),
(201, 'George Orwell'),
(202, 'Jorge Amado'),
(203, 'Autor Fantasma'); -- não tem livro

-- Editoras
INSERT INTO editoras VALUES
(300, 'Editora Brasil'),
(301, 'Companhia das Letras'),
(302, 'Saraiva'),
(303, 'Editora Fantasma'); -- não tem livro

-- Livros
INSERT INTO livros VALUES
(100, 'Dom Casmurro', 200, 300),
(101, '1984', 201, 301),
(102, 'A Revolução dos Bichos', 201, 301),
(103, 'Capitães da Areia', 202, 302);

-- Leitores
INSERT INTO leitores VALUES
(500, 'Alice'),
(501, 'Bruno'),
(502, 'Carla');

-- Empréstimos
INSERT INTO emprestimos VALUES
(400, 100, '2024-05-01'),
(401, 101, '2024-05-02'),
(402, 104, '2024-05-03'), -- livro inexistente
(403, 105, '2024-05-04'); -- livro inexistente

-- Empréstimos-Leitores
INSERT INTO emprestimos_leitores VALUES
(400, 500),
(401, 501),
(403, 503); -- leitor inexistente

-- questão 1 -> Liste todos os empréstimos com nome do leitor e título do livro.
SELECT leitores.nome_leitor as leitor, livros.titulo, emprestimos.id_emprestimo, emprestimos.data
FROM emprestimos 
JOIN livros ON emprestimos.id_livro = livros.id_livro
JOIN emprestimos_leitores ON emprestimos.id_emprestimo = emprestimos_leitores.id_emprestimo
JOIN leitores ON leitores.id_leitor = emprestimos_leitores.id_leitor;

-- questão 2 -> Mostre todos os livros com o nome do autor, mesmo os que não foram emprestados.
SELECT livros.titulo, autores.nome_autor
FROM livros
LEFT JOIN autores ON livros.id_autor = autores.id_autor;

-- questão 3 ->  Liste todos os autores, mesmo que não tenham livros publicados
SELECT autores.nome_autor, livros.titulo
FROM autores
LEFT JOIN livros ON livros.id_autor = autores.id_autor;

-- questão 4 -> Liste todos os livros e editoras, mesmo que o livro não tenha editora ou a editora não tenha livro
SELECT l.titulo, e.nome_editora
FROM livros l	
LEFT JOIN editoras e ON l.id_editora = e.id_editora
UNION 
SELECT l.titulo, e.nome_editora
FROM livros l
RIGHT JOIN editoras e ON l.id_editora = e.id_editora;

-- questão 5 ->  Mostre todas as combinações possíveis entre leitores e livros.
SELECT l.nome_leitor, li.titulo
FROM leitores l
CROSS JOIN livros li;

-- questão 6 -> Mostre todos os nomes de autores e nomes de editoras numa única coluna.
SELECT a.nome_autor
FROM autores a
UNION ALL
SELECT e.nome_editora
FROM editoras e;

-- questão 7 ->  Liste os empréstimos com título dos livros (para testar se aparece NULL nos inválidos)
SELECT 