use formativaHogwarts;

alter table usuarios
add column foto varchar (1000) not null;

alter table usuarios
add column telefone varchar (30) not null;

create table usuarios(
    id bigint not null auto_increment,
    nome varchar(150) not null,
    email varchar(100) not null,
    data_de_Nascimento date not null,
    senha varchar(50) not null,
    data_de_Cadastro datetime default now(),
    status boolean default true,
    foto varchar(150),
    telefone varchar(11),
    ocupacaoFK bigint not null,
    primary key(id),
    foreign key(ocupacaoFK) references ocupacao(id)
);

select *from usuarios;
insert into usuarios (telefone) values 
('19977777777'),('19911111111'),
('19988888888'),('19922222222'),
('19999999999'),('19933333333');

create table fototarefa(
    id bigint not null auto_increment,
    fotosolicitaçoes varchar(150),
    primary key (id)
);

select *from fototarefa;
insert into fototarefa (fotosolicitaçoes) values 
('lampada'),('tv'),
('armario'),('cafeteira'),
('mesa'),('teclado');

create table gestor (
    id bigint not null auto_increment,
    usuarioFK bigint not null,
    tarefaFK bigint not null,
    primary key (id),
    foreign key (usuarioFK) references usuarios(id)
);
select *from gestor;
insert into gestor (usuarioFK) values 
('1'),('2'),
('3'),('5'),('6');

create table statustarefa (
    id bigint not null auto_increment,
    etapas boolean,
    atualizacoes datetime default now(),
    descricao varchar (300),
    fotostatus varchar(150),
    progressoFK bigint not null,
    primary key (id),
    foreign key (progressoFK) references pogresso(id)
);

select *from statustarefa;

create table progresso(
    id bigint not null auto_increment,
    nomeprocesso varchar(50),
    primary key (id)
);

select *from pogresso;

create table tarefa(
    id bigint not null auto_increment,
    nometarefa varchar (100),
    descricaoo varchar (500),
    datasolicitacao datetime default now(),
    datainicio datetime,
    datafim datetime,
    prazoexec datetime,
    localFK bigint  not null,
    gestorFK bigint not null,
    statusFK bigint not null,
    fototarefaFK bigint not null,
    usuaririosFK bigint not null,
    primary key (id),
    foreign key (localFK) references locais(id),
    foreign key (gestorFK) references gestor(id),
    foreign key (statusFk) references statustarefa(id),
    foreign key (fototarefaFK) references fototarefa(id),
    foreign key (usuaririosFK) references usuarios(id)
);

select *from tarefa;

select * from tarefa as tf
inner join statustarefa as st on st.id = tf.statusFK
inner join usuarios as us on us.id = tf.usuaririosFK
where st.progressoFK<2;

select lc.nome, count(tf.id) as todas_as_tarefa  from tarefa as tf
inner join locais as lc on lc.id = tf.localfk
group by lc.nome
having todas_as_tarefa > 1;

select * from tarefa as tf
inner join statustarefa as st on st.id = tf.statusFK
inner join locais as lc on lc.id = tf.localFK
inner join eventos as ev on lc.id = ev.localFk
where st.etapas = '0';

select lc.nome, count(tf.id) as todas_as_tarefa from tarefa as tf
inner join locais as lc on lc.id = tf.localFK
group by lc.nome;

select lc.nome, count(tf.id) total_tarefa_completas from tarefa as tf
inner join statustarefa as st on st.id = tf.statusFK
inner join locais as lc on lc.id = tf.localFK
inner join eventos as ev on lc.id = ev.localFk
where st.etapas = '1' and progressoFK = '4' 
group by lc.nome;

select us.nome, count(tf.id) as todas_as_tarefa from tarefa as tf
inner join usuarios as us on us.id = tf.responsavelFK
group by us.nome;

select us.nome, count(tf.id) tarefa_concluidas  from tarefa as tf
inner join usuarios as us on us.id = tf.responsavelFK
inner join statustarefa as st on st.id = tf.statusFK
where st.etapas = '1' and progressoFK = '4' 
group by us.nome;

select month(t.comeco_data) as mes, l.local_nome, count(t.tarefa_id) as total_tarefas from tarefas t 
join locais l on t.localFK = l.id group by mes, l.local_nome;
