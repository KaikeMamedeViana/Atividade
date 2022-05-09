/* Sobre cada cliente, o sistema guarda um identificador, que identifica de forma única
cada cliente. Além desse identificador, o sistema guarda o nome, o email e o
endereço.*/

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(45),
    email VARCHAR(45),
    rua VARCHAR(45),
    bairro VARCHAR(45),
    estado VARCHAR(45),
    fkIndicacao INT,
    FOREIGN KEY (fkIndicacao)
        REFERENCES cliente (idCliente)
);


/*- Sobre cada venda, o sistema guarda um identificador, que identifica de forma única
cada venda. O sistema também guarda o total da venda e a data.*/

CREATE TABLE venda (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    totalVenda DECIMAL(10 , 2 ),
    dataVenda DATE,
    fkCliente INT,
    FOREIGN KEY (fkCliente)
        REFERENCES cliente (idCliente)
);


/*- Sobre cada produto, o sistema guarda um identificador, que identifica de forma
única cada produto. Além desse identificador, o sistema guarda o nome, a descrição
e o preço do produto.*/

CREATE TABLE produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nomeProduto VARCHAR(45),
    descricao VARCHAR(45),
    preco DECIMAL(10 , 2 )
);

CREATE TABLE relatorio (
    idRelatorio INT AUTO_INCREMENT,
    fkVenda INT,
    FOREIGN KEY (fkVenda)
        REFERENCES venda (idVenda),
    fkCliente INT,
    FOREIGN KEY (fkCliente)
        REFERENCES cliente (idCliente),
    fkProduto INT,
    FOREIGN KEY (fkProduto)
        REFERENCES produto (idProduto),
    PRIMARY KEY (idRelatorio , fkVenda , fkCliente , fkProduto),
    desconto DECIMAL(10 , 2 ),
    qtdProduto INT
);




-- a) Criar um banco de dados chamado Venda.

create database venda;

-- b) Selecionar esse banco de dados.

use venda;


/*d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
cliente, e mais de um cliente sendo indicado por outro cliente.*/


insert into cliente values 
(null, 'kaike','kaike.mamede@sptehc.school','av do realismo','jardim marina','São Paulo', null),
(null, 'rafael','rafael.macedo@sptehc.school','av da graça','jardim vitoria','Rio de Janeiro', 1),
(null, 'giovannna','giovanna.liem@sptehc.school','av do caminho eterno','jardim vazame','Rio Grande do Sul', null),
(null, 'macedo','macedo.rafael@sptehc.school','av do rio bonito','jardim europa','Mato Grosso', 1);


insert into produto values 
(null, 'gelo', 'gelo bem gelado', 20),
(null, 'wisk', 'wisk que deixa bebado', 1000),
(null, 'energético', 'energético que deixa acelerado', 30);


insert into relatorio values 
(null,  8 , 4 ,  3 , 10  ,  1000),
(null,  7 , 3 ,  1 , 5  ,  2000),
(null,  6 , 2 ,  2 , 300  ,  3000),
(null,  5 , 2 ,  1 , 5 ,  4000);


insert into venda values 
(null, 2000, '2002-02-14', 1),
(null, 3000, '2002-02-15', 1),
(null, 4000, '2002-02-16', 2),
(null, 5000, '2002-02-17', 2),
(null, 6000, '2002-02-18', 3),
(null, 7000, '2002-02-19', 3),
(null, 8000, '2002-02-20', 4),
(null, 9000, '2002-02-21', 4);


-- e) Exibir todos os dados de cada tabela criada, separadamente.

select * from cliente;
select * from venda;
select * from relatorio;
select * from produto;

/*g) Exibir os dados dos clientes e os dados de suas respectivas vendas.*/

SELECT * FROM cliente 
	JOIN venda
		ON fkCliente = idCliente;

/*h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)
e os dados de suas respectivas vendas.*/

SELECT * FROM cliente 
	JOIN venda
		ON fkCliente = idCliente
			WHERE nomeCliente = 'kaike';	
			
/*i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.*/

SELECT * FROM cliente 
	JOIN cliente 
		AS indicado
			ON indicado.idCliente = cliente.fkIndicacao;
            
/*j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes
indicadores, porém somente de um determinado cliente indicador (informar o nome
do cliente que indicou na consulta).*/

SELECT * FROM cliente 
	JOIN cliente 
		AS indicado
			ON indicado.idCliente = cliente.fkIndicacao 
				WHERE indicado.nomeCliente = 'kaike';


/*l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
dados das respectivas vendas e dos produtos.*/

SELECT * FROM cliente 
	LEFT JOIN cliente 
		AS indicado
			ON indicado.idCliente = cliente.fkIndicacao
				JOIN venda
					ON fkCliente = cliente.idCliente
						JOIN relatorio
							ON ;


/*m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto
numa determinada venda.*/





/*n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
produtos vendidos agrupados pelo nome do produto.*/



/*o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
vendas, e os clientes que não realizaram nenhuma venda.*/

