CREATE database biblioteca_online;
USE biblioteca_online;
-- drop database biblioteca_online

/*
-- Tabela de Status
CREATE TABLE status (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome varchar(255)
);
*/

CREATE TABLE livro (
	id_livro INT auto_increment PRIMARY KEY,
    isbn_livro varchar(50),
    titulo_livro varchar(100),
    descricao text
   /* id INT,
	FOREIGN KEY (id) REFERENCES status(id)*/
); 

CREATE TABLE autor(
	id_autor INT auto_increment primary key,
    nome_autor varchar(100)
);

CREATE TABLE categoria(
	id_categoria int auto_increment primary key,
    nome_categoria varchar(50)
);

CREATE TABLE associacao(
	id_associacao int auto_increment primary key,
    nome_associacao varchar(50)
);

CREATE TABLE usuario(
	id_usuario int auto_increment primary key,
    nome_usuario varchar(100),
    email varchar(100),
    data_registro date,
    id_associacao INT,
    foreign key (id_associacao) references associacao(id_associacao)
);

CREATE TABLE emprestimo(
	id_livro INT,
    FOREIGN KEY(id_livro) REFERENCES livro(id_livro),
    id_emprestimo INT auto_increment PRIMARY KEY,
    data_emprestimo date,
    id_usuario int,
    foreign key (id_usuario) references usuario(id_usuario)
);

CREATE TABLE livro_categoria(
	id_livro_categoria int auto_increment primary key,
    id_livro int,
    foreign key (id_livro) references livro(id_livro),
    id_categoria int,
    foreign key (id_categoria) references categoria(id_categoria)

);

CREATE TABLE autor_livro(
	id_autor_livro int auto_increment primary key,
    id_livro int,
    foreign key(id_livro) references livro(id_livro),
    id_autor int,
    foreign key(id_autor) references autor(id_autor)
);
/*
inserção das informações nos campos das tabelas criadas
*/

/*
INNER JOIN
*/
SELECT livro.titulo_livro, autor.nome_autor
FROM livro
JOIN autor_livro ON livro.id_livro = autor_livro.id_livro
JOIN autor ON autor.id_autor = autor_livro.id_autor;
 
SELECT livro.titulo_livro, autor.nome_autor, categoria.nome_categoria, usuario.nome_usuario
FROM livro
JOIN autor_livro ON livro.id_livro = autor_livro.id_livro
JOIN autor ON autor.id_autor = autor_livro.id_autor

-- pegar categoria/genero do livrinho
JOIN livro_categoria ON livro.id_livro = livro_categoria.id_livro
JOIN categoria ON categoria.id_categoria = livro_categoria.id_categoria;

-- nome do usuario que pegou o livro emprestado
-- JOIN emprestimo ON usuario.id_usuario = emprestimo.id_usuario
-- JOIN 

-- autor.nome_autor, categoria.nome_categoria, status.nome, usuario.



INSERT INTO livro(ISBN_livro, titulo_livro, descricao)
VALUES
	(9781481432542, 'Amor & Gelato', 'Atendendo ao último desejo da mãe, Lina decide passar o último verão antes da faculdade em Roma, onde descobre o amor, muitas aventuras e a paixão pelo gelato. Baseada no best-seller de Jenna Evans Welch, esta comédia romântica ambientada na Itália é estrelada por Susanna Skaggs.'),
    (9786559815043, 'Verity', 'Verity é um suspense psicológico que conta a história de uma escritora contratada para terminar uma série de livros após a misteriosa morte da autora original, Verity Crawford. Ao investigar os manuscritos de Verity, ela descobre segredos perturbadores sobre a vida da autora.'),
    (9786559811243, 'É assim que acaba', 'Lily Bloom decide começar uma nova vida em Boston e tentar abrir o seu próprio negócio. Como consequência de sua mudança de vida, Lily acredita que encontrou o amor verdadeiro com Ryle, um charmoso neurocirurgião. No entanto, as coisas se complicam quando um incidente doloroso desencadeia um trauma do passado e também, quando seu primeiro amor reaparece.'),
    (9788565765480, 'Mentirosos', 'Mentirosos é um livro que conta a história de Cadence, uma jovem que sofre um acidente durante as férias de verão e perde a memória. Dois anos depois, ela retorna à ilha para tentar recuperar as suas memórias.'),
    (9788555391262, 'Eu e esse meu coração', 'Leah MacKenzie, de 17 anos, tem um coração artificial e um tipo sanguíneo raro, o que torna um transplante um sonho distante. Ela recebe uma segunda chance de vida, mas descobre que o doador foi Eric, um garoto da sua escola que supostamente se matou. Matt, o irmão gêmeo de Eric, se recusa a acreditar na morte do irmão.'),
    (9786559815067, 'É assim que começa', 'É Assim que Começa é o segundo volume da série É Assim que Acaba. Lily Bloom é uma mulher que se esforça para criar uma vida melhor para si e para a sua filha, Emerson. Ela se envolve num relacionamento abusivo com Ryle Kincaid, um neurocirurgião carismático. Após o divórcio, Lily reencontra Atlas, um antigo amor da adolescência, que parece retribuir os seus sentimentos. No entanto, Ryle não aceita o novo relacionamento de Lily.');
    
INSERT INTO autor(nome_autor)
VALUES
	('Jenna Evans'),
    ('Collen Hover'),
    ('E. Lockhart'),
    ('C. C. Hunter');

INSERT INTO categoria(nome_categoria)
VALUES
	('Drama'),
    ('Suspense'),
    ('Romance'),
    ('Ficção'),
    ('Ficção juvenil');
    
/*
-- Inserindo dados em status
INSERT INTO status (nome) VALUES
('Ativo'),
('Inativo'),
('Danificado');
*/

INSERT INTO associacao(nome_associacao)
VALUES
	('Regular'),
    ('Premium');

INSERT INTO usuario (nome_usuario, email, data_registro, id_associacao)
VALUES
	('Fran', 'fran@gmail.com', '2024-03-12', 1),
    ('adrian', 'adrian@gmail.com', '2024-03-14', 1),
    ('kamila', 'kamila@gmail.com', '2024-03-16', 2),
    ('bruno', 'bruno@gmail.com', '2024-03-18', 1),
    ('gabi linda', 'gabilinda@gmail.com', '2025-03-10', 2),
    ('leticia', 'leticia@gmail.com', '2025-03-11', 2);
    
INSERT INTO emprestimo (id_livro, id_usuario, data_emprestimo)
VALUES
	(1, 1, '2025-03-12'),
    (3, 5, '2025-03-15'),
    (2, 4, '2025-03-16'),
    (6, 3, '2025-03-17'),
    (4, 2, '2025-03-19'),
    (5, 6, '2025-03-21');

INSERT INTO autor_livro (id_livro, id_autor)
VALUES
	(1, 1),
    (2, 2),
    (3, 2),
    (4, 3),
    (5, 4),
    (6, 2);
    
INSERT INTO livro_categoria(id_livro, id_categoria)
VALUES
	(1, 3),
    (2, 2),
    (3, 5),
    (4, 1),
    (5, 3),
    (6, 5), 
    (6, 3);

SELECT * FROM livro;
SELECT * FROM autor;
SELECT * FROM categoria;
SELECT * FROM associacao;
SELECT * FROM usuario;
SELECT * FROM autor_livro



  