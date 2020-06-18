use infodb;

CREATE TABLE tb_usuario (
	id_usuario int PRIMARY KEY AUTO_INCREMENT,
	ds_email varchar(100),
	ds_senha varchar(100),
	bt_validado bool,
	dt_inscricao datetime,
	nm_usuario varchar(100),
	id_agendamento INT,
	dt_ultimo_acesso datetime,
    foreign key(id_agendamento)references tb_agendamento (id_agendamento)	
);

CREATE TABLE tb_cliente (
	id_cliente int PRIMARY KEY AUTO_INCREMENT,
	nm_cliente varchar(100),
	ds_cpf_cliente varchar(100),
	nr_cliente int,
	ds_endereco varchar(100),
	ds_genero varchar(100),
	id_agendamento int,
    foreign key (id_agendamento)references tb_agendamento(id_agendamento)
);

CREATE TABLE tb_agendamento (
	id_agendamento int PRIMARY KEY AUTO_INCREMENT,
	nm_cliente varchar(100),
	tp_corte varchar(100),
	dt_horario datetime,
	vl_total decimal(15,2),
	nr_cliente int,
	bt_pago bool,
	ds_complementos varchar(100)
);

CREATE table tb_produto_cabelo (
	id_produto int PRIMARY KEY AUTO_INCREMENT,
	nm_produto varchar(100),
	ds_marca varchar(100),
	vl_preco decimal(15,2),
	ds_fornecedor varchar(100),
	dt_repor_produtos datetime,
	ds_cod_barras varchar(100),
	id_agendamento INT,
	qtd_itens int,
    foreign key(id_agendamento) references tb_agendamento (id_agendamento)
);

CREATE TABLE tb_produto_agendamento (
	id_produto_agendamento int PRIMARY KEY AUTO_INCREMENT,
	id_produto int,
	id_agendamento int,
    foreign key (id_produto)references tb_produto_cabelo (id_produto),
    foreign key (id_agendamento)references tb_agendamento (id_agendamento) 
);

create table tb_corte (
	id_corte int PRIMARY KEY auto_increment,
	tp_corte varchar(100),
	vl_preco_corte decimal (15,2),
	ds_produtos_usados varchar(100)
);

CREATE TABLE tb_corte_agendamento (
	id_corte_agendamento int PRIMARY KEY AUTO_INCREMENT,
	id_corte int,
	id_agendamento int,
    foreign key (id_corte)references tb_corte (id_corte),
    foreign key (id_agendamento)references tb_agendamento (id_agendamento) 
);

use infodb;
select * from tb_agendamento;
select * from tb_corte_agendamento;
select * from tb_cliente;
select * from tb_produto_cabelo;
select * from tb_usuario;
select * from tb_corte;

insert into tb_agendamento(nm_cliente,tp_corte,dt_horario,vl_total,nr_cliente,bt_pago,ds_complementos)
values("Julia de Amorim","corte degrade",'2020-02-12',32.80,984312311,false,"nenhum");

insert into tb_agendamento(nm_cliente,tp_corte,dt_horario,vl_total,nr_cliente,bt_pago,ds_complementos)
values("Fernanda santos","corte blunt cut",'2020-03-30',31.99,967213315,true,"nenhum");

insert into tb_agendamento(nm_cliente,tp_corte,dt_horario,vl_total,nr_cliente,bt_pago,ds_complementos)
values("Gabriela Gomes","corte Pixie",'2020-03-11',50.0,912343721,true,"alisar o cabelo");

insert into tb_cliente(nm_cliente,ds_cpf_cliente,nr_cliente,ds_endereco,ds_genero,id_agendamento)
values("Fernanda santos","324.324422-01",967213315,"rua Olimpios casa 2","Feminino",2);

insert into tb_cliente(nm_cliente,ds_cpf_cliente,nr_cliente,ds_endereco,ds_genero,id_agendamento)
values("Julia de amorim","978.343123-31",984312311,"Rua Borboletas Psicodélicas","feminino",1);

insert into tb_cliente(nm_cliente,ds_cpf_cliente,nr_cliente,ds_endereco,ds_genero,id_agendamento)
values("Gabriela Gomes","093.324134-13",912343721,"Rua Verão do Cometa","feminino",3);

insert into tb_corte(tp_corte,vl_preco_corte,ds_produtos_usados)
values("degrade",32.8,"nenhum");

insert into tb_corte(tp_corte,vl_preco_corte,ds_produtos_usados)
values("Pixie",25.0,"nenhum");

insert into tb_corte(tp_corte,vl_preco_corte,ds_produtos_usados)
values("blunt cut",31.99,"Refletion da Wella®");

insert into tb_corte_agendamento(id_corte,id_agendamento)
values(3,2);

insert into tb_corte_agendamento(id_corte,id_agendamento)
values(1,1);

insert into tb_corte_agendamento(id_corte,id_agendamento)
values(2,3);

insert into tb_produto_cabelo(nm_produto,ds_marca,vl_preco,ds_fornecedor,dt_repor_produtos,ds_cod_barras,id_agendamento,qtd_itens)
values("Finalizador Oil Reflection","Refletion da Wella",119.9,"Wella Professionals",'2020-10-10',"098452345",3,50);

insert into tb_usuario(ds_email,ds_senha,bt_validado,dt_inscricao,nm_usuario,id_agendamento,dt_ultimo_acesso)
values ("pauloAlberto@gmail.com","p@odeb4tata",true,'2019-02-11',"Paulo Alberto",1,'2020-02-10');

insert into tb_usuario(ds_email,ds_senha,bt_validado,dt_inscricao,nm_usuario,id_agendamento,dt_ultimo_acesso)
values ("sarah.santos1@gmail.com","002133",true,'2019-03-02',"Sarah Santos",3,'2020-02-01');

