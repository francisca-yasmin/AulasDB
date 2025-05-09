CREATE DATABASE gerencia_informacoes;
USE gerencia_informacoes;

-- drop database gerencia_informacoes

CREATE TABLE instrutor (
	id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome_instrutor varchar(55)
);

CREATE TABLE atividade (
	id_atividade INT AUTO_INCREMENT PRIMARY KEY,
    descricao text
);

CREATE TABLE materia (
	id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome_materia varchar(100),
    id_atividade INT,
    foreign key (id_atividade) references atividade(id_atividade)
);

CREATE TABLE turma (
	id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma varchar(55),
    lab_turma varchar(55)
);

CREATE TABLE aprendiz (
	id_aprendiz INT AUTO_INCREMENT PRIMARY KEY,
    nome_aprendiz varchar(100),
    id_turma INT,
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

CREATE TABLE materia_instrutor (
	id_materia_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    id_instrutor INT,
    FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor),
    id_materia INT,
    FOREIGN KEY (id_materia) REFERENCES materia(id_materia)
);

CREATE TABLE instrutor_turma (
	id_instrutor_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_turma INT,
	FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
    id_instrutor INT,
    FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor)
);

CREATE TABLE aprendiz_atividade (
	id_aprendiz_atividade INT AUTO_INCREMENT PRIMARY KEY,
    id_aprendiz INT,
    FOREIGN KEY (id_aprendiz) REFERENCES aprendiz(id_aprendiz),
    id_atividade INT,
    FOREIGN KEY (id_atividade) REFERENCES atividade(id_atividade)
);

/* +++++++++++++++++ SEÇÃO DE INSERT'S +++++++++++++++++ */

INSERT INTO instrutor(nome_instrutor)
VALUES
	('Cleber'),
    ('Fernanda'),
    ('Marcia'),
    ('Dorival'),
    ('Vanessa'),
    ('Modesto');
 
INSERT INTO atividade(descricao)
VALUES
	('Relizar um BlackJack em python'),
    ('Fazer um portifólio com HTML e CSS'),
    ('Realizar uma modelagem de uma area de uma empresa'),
    ('Fazer uma API com django e fazer sua documentação e publicar ela'),
    ('Se apresentar em inglês'),
    ('Usar Cisco para montar uma area de TI para a fabrica');

INSERT INTO materia(nome_materia, id_atividade)
VALUES
	('Python', 1),
    ('Front-end', 2),
    ('Banco de dados', 3),
    ('Back-end', 4),
    ('Inglês', 5),
    ('Redes', 6);
    
INSERT INTO turma(nome_turma, lab_turma)
VALUES
	('Digital Solutions', 1),
    ('Manufatura', 2),
    ('Mecatronica', 3),
    ('Eletro Eletronica', 4),
    ('Administração', 5),
    ('Automação Industrial', 6);
    
INSERT INTO aprendiz(nome_aprendiz, id_turma)
VALUES
	('Fran', 2),
    ('Gabi', 1),
    ('Leticia', 6),
    ('Kamila', 5),
    ('Adrian', 4),
    ('Nicolas', 3);
    
INSERT INTO materia_instrutor(id_instrutor, id_materia)
VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);
    
INSERT INTO instrutor_turma(id_turma, id_instrutor)
VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);
    
INSERT INTO aprendiz_atividade(id_aprendiz, id_atividade)
VALUES
	(1, 2),
    (2, 1),
    (3, 4),
    (4, 6),
    (5, 5),
    (6, 3);
    
SELECT * FROM instrutor;
SELECT * FROM atividade;
SELECT * FROM materia;
SELECT * FROM turma;
SELECT * FROM aprendiz;



