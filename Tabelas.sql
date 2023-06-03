use somativanycolas;

create table nivelAcesso(
id bigint not null auto_increment,
nivel varchar(100) not null,
descricao varchar(200),
primary key(id)
);

create table ocupacao(
id bigint not null auto_increment,
titulo varchar(150) not null,
nivelAcessoFk bigint not null,
primary key(id),
foreign key(nivelAcessoFk) references nivelAcesso(id)
);

create table usuarios(
id bigint not null auto_increment,
nome varchar(150) not null,
email varchar(150) not null,
datadenascimento date not null,
senha varchar(30) not null,
datadecadastro datetime not null default now(),
ocupacaoFk bigint not null,
status boolean not null default true,
imagemperfil mediumtext not null,
primary key(id),
foreign key(ocupacaoFk) references ocupacao(id)
);

create table locais(
id bigint not null auto_increment,
nome varchar(150) not null,
bloco enum('A','B','C','D') not null,
lotacao int not null,
primary key(id)
);

create table item(
id bigint not null auto_increment,
nome varchar(150) not null,    
primary key(id)
);

create table checkList(
id bigint not null auto_increment,
localFk bigint not null,
itemFk bigint not null,
quantidade int not null default 1,
primary key(id),
foreign key(localFk) references locais(id),
foreign key(itemFk) references item(id)
);

create table eventos(
id bigint not null auto_increment,
nome varchar(200) not null,
localFk bigint not null,
inicio datetime not null,
fim datetime not null,
inicioCheckIn datetime not null,
fimCheckIn datetime not null,
vagas int not null,    
primary key(id),
foreign key(localFk) references locais(id)
);

create table checkIn(
id bigint not null auto_increment,    
eventoFk bigint not null,
usuarioFk bigint not null,
data datetime not null default now(),
primary key(id),
foreign key(eventoFk) references eventos(id),
foreign key(usuarioFk) references usuarios(id)
);

create table responsavel (
id bigint not null auto_increment,
responsavel_fk bigint not null,
primary key(id),
foreign key (responsavel_fk) references usuarios(id)
);

create table tarefa (
id bigint not null auto_increment,
titulo varchar(50) not null,
descricao varchar(500) not null,
usuarioFk bigint not null,
responsavel_fk bigint not null,
prazolimit date not null,
locais_FK bigint not null,
imagens mediumtext,
primary key(id),
foreign key(usuarioFk) references usuarios(id),
foreign key(responsavel_fk) references responsavel(id),
foreign key(locais_FK) references locais(id)
);

create table status (
id bigint not null auto_increment,
name varchar(100) not null,
primary key(id)
);

create table imagens_status (
id bigint not null auto_increment,
imagem mediumtext,
primary key(id)
);

create table progressos (
id bigint not null auto_increment,
descrisao varchar(100) not null,
data datetime not null,
imagens_status_FK bigint not null,
tarefa_FK bigint not null,
status_FK bigint not null,
primary key(id),
foreign key(tarefa_FK) references tarefa(id),
foreign key(status_FK) references status(id),
foreign key(imagens_status_FK) references imagens_status(id)
);

