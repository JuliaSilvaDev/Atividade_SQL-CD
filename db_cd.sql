create database db_cd; 
use db_cd;

create table tb_artista(
	Id_Artista int not null,
	NomeArtista varchar(100) not null UNIQUE 
);

create table tb_gravadora(
	Id_Gravadora int not null,
	NomeGravadora varchar(50) not null UNIQUE  
);

create table tb_categoria(
	Id_Categoria int not null,
	NomeCategoria varchar(50) not null UNIQUE  
);

create table tb_estado(
	SiglaEstado char(2) not null,
	Estado char(50) not null UNIQUE  
);

create table tb_cidade(
	Id_Cidade int not null,
    NomeCidade varchar(100) not null,
	SiglaEstado char(2) not null UNIQUE
);

create table tb_cliente(
	Id_Cliente int not null,
	Id_Cidade int not null,
	NomeCliente Varchar(60) not null,
	EnderecoCliente varchar(200),
	RendaCliente decimal(10,2) default 0,
	SexoCliente ENUM('F','M') not null default 'F'
);

create table tb_conjuge(
	Id_Cliente int not null,
	NomeConjuge varchar(100) not null,
	RendaConjuge decimal(10,2) not null default 0,
	SexoConjuge ENUM('F','M') not null default 'M'
);

create table tb_funcionario(
	Id_Funcionario int not null,
	NomeFuncionario varchar(60) not null,
	EnderecoFuncionario varchar(200) not null,
	SalarioFuncionario decimal(10,2) not null default 0,
	SexoFuncionario ENUM('F','M') not null default 'M'
);

create table tb_dependente(
	Id_Dependente int not null,
	Id_Funcionario int not null,
	NomeDependente varchar(60) not null,
	SexoDependente ENUM('F','M') not null default 'M'
);

create table tb_titulo(
	Id_Titulo int not null,
	Id_Categoria int not null,
	Id_Gravadora int not null,
	NomeCd varchar(100) not null,
	ValorCd decimal(10,2) not null,
    QuantidadeEstoque int not null 
);

create table tb_pedido(
	Id_Pedido int not null,
    Id_Cliente int not null,
	Id_Funcionario int not null,
	DataPedido datetime not null,
	ValorPedido decimal(10,2) not null default 0
);

create table tb_TituloPedido(
	Id_Pedido int not null,
	Id_Titulo int not null,
	QuantidadeCd int not null,
	ValorCd decimal(10,2) not null
);

create table tb_TituloArtista(
	Id_Titulo int not null,
	Id_Artista int not null
);

ALTER TABLE tb_artista
ADD CONSTRAINT pk_Id_Artista PRIMARY KEY (Id_Artista);

ALTER TABLE tb_gravadora
ADD CONSTRAINT pk_Id_Gravadora PRIMARY KEY (Id_Gravadora);

ALTER TABLE tb_categoria
ADD CONSTRAINT pk_Id_Categoria PRIMARY KEY (Id_Categoria);

ALTER TABLE tb_estado
ADD CONSTRAINT pk_SiglaEstado PRIMARY KEY (SiglaEstado);

ALTER TABLE tb_cidade
ADD CONSTRAINT pk_Id_Cidade PRIMARY KEY (Id_Cidade);

ALTER TABLE tb_cliente
ADD CONSTRAINT pk_Id_Cliente PRIMARY KEY (Id_Cliente);

ALTER TABLE tb_conjuge
ADD CONSTRAINT pk_Id_Cliente PRIMARY KEY (Id_Cliente),
ADD CONSTRAINT fk_Id_Cliente FOREIGN KEY (Id_Cliente) REFERENCES tb_cliente (Id_Cliente);

ALTER TABLE tb_funcionario
ADD CONSTRAINT pk_Id_Funcionario PRIMARY KEY (Id_Funcionario);

ALTER TABLE tb_dependente
ADD CONSTRAINT pk_Id_Dependente PRIMARY KEY (Id_Dependente),
ADD CONSTRAINT fk_Id_Funcionario FOREIGN KEY (Id_Funcionario) REFERENCES tb_funcionario (Id_Funcionario);

ALTER TABLE tb_titulo
ADD CONSTRAINT pk_Id_Titulo PRIMARY KEY (Id_Titulo),
ADD CONSTRAINT fk_Id_Categoria FOREIGN KEY (Id_Categoria) REFERENCES tb_categoria (Id_Categoria),
ADD CONSTRAINT fk_Id_Gravadora FOREIGN KEY (Id_Gravadora) REFERENCES tb_gravadora (Id_Gravadora);

ALTER TABLE tb_pedido
ADD CONSTRAINT pk_Id_Pedido PRIMARY KEY (Id_Pedido),
ADD CONSTRAINT fk_Id_Cliente FOREIGN KEY (Id_Cliente) REFERENCES tb_cliente (Id_Cliente),
ADD CONSTRAINT fk_Id_Funcionario FOREIGN KEY (Id_Funcionario) REFERENCES tb_funcionario (Id_Funcionario);

ALTER TABLE tb_TituloPedido
ADD CONSTRAINT fk_Id_Pedido FOREIGN KEY (Id_Pedido) REFERENCES tb_pedido (Id_Pedido),
ADD CONSTRAINT fk_Id_Titulo FOREIGN KEY (Id_Titulo) REFERENCES tb_titulo (Id_Titulo);

ALTER TABLE tb_TituloArtista
ADD CONSTRAINT fk_Id_Titulo FOREIGN KEY (Id_Titulo) REFERENCES tb_titulo (Id_Titulo),
ADD CONSTRAINT fk_Id_Artista FOREIGN KEY (Id_Artista) REFERENCES tb_artista (Id_Artista);

INSERT INTO tb_artista VALUES('1','Travis Scott');
INSERT INTO tb_artista VALUES('2','Caetano Veloso');
INSERT INTO tb_artista VALUES('3','Aline Barros');
INSERT INTO tb_artista VALUES('4','Eminem');
INSERT INTO tb_artista VALUES('5','Alcione');

INSERT INTO tb_categoria VALUES('1','Trap');
INSERT INTO tb_categoria VALUES('2','MPB');
INSERT INTO tb_categoria VALUES('3','Gospel');
INSERT INTO tb_categoria VALUES('4','RAP');
INSERT INTO tb_categoria VALUES('5','Samba');

INSERT INTO tb_cidade VALUES ('1', 'São Paulo', 'SP');
INSERT INTO tb_cidade VALUES ('2', 'Rio de Janeiro', 'RJ');
INSERT INTO tb_cidade VALUES ('3', 'Pernambuco', 'PE');
INSERT INTO tb_cidade VALUES ('4', 'Alagoas', 'AL');
INSERT INTO tb_cidade VALUES ('5', 'Balneário Camboriú', 'SC');

INSERT INTO tb_cliente VALUES ('1', '1', 'João Kleber', 'R. Amarildo, 234', '1200.34', 'M');
INSERT INTO tb_cliente VALUES ('2', '5', 'Ramon Augusto', 'R. José Freire, 560', '2450.65', 'M');
INSERT INTO tb_cliente VALUES ('3', '2', 'Douglas Oliveira', 'R. Laurindo, 355', '7383.54', 'M');
INSERT INTO tb_cliente VALUES ('4', '3', 'Ivone Santos', 'R. Luiz Batista, 654', '6461.51', 'F');
INSERT INTO tb_cliente VALUES ('5', '4', 'Maria Claúdia', 'Av. Dom Pedro II, 321', '8428.48', 'F');

INSERT INTO tb_conjuge VALUES ('1', 'Claudia Gomes', '1280.34', 'F');
INSERT INTO tb_conjuge VALUES ('2', 'Fernanda Vasconcelos', '1278.98', 'F');
INSERT INTO tb_conjuge VALUES ('3', 'Paulo Alves', '1275.84', 'M');
INSERT INTO tb_conjuge VALUES ('4', 'Pedro Monteiro', '4608.34', 'M');
INSERT INTO tb_conjuge VALUES ('5', 'Edson Bezerra', '1763.34', 'M');

INSERT INTO tb_dependente VALUES ('1', '1', 'Fernando Alves', 'M');
INSERT INTO tb_dependente VALUES ('2', '2', 'Miguel Barbosa', 'M');
INSERT INTO tb_dependente VALUES ('3', '3', 'Julia Silva', 'F');
INSERT INTO tb_dependente VALUES ('4', '4', 'Samira Souza', 'F');
INSERT INTO tb_dependente VALUES ('5', '4', 'Marina Souza', 'F');

INSERT INTO tb_estado VALUES('SP','São Paulo');
INSERT INTO tb_estado VALUES('RJ','Rio de Janeiro');
INSERT INTO tb_estado VALUES('AL','Alagoas');
INSERT INTO tb_estado VALUES('PE','Pernambuco');
INSERT INTO tb_estado VALUES('SC','Santa Catarina');

INSERT INTO tb_funcionario VALUES ('1', 'Keven Abraham de Souza', 'Rua Skenaro, 968', '19876.65', 'M');
INSERT INTO tb_funcionario VALUES ('2', 'Raphael Veiga', 'Rua Marcondes II, 7845', '250956.24', 'M');
INSERT INTO tb_funcionario VALUES ('3', 'Rafaela Ballerini', 'Rua Arigatô, 9563', '3146.69', 'F'); 
INSERT INTO tb_funcionario VALUES ('4', 'Mariana Moura', 'Rua Josefino da Silva, 457', '845989.55', 'F');
INSERT INTO tb_funcionario VALUES ('5', 'Roberta Ferreira Machado', 'Rua Augusto Fagundes, 859', '56268.98', 'F');

INSERT INTO tb_gravadora VALUES ('1', 'Detona Funk');
INSERT INTO tb_gravadora VALUES ('2', 'Bailão a Meia Noite');
INSERT INTO tb_gravadora VALUES ('3', 'Casarão');
INSERT INTO tb_gravadora VALUES ('4', 'DJ Markinho');
INSERT INTO tb_gravadora VALUES ('5', 'Portugal Records');

INSERT INTO tb_pedido VALUES ('1', '1', '1', '2012-05-21', '153.36');
INSERT INTO tb_pedido VALUES ('2', '2', '2', '2015-09-20', '973.48');
INSERT INTO tb_pedido VALUES ('3', '3', '3', '2020-02-06', '746.23');
INSERT INTO tb_pedido VALUES ('4', '4', '4', '2020-04-18', '765.85');
INSERT INTO tb_pedido VALUES ('5', '5', '5', '2018-05-03', '140.37');

INSERT INTO tb_titulo VALUES ('1', '1', '1', 'Amado Batista', '15.99', '6');
INSERT INTO tb_titulo VALUES ('2', '2', '2', 'Cantos da Torcida do Palmeiras', '26.99', '3');
INSERT INTO tb_titulo VALUES ('3', '3', '3', 'Flamengo', '12.85', '5');
INSERT INTO tb_titulo VALUES ('4', '4', '4', 'Mineirinho', '0.75', '7');
INSERT INTO tb_titulo VALUES ('5', '5', '5', 'Carros Trilogia', '55.36', '9');

INSERT INTO tb_TituloArtista VALUES ('1', '1');
INSERT INTO tb_TituloArtista VALUES ('2', '2');
INSERT INTO tb_TituloArtista VALUES ('3', '3');
INSERT INTO tb_TituloArtista VALUES ('4', '4');
INSERT INTO tb_TituloArtista VALUES ('5', '5');

INSERT INTO tb_TituloPedido VALUES ('1', '1', '200', '145.45');
INSERT INTO tb_TituloPedido VALUES ('2', '2', '100', '320.45');
INSERT INTO tb_TituloPedido VALUES ('3', '3', '150', '250.54');
INSERT INTO tb_TituloPedido VALUES ('4', '4', '74', '36.88');
INSERT INTO tb_TituloPedido VALUES ('5', '5', '98', '75.85');

/*JOIN 1*/
SELECT tb_categoria.NomeCategoria , tb_titulo.NomeCd FROM tb_categoria JOIN tb_titulo ON tb_categoria.Id_Categoria = tb_titulo.Id_Titulo;

SELECT tb_ctg.NomeCategoria , tb_ttl.NomeCd FROM tb_categoria tb_ctg JOIN tb_titulo tb_ttl ON tb_ctg.Id_Categoria = tb_ttl.Id_Titulo;

SELECT tb_ctg.NomeCategoria , tb_ttl.NomeCd FROM tb_categoria tb_ctg, tb_titulo tb_ttl WHERE tb_ctg.Id_Categoria = tb_ttl.Id_Titulo;

/*JOIN 2*/
SELECT tb_pedido.Id_Pedido, tb_cliente.NomeCliente FROM tb_pedido JOIN tb_cliente ON tb_pedido.Id_Pedido= tb_cliente.Id_Cliente;

/*JOIN 3*/
SELECT func.NomeFuncionario AS NomeFuncionario, depen.NomeDependente FROM tb_funcionario AS func JOIN tb_dependente AS depen ON func.Id_Funcionario = depen.Id_Dependente;

/*JOIN 4*/
SELECT tb_funcionario.NomeFuncionario, tb_pedido.ValorPedido FROM tb_funcionario JOIN tb_pedido ON tb_funcionario.Id_Funcionario= tb_pedido.Id_Pedido;

/*JOIN 5*/
SELECT tb_cliente.NomeCliente, tb_cidade.NomeCidade FROM tb_cliente JOIN tb_cidade ON tb_cliente.Id_Cliente = tb_cidade.Id_Cidade WHERE SexoCliente = 'F';

/*JOIN 6*/
SELECT tb_titulo.NomeCd, tb_gravadora.NomeGravadora FROM tb_titulo JOIN tb_gravadora ON tb_titulo.Id_Titulo = tb_gravadora.Id_Gravadora WHERE tb_titulo.NomeCd OR tb_gravadora.NomeGravadora LIKE 'r%' OR 't%';

/*JOIN 7*/
SELECT tb_gravadora.NomeGravadora, tb_titulo.NomeCd, tb_titulo.ValorCd, tb_titulo.QuantidadeEstoque FROM tb_gravadora JOIN tb_titulo ON tb_gravadora.Id_Gravadora = tb_titulo.Id_Titulo WHERE QuantidadeEstoque < '500';

/*JOIN 8*/
SELECT tb_cliente.NomeCliente, tb_pedido.ValorPedido FROM tb_cliente JOIN tb_pedido ON tb_cliente.Id_Cliente = tb_pedido.Id_Pedido WHERE SexoCliente='F' AND YEAR(DataPedido)=2002 AND MONTH(DataPedido)=6;

/*JOIN 9*/
SELECT tb_pedido.Id_Pedido, tb_pedido.ValorPedido, tb_pedido.DataPedido, tb_funcionario.NomeFuncionario FROM tb_pedido JOIN tb_funcionario ON tb_pedido.Id_Pedido= tb_funcionario.Id_Funcionario WHERE YEAR(DataPedido)=2003 AND NomeFuncionario LIKE 'Paula%';

/*JOIN 10*/
SELECT tb_pedido.Id_Pedido, tb_cliente.NomeCliente FROM tb_pedido JOIN tb_cliente ON tb_pedido.Id_Pedido= tb_cliente.Id_Cliente WHERE ValorPedido=(SELECT MAX(ValorPedido) FROM tb_pedido);

/*JOIN 11*/
SELECT DISTINCT tb_artista.NomeArtista, tb_categoria.NomeCategoria FROM tb_artista JOIN tb_categoria ON tb_artista.Id_Artista = tb_categoria.Id_Categoria;

/*JOIN 12*/
SELECT tb_cliente.NomeCliente, tb_cliente.Id_Cliente, tb_funcionario.NomeFuncionario, tb_funcionario.Id_Funcionario FROM tb_cliente JOIN tb_funcionario ON tb_cliente.Id_Cliente = tb_funcionario.Id_Funcionario;

/*JOIN 13*/
SELECT tb_cliente.NomeCliente, tb_titulo.NomeCD FROM tb_cliente JOIN tb_titulo ON tb_cliente.Id_Cliente = tb_titulo.Id_Titulo;

/*JOIN 14*/
SELECT tb_titulo.NomeCd, tb_gravadora.NomeGravadora, tb_categoria.NomeCategoria FROM tb_titulo JOIN tb_gravadora ON tb_titulo.Id_Titulo = tb_gravadora.Id_Gravadora JOIN tb_categoria ON tb_gravadora.Id_Gravadora= tb_categoria.Id_Categoria;

/*JOIN 15*/
SELECT tb_funcionario.NomeFuncionario, tb_dependente.NomeDependente, tb_cliente.NomeCliente, tb_conjuge.NomeConjuge FROM tb_funcionario JOIN tb_dependente ON tb_funcionario.Id_Funcionario = tb_dependente.Id_Dependente JOIN tb_cliente ON tb_dependente.Id_Dependente= tb_cliente.Id_Cliente JOIN tb_conjuge ON tb_cliente.Id_Cliente= tb_conjuge.Id_Cliente;

/*JOIN 16*/
SELECT tb_cliente.NomeCliente, tb_funcionario.NomeFuncionario, tb_titulo.NomeCd, tb_categoria.NomeCategoria, tb_gravadora.NomeGravadora FROM tb_cliente JOIN tb_funcionario ON tb_cliente.Id_Cliente = tb_funcionario.Id_Funcionario JOIN tb_titulo ON tb_funcionario.Id_Funcionario= tb_titulo.Id_Titulo JOIN tb_categoria ON tb_titulo.Id_Titulo= tb_categoria.Id_Categoria JOIN tb_gravadora ON tb_categoria.Id_Categoria= tb_gravadora.Id_Gravadora;