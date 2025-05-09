CREATE DATABASE eventos;
USE eventos;
-- drop database eventos

-- tabela funcionario
CREATE TABLE funcionario(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(30),
    setor varchar(30),
    cargo varchar(30)
);

-- tabela cracha
CREATE TABLE cracha(
	id_cracha INT AUTO_INCREMENT PRIMARY KEY,
    qr_code varchar(30),
    data_emissao DATETIME,
    id_funcionario INT,
    FOREIGN KEY(id_funcionario) REFERENCES funcionario(id_funcionario)
);

-- tabela intrutor
CREATE TABLE instrutor(
	id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(30),
    email varchar(30)
);

-- tabela sala
CREATE TABLE sala(
	id_sala INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(30),
    capacidade INT,
    recursos text
);

-- tabela de evento
CREATE TABLE evento(
	id_evento INT AUTO_INCREMENT PRIMARY KEY,
    titulo varchar(30),
    descricao text,
    data date,
    horario time,
    id_sala int,
    FOREIGN KEY(id_sala) REFERENCES sala(id_sala)
);

-- TABELAS DE RELACIONAMENTO

-- tabela funcionario_evento
CREATE TABLE funcionario_evento(
	id_funcionario_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario int,
    FOREIGN KEY(id_funcionario) REFERENCES funcionario(id_funcionario),
    id_evento int,
    FOREIGN KEY(id_evento) REFERENCES evento(id_evento)
);

-- tabela de instrutor_evento
CREATE TABLE instrutor_evento(
	id_instrutor_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_instrutor int,
    FOREIGN KEY(id_instrutor) REFERENCES instrutor(id_instrutor),
    id_evento int,
    FOREIGN KEY(id_evento) REFERENCES evento(id_evento)
);

-- INSERT INTO
INSERT INTO funcionario(nome, setor, cargo)
VALUES
	('adrian', 'ets', 'aprendiz'),
    ('gabi', 'administrativo', 'meio-oficial'),
    ('kamila', 'bisb', 'desenvolvedor'),
    ('leticia', 'BD', 'supervisor'),
    ('diva lu', 'SO', 'gestor');
    
INSERT INTO cracha(qr_code, data_emissao, id_funcionario)
VALUES
	('123456', '2025-01-12', 1),
    ('789456', '2025-02-20', 2),
    ('456123', '2025-02-20', 3),
    ('159263', '2025-03-25', 4),
    ('478652', '2025-03-25', 5);
    
INSERT INTO instrutor(nome, email)
VALUES
	('clebinho', 'cleber@senai.com'),
    ('vanessa', 'nessa@senai.com'),
    ('luca', 'luca@senai.com'),
    ('agatha', 'agatha@senai.com'),
    ('fuzari', 'fumaca@senai.com');
    
INSERT INTO sala(nome, capacidade, recursos)
VALUES
	('lab1', 16, 'projetor'),
    ('lab2', 21, 'projetor'),
    ('ca300', 50, 'power point'),
    ('sala de vidro', 22, 'computador'),
    ('lab4', 16, 'apostilas');

INSERT INTO evento(titulo, descricao, data, horario, id_sala)
VALUES
	('SAP', 'Palestra sobre o mercado de SAP e como está o cenario atualmente', '2025-02-12', '13:30:00', 1),
    ('Industria 4.0', 'Como a tecnologia e a industria andam juntas no cenario da industria 4.0', '2025-03-30', '13:00:00', '2'),
    ('Bisb', 'Conheça a Bisb, seus projetos, anseios para o futuro e jornada de trabalho', '2025-03-30', '13:00:00', '3'),
    ('Fullstack', 'Ferramentas mais utilizadas no dia a dia dos desenvolvedores fullstack e como é ser um desenvolvedor fullstaack no mercado', '2025-04-10', '14:00:00', '4'),
    ('Desing UI/UX', 'O papel do UI/UX em um projeto real', '2025-05-16', '15:00:00', '5');
    
INSERT INTO funcionario_evento(id_funcionario, id_evento)
VALUES
	(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
    (2, 1), (2, 2), (2, 3), (2, 4), (2, 5),
    (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
    (4, 1), (4, 2), (4, 3), (4, 4), (4, 5),
    (5, 1), (5, 2), (5, 3), (5, 4), (5, 5);

INSERT INTO  instrutor_evento(id_instrutor, id_evento)
VALUES
	(1, 1),
    (2, 5),
    (3, 3),
    (4, 2),
    (5, 4);
    
SELECT * FROM funcionario;
SELECT * FROM instrutor;
SELECT * FROM sala;
SELECT * FROM cracha;
SELECT * FROM evento;

-- listr funcionarios participantes de um evento especifico
SELECT funcionario.nome as nome, funcionario.setor as setor, funcionario.cargo as cargo, evento.titulo as evento
FROM funcionario
JOIN funcionario_evento ON funcionario_evento.id_funcionario = funcionario.id_funcionario
JOIN evento ON funcionario_evento.id_evento = evento.id_evento
WHERE evento.titulo = 'SAP';

-- mostrar eventos ministrados por um instrutor especifico
SELECT instrutor.nome, instrutor.email as email, evento.titulo
FROM instrutor
JOIN instrutor_evento ON instrutor_evento.id_instrutor = instrutor.id_instrutor
JOIN evento ON instrutor_evento.id_evento = evento.id_evento
WHERE instrutor.nome = 'vanessa';

-- mostrar eventos realizados e onde
SELECT evento.titulo, evento.data as data, evento.horario as horario, sala.nome as sala
FROM sala
JOIN evento ON sala.id_sala = evento.id_sala

    
