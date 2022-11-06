USE exercicio_SQL_locadora

/*
1) Consultar num_cadastro do cliente, nome do cliente, data_locacao (Formato dd/mm/aaaa), 
Qtd_dias_alugado (total de dias que o filme ficou alugado), titulo do filme, 
ano do filme da locação do cliente cujo nome inicia com Matilde.
*/
--SQL3 (99)
SELECT DISTINCT cliente.num_cadastro, cliente.nome, 
       CONVERT(CHAR(10), locacao.data_locacao, 103) AS data_locacao,
       DATEDIFF(DAY, locacao.data_locacao, locacao.data_devolucao) AS Qtd_dias_alugado,
	   filme.titulo, filme.ano
FROM cliente, locacao, dvd, filme
WHERE cliente_num_cadastro = locacao.cliente_num_cadastro
       AND dvd.num = locacao.dvd_num
	   AND filme.id = dvd.filme_id
	   AND cliente.nome LIKE 'Matilde%'

/*
2) Consultar nome da estrela, nome_real da estrela, título do filme dos filmes cadastrados 
do ano de 2015.
*/
--SQL3 (99)
SELECT es.nome, es.nome_real, fil.titulo 
FROM estrela es, filme_estrela fe, filme fil
WHERE es.id = fe.estrela_id
       AND fil.id = fe.filme_id
       AND fil.ano = 2015
ORDER BY es.nome ASC

/*
3) Consultar título do filme, data_fabricação do dvd (formato dd/mm/aaaa), caso a diferença do 
ano do filme com o ano atual seja maior que 6, deve aparecer a diferença do ano com o ano atual 
concatenado com a palavra anos (Exemplo: 7 anos), caso contrário só a diferença (Exemplo: 4).
*/
--SQL3 (99)
SELECT DISTINCT fil.titulo, CONVERT (CHAR(10), dv.data_fabricacao, 103) AS data_fabricacao,
	   CASE WHEN (YEAR(GETDATE()) - fil.ano) > 6
	        THEN CAST((YEAR(GETDATE()) - fil.ano) AS VARCHAR(4)) + ' anos'
	        ELSE CAST((YEAR(GETDATE()) - fil.ano) AS VARCHAR(4))
	   END AS anos_de_diferença
FROM filme fil, dvd dv, filme_estrela fe, estrela e
WHERE fil.id = dv.filme_id
       AND dv.data_fabricacao != '18/10/2019'
ORDER BY fil.titulo ASC

--Consulta todas as linhas e todas as colunas cliente, estrela, dvd, filme, filme_estrela, locacao
SELECT * FROM cliente 
SELECT * FROM estrela
SELECT * FROM dvd
SELECT * FROM filme
SELECT * FROM filme_estrela
SELECT * FROM locacao