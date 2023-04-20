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
drop table if exists concepto_libros;
create table if not exists concepto_libros(
	id_concepto int unsigned,
    id_libro int unsigned,
    foreign key (id_concepto) references conceptos(id),
    foreign key (id_libro) references libro(id)
);

insert into conceptos(nombre, tipo, contra, beneficio, referencia, costo, turnos, busca , roba , descripcion, texto_aparicion) values
		('Duda metódica', 'replica', 1, 3, null, '3@t', 2, 'Pienso luego existo', 0, 'Cuando juegas quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca Pienso luego existo y ganas 3 puntos de debate, quitándole 1 al rival', 'texto'),
		('Pienso Luego Existo', 'concepto', 2, 1, null, '4@t', 0, '@replica', 0, 'Este concepto quita 2 puntos al rival y te da 1 a tí, éste te permite obtener 1 carta de réplica al jugarla', 'texto'),
		('Deducción', 'contrareplica', 0, 0, null, '3@t', 0, '2@replica', 0, 'Si el rival juega una carta replica, puedes jugar esta carta. Si la juegas buscas 2 cartas réplica', 'texto'),
		('Imaginacion', 'concepto', 0, 1, 'Pienso Luego Existo', '3@t', 0, '1@concepto', 0, 'Si "Pienso Luego Existo" está en el campo, puedes jugar esta carta, tras jugarla ganas 1 punto de debate y obtenes 2 cartas del tipo concepto', 'texto'),
		('Dios', 'concepto', 2, 2, null, '6@t', 0, '2@replica', 0, 'Juegas esta carta restas 2 puntos al rival y te da 2 a tí, posterormente buscas 2 cartas réplica' , 'texto'),
		('Yo', 'concepto', 2, 2, null, '6@t', 0, '1@contrareplica', 0, 'Cuando juegas esta carta restas 2 puntos al rival y te da 2 a tí, posteriormente buscas una 1 contraréplica', 'texto'),
		('Mundo', 'concepto', 2, 2, null, '6@t', 0, '1@replica|1@contrareplica', 0, 'Cuando juegas esta carta restas 2 puntos al rival y te da 2 a tí, posteriormente busca 1 réplica y 1 contraréplica', 'texto'),
		('Pensar', 'replica', 3, 1, 'Pienso Luego Existo', '3@t', 0, '1@replica', 0, 'Si "Pienso luego existo" está en el campo, puedes jugar esta carta, tras jugaarla restas 3 puntos al rival y te da a tí 1, posteriormente busca 1 réplica', 'texto'),
		('Idea de un ser más perfecto', 'replica', 0, 2, 'Pienso Luego Existo', '3@t', 0, 'Dios', null, 'Cuando juegas esta carta ganas 2 puntos, posteriormente busca 1 concepto Dios', 'texto'),
		('Ideas', 'contrareplica', 2, 2, null, '3@t', 0, '2@replicas', 0, 'Cuando juegas esta carta quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca 2 réplicas', 'texto'),
		('Precipitación', 'replica', 1, 2, null, '3@t', 0, 'Duda metódica', 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 2 puntos, posteriormente busca una Duda metódica', 'texto');
insert into conceptos(nombre, tipo, contra, beneficio, referencia, costo, turnos, busca , roba , descripcion, texto_aparicion) values        
		('Conocimiento cierto', 'contrareplica', 1, 1, null, '3@t', 0, '1@replica', 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 2 puntos, posteriormente busca 1 carta réplica', 'texto'),
		('Verdadero método', 'contrareplica', 1,1, null, '3@t', 0, '1@replica', 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 1 punto, posteriormente busca 1 carta réplica', 'texto'),
		('Clara', 'replica', 2,2, null, '3@t', 0, '1@replica', 0, 'Cuando juegas esta carta quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca 1 carta réplica', 'texto'),
		('Distinción', 'replica', 3, 0, null, '3@t', 0, '1@contrareplica', 0, 'Cuando juegas esta carta quitas 3 puntos al rival, posteriormente busca 1 carta de contraréplica', 'texto'),
		('Espíritu', 'contrareplica', 7, 0, 'Yo', '7@t', 0, null, 0, 'Si "Yo" está en el campo, puedes jugar esta carta, tras jugarla el rival perderá 7 puntos', 'texto'),
		('Verdadero', 'contrareplica', 1, 2, null, '2@t', 0, '1@replica', 0, 'Cuando juegas esta carta quitas 1 punto al rival y tú ganas 2, posteriormente busca 1 carta réplica', 'texto'),
		('Opiniones', 'replica', 2, 1, null, '1@t', 0, null, 0, 'Cuando juegas esta carta quitas 2 puntos al rival y tu ganas 1.', 'text'),
		('Ciencias', 'replica', 5, 5, 'Mundo|Yo|Duda metódica', '7@t', 0, '4@replica|1@contrareplica', 0 , 'Si "Mundo", "Yo", "Duda metódica" están en el campo, puedes jugar esta carta, tras jugarla el rival pierde 5 puntos, y tú ganas 5 además de poder buscar 4 réplicas y 1 contraréplica', 'texto'),
		('Entendimiento', 'replica', 9, 0, 'Yo|Dios', '10@t', 0, null, 0, 'Si "Yo" y "Dios" están en el campo, puedes jugar esta carta, tras jugarla el rival perde 9 puntos', 'text0'),
		('Esencia', 'concepto', 1, 3, null, '3@t', 0, null, 0, 'Cuando juegas esta carta quitas 1 punto al rival y tú ganas 3', 'text'),
		('Res extensa', 'replica', 3, 2, 'Esencia', '5@t', 0, '1@concepto', 0, 'Si "Esencia" está en el campo puedes jugar esta carta, tras jugarla el rival pierde 3 puntos y tú ganas 2, además puedes buscar un concepto', 'texto'),
		('Res cogitans', 'replica', 5, 0, 'Esencia', '3@t', 0, null, 0, 'Si "Esencia" está en el campo puedes jugar esta carta, el rival pierde 5 puntos', 'text'),
		('Pensar', 'contrareplica', 2, 4, null, '4@t', 0, null, 0, 'Cuando juegas esta carta quitas 2 puntos al rival y tú ganas 4' , 'text');