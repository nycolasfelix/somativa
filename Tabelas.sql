use somativanycolas;

create table nivelAcesso(
id bigint not null auto_increment,
nivel varchar(100) not null,
descricao varchar(200),
primary key(id)
);

insert into nivelAcesso (nivel,descricao) values 
('Admin','NycolasFelix'),('Gestor','Nyco'),
('Usuário','Nycolas'),('Visitante','Ny');

select *from nivelAcesso;

create table ocupacao(
id bigint not null auto_increment,
titulo varchar(150) not null,
nivelAcessoFk bigint not null,
primary key(id),
foreign key(nivelAcessoFk) references nivelAcesso(id)
);

insert into ocupacao (titulo,nivelAcessoFk) values 
('Professor',3),('Secretaria',3),
('Coordenador',2),('Orientador',2),
('Aluno',4),('TI',1);

select *from ocupacao;

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

insert into usuarios (nome,email,senha,dataNascimento,ocupacaoFk,image_perfil) values 
('Eduardo','eduardo@gmail.com','Dudu10','2004-07-16',1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fef564920920608e03abb-7d34ef097b6ab6c586dfc84157128505.ssl.cf1.rackcdn.com%2FPostImagem%2F36734%2Ffoto-de-perfil-profissional_o1eh30s23krp31qn41l3havc2fti.JPG&tbnid=anJGyJE2jcQxSM&vet=12ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygCegUIARCdAQ..i&imgrefurl=https%3A%2F%2Fwww.fotom.com.br%2Fblog-do-milani%2Ffoto-de-perfil-profissional&docid=lpxPHdJeHIsWVM&w=1920&h=1280&q=foto%20perfil&ved=2ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygCegUIARCdAQ%27#imgrc=e0P_kGxsQ_6qQM&imgdii=6tXptaVKQ43kpM'),
('Anderson','anderson@gmail.com','Anderson10','1978-12-16',2,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fef564920920608e03abb-7d34ef097b6ab6c586dfc84157128505.ssl.cf1.rackcdn.com%2FPostImagem%2F36734%2Ffoto-de-perfil-profissional_o1eh30s23krp31qn41l3havc2fti.JPG&tbnid=anJGyJE2jcQxSM&vet=12ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygCegUIARCdAQ..i&imgrefurl=https%3A%2F%2Fwww.fotom.com.br%2Fblog-do-milani%2Ffoto-de-perfil-profissional&docid=lpxPHdJeHIsWVM&w=1920&h=1280&q=foto%20perfil&ved=2ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygCegUIARCdAQ%27#imgrc=Iv0IG_qk6b04_M&imgdii=R2K9YcfI7NjQEM'),
('Juliana','juliana@gmail.com','Juliana10','1984-03-04',2,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fs2.glbimg.com%2FHag3JEWvLvMo2dc32cQddw8aMWM%3D%2F0x0%3A850x572%2F924x0%2Fsmart%2Ffilters%3Astrip_icc()%2Fi.s3.glbimg.com%2Fv1%2FAUTH_da025474c0c44edd99332dddb09cabe8%2Finternal_photos%2Fbs%2F2022%2Fd%2Fv%2FkFDwF0T3q2wkwvGH0DjA%2Fwhatsapp-image-2022-10-03-at-15.34.37.jpeg&tbnid=oitogPaAoIudoM&vet=12ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygLegUIARCwAQ..i&imgrefurl=https%3A%2F%2Foglobo.globo.com%2Fsaude%2Fmedicina%2Fnoticia%2F2022%2F10%2Fo-que-a-sua-foto-de-perfil-quer-dizer-sobre-voce.ghtml&docid=e-FsvWy4qLPSVM&w=924&h=622&q=foto%20perfil&ved=2ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygLegUIARCwAQ%27#imgrc=r--W7FbtNd9bMM&imgdii=loOpB2Xh5Ku_zM'),
('Lorena','lorena@gmail.com','Lorena10','2019-07-04',4,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fs2.glbimg.com%2FHag3JEWvLvMo2dc32cQddw8aMWM%3D%2F0x0%3A850x572%2F924x0%2Fsmart%2Ffilters%3Astrip_icc()%2Fi.s3.glbimg.com%2Fv1%2FAUTH_da025474c0c44edd99332dddb09cabe8%2Finternal_photos%2Fbs%2F2022%2Fd%2Fv%2FkFDwF0T3q2wkwvGH0DjA%2Fwhatsapp-image-2022-10-03-at-15.34.37.jpeg&tbnid=oitogPaAoIudoM&vet=12ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygLegUIARCwAQ..i&imgrefurl=https%3A%2F%2Foglobo.globo.com%2Fsaude%2Fmedicina%2Fnoticia%2F2022%2F10%2Fo-que-a-sua-foto-de-perfil-quer-dizer-sobre-voce.ghtml&docid=e-FsvWy4qLPSVM&w=924&h=622&q=foto%20perfil&ved=2ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygLegUIARCwAQ%27#imgrc=kntFeG7TgYk5WM&imgdii=tAjhJu-4R9j8TM'),
('Nycolas','nycolas@gmail.com','Nycolas10','2005-02-01',1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fef564920920608e03abb-7d34ef097b6ab6c586dfc84157128505.ssl.cf1.rackcdn.com%2FPostImagem%2F36734%2Ffoto-de-perfil-profissional_o1eh30s23krp31qn41l3havc2fti.JPG&tbnid=anJGyJE2jcQxSM&vet=12ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygCegUIARCdAQ..i&imgrefurl=https%3A%2F%2Fwww.fotom.com.br%2Fblog-do-milani%2Ffoto-de-perfil-profissional&docid=lpxPHdJeHIsWVM&w=1920&h=1280&q=foto%20perfil&ved=2ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygCegUIARCdAQ%27#imgrc=mFYRrjMefqXFQM&imgdii=MEwWI0que30WvM'),
('Buster','buster@gmail.com','Buster10','2008-05-25',3,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fef564920920608e03abb-7d34ef097b6ab6c586dfc84157128505.ssl.cf1.rackcdn.com%2FPostImagem%2F36734%2Ffoto-de-perfil-profissional_o1eh30s23krp31qn41l3havc2fti.JPG&tbnid=anJGyJE2jcQxSM&vet=12ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygCegUIARCdAQ..i&imgrefurl=https%3A%2F%2Fwww.fotom.com.br%2Fblog-do-milani%2Ffoto-de-perfil-profissional&docid=lpxPHdJeHIsWVM&w=1920&h=1280&q=foto%20perfil&ved=2ahUKEwi29sLH75v_AhX5N7kGHXaUDM4QMygCegUIARCdAQ%27#imgrc=EDU_T-mJD1zIrM&imgdii=UPsIiHOr8GHauM');

select *from usuarios;

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

