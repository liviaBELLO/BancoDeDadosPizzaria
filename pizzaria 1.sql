CREATE DATABASE pizzaria;

use pizzaria;

CREATE TABLE tbl_clientes(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(250) NOT NULL,
    telefone CHAR(11) UNIQUE
);

CREATE TABLE tbl_bebidas(
	id_bebidas INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(250),
    preco FLOAT
);

CREATE TABLE tbl_pizzaSabor(
	id_pizzaSabor INT PRIMARY KEY AUTO_INCREMENT,
    sabor VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_pizzaBorda(
	id_pizzaBorda INT PRIMARY KEY AUTO_INCREMENT,
    borda VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_pizzaMassa(
	id_pizzaMassa INT PRIMARY KEY AUTO_INCREMENT,
    massa VARCHAR(100)
);

CREATE TABLE tbl_pedidos(
	id_pedidos INT PRIMARY KEY AUTO_INCREMENT,
    data DATETIME, 
    valorTotal FLOAT,
    fk_cliente INT,
    fk_bebidas INT,
    fk_pizzas INT,
    
    FOREIGN KEY(fk_cliente) REFERENCES tbl_clientes(id_cliente),
    FOREIGN KEY(fk_bebidas) REFERENCES tbl_bebidas(id_bebidas),
    FOREIGN KEY(fk_pizzas) REFERENCES tbl_pizzas(id_pizza)
    
);

CREATE TABLE tbl_pizzas(
	id_pizza INT PRIMARY KEY AUTO_INCREMENT,
    nomePizza VARCHAR(100),
    fk_sabor INT,
    fk_borda INT,
    fk_massa INT,
    
    FOREIGN KEY(fk_sabor) REFERENCES tbl_pizzaSabor(id_pizzaSabor),
    FOREIGN KEY(fk_borda) REFERENCES tbl_pizzaBorda(id_pizzaBorda),
    FOREIGN KEY(fk_massa) REFERENCES tbl_pizzaMassa(id_pizzaMassa)
);

CREATE TABLE tbl_fornadas(
	id_fornada INT PRIMARY KEY AUTO_INCREMENT,
    data DATETIME,
    fk_idPedido INT,
    fk_idPizza INT,
    
    FOREIGN KEY(fk_idPedido) REFERENCES tbl_pedidos(id_pedidos),
    FOREIGN KEY(fk_idPizza) REFERENCES tbl_pizzas(id_pizza)
);