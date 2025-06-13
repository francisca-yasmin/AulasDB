USE biblioteca_joins;
-- questão 1 - Crie um usuário chamado relatorio_user com senha 1234rel que possa apenas fazer consultas (SELECT) em todas as tabelas do banco biblioteca.
CREATE USER 'relatorio_user'@'localhost'
IDENTIFIED BY '1234rel';

GRANT SELECT ON biblioteca_joins. * TO 'relatorio_user'@'localhost';

-- questão 2 - Crie um usuário editor_produto com acesso apenas para leitura e atualização (SELECT, UPDATE) na tabela Produto do banco LojaOnline
CREATE USER 'editor_produto'@'localhost'
IDENTIFIED BY '1234';

GRANT SELECT, UPDATE ON biblioteca_joins.livros TO 'editor_produto'@'localhost';

-- questão 3 - Dê permissão ao usuário gestorRH para inserir e consultar dados da tabela Funcionario, mas não para alterar nem excluir.
CREATE USER 'gestorRH'@'localhost'
IDENTIFIED BY '1234';

GRANT INSERT, SELECT ON biblioteca_joins.autores TO 'gestorRH'@'localhost';

-- questão 4 - Crie um usuário dev_backup que tenha permissão total para todos os bancos do servidor, inclusive criar e excluir bancos.
CREATE USER 'dev_backup'@'localhost'
IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON *.* TO 'dev_backup'@'localhost'; -- garante acesso total aos bancos do servidor

SHOW GRANTS FOR 'dev_backup'@'localhost';


-- questao 5 - Remova do usuário editor_produto a permissão de UPDATE, mantendo apenas a leitura.
CREATE USER 'editor_autores'@'localhost'
IDENTIFIED BY '1234';

GRANT SELECT, UPDATE ON biblioteca_joins.* TO 'editor_autores'@'localhost';

-- remover permissão
REVOKE UPDATE ON biblioteca_joins.* FROM 'editor_autores'@'localhost';

-- questao 6 -  Exclua o usuário relatorio_user.
DROP USER 'relatorio_user'@'localhost';

-- questao 7 -  Mostre os comandos necessários para verificar as permissões atuais do usuário gestorRH.
SHOW GRANTS FOR 'gestorRH'@'localhost';

-- questao 8 - . Crie um usuário analista_fiscal que pode fazer consultas na tabela NotasFiscais do banco Financeiro, mas só quando estiver acessando da máquina loca
CREATE USER 'analista_fiscal'@'localhost'
IDENTIFIED BY '1234';

GRANT SELECT ON biblioteca_joins.autores TO 'analista_fiscal'@'localhost';

-- questao 9 - . Crie um usuário mobile_app com acesso total apenas à tabela Pedidos do banco DeliveryApp. Use o coringa % para permitir acesso remoto.
CREATE USER 'mobile_app'@'%'
IDENTIFIED BY '1234';

GRANT SELECT, INSERT, UPDATE, DELETE ON biblioteca_joins.autores TO 'mobile_app'@'%';

-- questao 10 - O usuário suporteTI está com acesso total ao banco RHInterno. Remova todos os privilégios dele
CREATE USER 'suporteTI'@'localhost'
IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON  biblioteca_joins.* TO 'suporteTI'@'localhost';

REVOKE ALL PRIVILEGES ON biblioteca_joins.* FROM 'suporteTI'@'localhost';



