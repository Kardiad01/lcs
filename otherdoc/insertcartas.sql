drop database if exists lascartasdesofia;
create database if not exists lascartasdesofia;
use lascartasdesofia;
drop table if exists conceptos;
create table if not exists conceptos(
	id int unsigned auto_increment primary key,
    nombre varchar(100),
    tipo enum('concepto', 'replica', 'contrareplica'),
    contra int,
    beneficio int,
    referencia varchar(100),
    costo varchar(10),
    busca varchar(50),
    roba int,
    turnos int,
    descripcion varchar(300),
    texto_aparicion varchar(1000)
);

#Cartas racionalistas
insert into conceptos(nombre, tipo, contra, beneficio, referencia, costo, turnos, busca , roba , descripcion, texto_aparicion) values
		('Duda metódica', 'replica', 1, 3, null, '3@t', 5, 'Pienso luego existo', 0, 'Cuando juegas quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca Pienso luego existo y ganas 3 puntos de debate, quitándole 1 al rival', 'texto'),
		('Pienso Luego Existo', 'concepto', 5, 1, null, '4@t', 0, '@replica', 0, 'Este concepto quita 2 puntos al rival y te da 1 a tí, éste te permite obtener 1 carta de réplica al jugarla', 'texto'),
		('Deducción', 'contrareplica', 0, 0, null, '3@t', 0, '2@replica', 0, 'Si el rival juega una carta replica, puedes jugar esta carta. Si la juegas buscas 2 cartas réplica', 'texto'),
		('Imaginacion', 'concepto', 0, 1, 'Pienso Luego Existo', '3@t', 0, '1@concepto', 0, 'Si "Pienso Luego Existo" está en el campo, puedes jugar esta carta, tras jugarla ganas 1 punto de debate y obtenes 2 cartas del tipo concepto', 'texto'),
		('Dios', 'concepto', 5, 5, null, '6@t', 0, '2@replica', 0, 'Juegas esta carta restas 2 puntos al rival y te da 2 a tí, posterormente buscas 2 cartas réplica' , 'texto'),
		('Yo', 'concepto', 5, 5, null, '6@t', 0, '1@contrareplica', 0, 'Cuando juegas esta carta restas 2 puntos al rival y te da 2 a tí, posteriormente buscas una 1 contraréplica', 'texto'),
		('Mundo', 'concepto', 5, 5, null, '6@t', 0, '1@replica|1@contrareplica', 0, 'Cuando juegas esta carta restas 2 puntos al rival y te da 2 a tí, posteriormente busca 1 réplica y 1 contraréplica', 'texto'),
		('Pensar', 'replica', 3, 1, 'Pienso Luego Existo', '3@t', 0, '1@replica', 0, 'Si "Pienso luego existo" está en el campo, puedes jugar esta carta, tras jugaarla restas 3 puntos al rival y te da a tí 1, posteriormente busca 1 réplica', 'texto'),
		('Idea de un ser más perfecto', 'replica', 0, 5, 'Pienso Luego Existo', '3@t', 0, 'Dios', null, 'Cuando juegas esta carta ganas 2 puntos, posteriormente busca 1 concepto Dios', 'texto'),
		('Ideas', 'contrareplica', 5, 5, null, '3@t', 0, '2@replicas', 0, 'Cuando juegas esta carta quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca 2 réplicas', 'texto'),
		('Precipitación', 'replica', 1, 5, null, '3@t', 0, 'Duda metódica', 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 2 puntos, posteriormente busca una Duda metódica', 'texto');
insert into conceptos(nombre, tipo, contra, beneficio, referencia, costo, turnos, busca , roba , descripcion, texto_aparicion) values        
		('Conocimiento cierto', 'contrareplica', 1, 1, null, '3@t', 0, '1@replica', 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 2 puntos, posteriormente busca 1 carta réplica', 'texto'),
		('Verdadero método', 'contrareplica', 1,1, null, '3@t', 0, '1@replica', 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 1 punto, posteriormente busca 1 carta réplica', 'texto'),
		('Clara', 'replica', 5, 5, null, '3@t', 0, '1@replica', 0, 'Cuando juegas esta carta quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca 1 carta réplica', 'texto'),
		('Distinción', 'replica', 3, 0, null, '3@t', 0, '1@contrareplica', 0, 'Cuando juegas esta carta quitas 3 puntos al rival, posteriormente busca 1 carta de contraréplica', 'texto'),
		('Espíritu', 'contrareplica', 7, 0, 'Yo', '7@t', 0, null, 0, 'Si "Yo" está en el campo, puedes jugar esta carta, tras jugarla el rival perderá 7 puntos', 'texto'),
		('Verdadero', 'contrareplica', 1, 5, null, '2@t', 0, '1@replica', 0, 'Cuando juegas esta carta quitas 1 punto al rival y tú ganas 5 posteriormente busca 1 carta réplica', 'texto'),
		('Opiniones', 'replica', 5, 1, null, '1@t', 0, null, 0, 'Cuando juegas esta carta quitas 2 puntos al rival y tu ganas 1.', 'text'),
		('Ciencias', 'replica', 5, 5, 'Mundo|Yo|Duda metódica', '7@t', 0, '4@replica|1@contrareplica', 0 , 'Si "Mundo", "Yo", "Duda metódica" están en el campo, puedes jugar esta carta, tras jugarla el rival pierde 5 puntos, y tú ganas 5 además de poder buscar 4 réplicas y 1 contraréplica', 'texto'),
		('Entendimiento', 'replica', 9, 0, 'Yo|Dios', '10@t', 0, null, 0, 'Si "Yo" y "Dios" están en el campo, puedes jugar esta carta, tras jugarla el rival perde 9 puntos', 'text0'),
		('Esencia', 'concepto', 1, 3, null, '3@t', 0, null, 0, 'Cuando juegas esta carta quitas 1 punto al rival y tú ganas 3', 'text'),
		('Res extensa', 'replica', 3, 5, 'Esencia', '5@t', 0, '1@concepto', 0, 'Si "Esencia" está en el campo puedes jugar esta carta, tras jugarla el rival pierde 3 puntos y tú ganas 5 además puedes buscar un concepto', 'texto'),
		('Res cogitans', 'replica', 5, 0, 'Esencia', '3@t', 0, null, 0, 'Si "Esencia" está en el campo puedes jugar esta carta, el rival pierde 5 puntos', 'text'),
		('Pensar', 'contrareplica', 5, 4, null, '4@t', 0, null, 0, 'Cuando juegas esta carta quitas 2 puntos al rival y tú ganas 4' , 'text');
#Cartas empiristas
insert into conceptos (nombre, tipo, contra, beneficio, referencia, costo, turnos, busca, roba, descripcion, texto_aparicion)values
		('Experiencia Sensible',	'concepto',	5,	5,	null,	'5@t',	0,	null,	0,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2 puntos', 'texto'),
		('Inmanencia',	'concepto',	5,	5,	'Experiencia Sensible',	'3@t',	0,	null,	5,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 2 cartas','texto'),
		('Asociacion',	'concepto',	1,	1,	null,	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 1 punto y tú ganas 1. Robas 1 carta',	'texto'),
		('Semejanza',	'replica',	5,	5,	'Asociacion',	'2@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.',	'texto'),
		('Contigüidad',	'replica',	5,	5,	'Asociacion',	'2@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.',	'texto'),
		('Causa-Efecto',	'replica',	5,	5,	'Asociacion',	'2@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.',	'texto'),
		('Impresiones',	'concepto',	3,	1,	null,	'2@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 1. Robas 1 carta.',	'texto'),
		('Ideas',	'replica',	5,	4,	'Asociacion',	'4@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.',	'texto'),
		('Hábito',	'concepto',	5,	4,	null,	'4@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.',	'texto'),
		('Crítica',	'replica',	5,	1,	'Inmanencia',	'1@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 1. Robas 1 carta.',	'texto'),
		('Contradiccion',	'contrareplica',	3,	1,	'Asociacion',	'1@t',	0, null ,	1,	'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 1. Robas 1 carta.',	'texto'),
		('Causa',	'replica',	4,	3,	'Asociacion',	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 3. Robas 1 carta.',	'texto'),
		('Creencia',	'concepto',	5,	3,	null,	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.',	'texto'),
		('Sentimiento',	'concepto',	4,	1,	null,	'1@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 1. Robas 1 carta.',	'texto'),
		('Mérito',	'replica',	3,	3,	'Utilidad',	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 3. Robas 1 carta.',	'texto'),
		('Utilidad',	'concepto',	1,	5,	null,	'2@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 2. Robas 1 carta.',	'texto'),
		('Felicidad',	'concepto',	5,	3,	null,	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.',	'texto'),
		('Contrato Social',	'replica',	4,	3,	'Utilidad',	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 3. Robas 1 carta.',	'texto'),
		('Libertad',	'concepto',	1,	3,	null,	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 3. Robas 1 carta.',	'texto'),
		('Deber',	'contrareplica',	3,	3,	'Utilidad',	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 3. Robas 1 carta.',	'texto'),
		('Representación',	'concepto',	3,	4,	'Impresiones',	'4@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 4. Robas 1 carta.',	'texto'),
		('Contemplación',	'concepto',	1,	5,	'Impresiones',	'2@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 2. Robas 1 carta.',	'texto'),
		('Práctica',	'replica',	5,	3,	'Libertad',	'3@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.',	'texto'),
		('Negación de Transcensus',	'replica',	5,	4,	'Inmanencia',	'4@t',	0,	null ,	1,	'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.','texto');

update conceptos set referencia =2 where referencia = 'Pienso Luego Existo';
update conceptos set referencia = 6 where referencia = 'Yo';
update conceptos set referencia = 7 where referencia = 'Mundo';
update conceptos set referencia = 21 where referencia = 'Esencia';
update conceptos set referencia = 25 where referencia = 'Experiencia Sensible';
update conceptos set referencia = 27 where referencia = 'Asociacion';
update conceptos set referencia = 26 where referencia = 'Inmanencia';
update conceptos set referencia = 40 where referencia = 'Utilidad';
update conceptos set referencia = 31 where referencia = 'Impresiones';
update conceptos set referencia = 43 where referencia = 'Libertad';
update conceptos set referencia = '7|6|1' where referencia = 'Mundo|Yo|Duda metódica';
update conceptos set referencia = '5|6' where referencia = 'Yo|Dios';


drop table if exists jugador;
create table if not exists jugador (
	id int unsigned auto_increment primary key,
    nombre varchar(250),
    contrasena varchar(250),
    id_google varchar(100),
    direccion varchar(100),
    img_perfil varchar(500),
    enlinea tinyint(1) default 0,
    codigo_recuperacion int,
    debates_realizados int,
    debates_ganados int,
    debates_perdidos int,
    dinero float default 50,
    elo int default 1000
);

drop table if exists disciplina;
create table if not exists disciplina (
	id int unsigned auto_increment primary key,
    nombre varchar(250),
    win_condition varchar(250)
);

/*
	La win condition aparecerá como texto porque la lógica la llevará una clase carta que 
    juntará cosas con la win condition del autor.
*/
insert into disciplina (nombre, win_condition) values
	('Racionalistas', 'Metafísica Generalis'),
    ('Empiristas', 'Materialismo Idealista');

drop table if exists argumentario;
create table if not exists argumentario(
	id int unsigned auto_increment primary key,
    id_jugador int unsigned,
    nombre varchar(250),
    foreign key (id_jugador) references jugador(id)
);

drop table if exists argumentario_cartas;
create table if not exists argumentario_conceptos(
	id_argumentario int unsigned,
    id_concepto int unsigned,
    foreign key (id_argumentario) references argumentario(id),
    foreign key (id_concepto) references conceptos(id)
);



drop table if exists autor;
create table if not exists autor (
	id int unsigned auto_increment primary key,
    nombre varchar(250),
    apellidos varchar(250),
    cartas_relevantes varchar(10),
    id_disciplina int unsigned,
	foreign key (id_disciplina) references disciplina(id)
);

insert into autor (nombre, apellidos, cartas_relevantes, id_disciplina) values
	('René', 'Descartes', '7|6|1', 1),
    ('David', 'Hume', '25', 2);

drop table if exists libro;
create table if not exists libro (
	id int unsigned auto_increment primary key,
    titulo varchar(250),
    precio float,
    id_disciplina int unsigned,
    id_autor int unsigned,
    foreign key (id_disciplina) references disciplina(id),
    foreign key (id_autor) references autor(id)
);

create table if not exists libro_jugador(
	id_jugador int unsigned,
    id_libro int unsigned,
    foreign key (id_jugador) references jugador(id),
    foreign key (id_libro) references libro(id)
);

insert into libro (titulo, precio, id_disciplina, id_autor) values
	('Meditaciones Metafísicas', 10, 1, 1),
    ('Discurso del método', 10, 1 ,1),
    ('Principios de la filosofía', 10,1,1),
    ('Pasiones del alma', 10, 1, 1),
    ('Tratado de la naturaleza humana', 10, 2, 2),
    ('Investigación sobre el entendimiento humano', 10, 2, 2),
    ('Investigación sobre los principios de la moral', 10, 2, 2),
    ('Historia natural de la religión', 10, 2, 2);

drop table if exists concepto_libros;
create table if not exists concepto_libros(
	id_libro int unsigned,
    id_concepto int unsigned,
    foreign key (id_libro) references libro(id),
    foreign key (id_concepto) references conceptos(id)
);

insert into concepto_libros (id_libro, id_concepto) values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(2,11),
(3,12),
(3,13),
(3,14),
(3,15),
(3,16),
(3,17),
(4,18),
(4,19),
(4,20),
(4,21),
(4,22),
(4,23),
(4,24),
(5,25),
(5,26),
(5,27),
(5,28),
(5,29),
(6,30),
(6,31),
(6,32),
(6,33),
(6,34),
(6,35),
(7,36),
(7,37),
(7,38),
(7,39),
(7,40),
(7,41),
(8,42),
(8,43),
(8,44),
(8,45),
(8,46),
(8,47),
(8,48);

drop table if exists jugador_libros;
create table if not exists jugador_libros(
	id_jugador int unsigned,
    id_libro int unsigned,
	foreign key (id_libro) references libro(id),
	foreign key (id_jugador) references jugador(id)
);



drop table if exists debate;
CREATE TABLE debate (
  id int UNSIGNED NOT NULL,
  tema varchar(100) DEFAULT NULL,
  tiempo_jugador1 int,
  tiempo_jugador2 int,
  puntos_conviccion_jugador1 int DEFAULT 0,
  puntos_conviccion_jugador2 int DEFAULT 0,
  id_jugador1 int UNSIGNED DEFAULT NULL,
  id_jugador2 int UNSIGNED DEFAULT NULL,
  id_argumentario_jugador1 int UNSIGNED DEFAULT NULL,
  id_argumentario_jugador2 int UNSIGNED DEFAULT NULL,
  estado_debate enum('con asientos','sin asientos') DEFAULT 'con asientos',
  replicas_jugador1 int DEFAULT 4,
  replicas_jugador2 int DEFAULT 4,
  carta_senalada_jugador1 int UNSIGNED DEFAULT NULL,
  carta_senalada_jugador2 int UNSIGNED DEFAULT NULL
);

drop table if exists conceptos_jugador;
create table if not exists conceptos_jugador(
	id_concepto int unsigned,
    id_jugador int unsigned
);


drop table if exists masterizados;
create table if not exists masterizados(
	id_jugador int unsigned,
    id_libro int unsigned,
    foreign key (id_jugador) references jugador(id),
    foreign key (id_libro) references libro(id)
);

drop table if exists amigos;
create table if not exists amigos(
	id_solicitado int unsigned,
    id_solicitante int unsigned,
    foreign key (id_solicitado) references jugador(id),
    foreign key (id_solicitante) references jugador(id)
);

drop trigger if exists paga;
delimiter 😂
create trigger paga
after insert on jugador_libros for each row
begin
	declare dinero_libro int;
    declare dinero_jugador int;
    set dinero_libro = (select libro.precio from libro where id = new.id_libro);
    set dinero_jugador = (select jugador.dinero from jugador where id = new.id_jugador);
    if(dinero_jugador>=dinero_libro && dinero_jugador!=0) 
    then
		update jugador set dinero = dinero_jugador - dinero_libro where jugador.id = new.id_jugador;
    end if;
end;
😂
delimiter ; 
use lascartasdesofia;
select * from amigos;
select * from jugador;
select *
from amigos
where amigos.id_solicitante = 1 and amigos.checkeado = 0
union 
select *
from amigos 
where amigos.id_solicitado = 1 and amigos.checkeado = 0;
select * from chat;