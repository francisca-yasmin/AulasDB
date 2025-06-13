USE biblioteca_joins;

SELECT * FROM autores; -- posso fazer
INSERT INTO autores (id_autor, nome_autor)
VALUES
	(1, 'gabi'); -- posso fazer
    
UPDATE autores
SET nome_autor = 'leticia'
WHERE id = 1;
    

