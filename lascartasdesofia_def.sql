-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lascartasdesofia
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB-0+deb11u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amigos`
--

DROP TABLE IF EXISTS `amigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amigos` (
  `id_solicitado` int(10) unsigned DEFAULT NULL,
  `id_solicitante` int(10) unsigned DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT 0,
  `checkeado` tinyint(1) DEFAULT 0,
  KEY `id_solicitado` (`id_solicitado`),
  KEY `id_solicitante` (`id_solicitante`),
  CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`id_solicitado`) REFERENCES `jugador` (`id`),
  CONSTRAINT `amigos_ibfk_2` FOREIGN KEY (`id_solicitante`) REFERENCES `jugador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigos`
--

LOCK TABLES `amigos` WRITE;
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
INSERT INTO `amigos` VALUES (2,1,1,1),(1,3,1,1),(2,4,1,1);
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `argumentario`
--

DROP TABLE IF EXISTS `argumentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `argumentario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_jugador` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `jugable` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `argumentario`
--

LOCK TABLES `argumentario` WRITE;
/*!40000 ALTER TABLE `argumentario` DISABLE KEYS */;
INSERT INTO `argumentario` VALUES (1,1,'La locura del Genio Maligno',1),(3,2,'La Locura del Genio Maligno',1),(4,4,'La locura del Genio Maligno',1),(5,2,'La superioridad del Yo frente al Genio Maligno',1),(6,2,'La idiotez de la Ignorancia',1),(7,3,'La locura del Genio Maligno',1);
/*!40000 ALTER TABLE `argumentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `argumentario_conceptos`
--

DROP TABLE IF EXISTS `argumentario_conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `argumentario_conceptos` (
  `id_argumentario` int(10) unsigned DEFAULT NULL,
  `id_concepto` int(10) unsigned DEFAULT NULL,
  KEY `id_argumentario` (`id_argumentario`),
  KEY `id_concepto` (`id_concepto`),
  CONSTRAINT `argumentario_conceptos_ibfk_1` FOREIGN KEY (`id_argumentario`) REFERENCES `argumentario` (`id`),
  CONSTRAINT `argumentario_conceptos_ibfk_2` FOREIGN KEY (`id_concepto`) REFERENCES `conceptos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `argumentario_conceptos`
--

LOCK TABLES `argumentario_conceptos` WRITE;
/*!40000 ALTER TABLE `argumentario_conceptos` DISABLE KEYS */;
INSERT INTO `argumentario_conceptos` VALUES (1,27),(1,19),(1,14),(1,12),(1,29),(1,3),(1,5),(1,15),(1,1),(1,20),(1,21),(1,16),(1,25),(1,9),(1,10),(1,4),(1,26),(1,7),(1,18),(1,8),(3,14),(3,12),(3,3),(3,5),(3,15),(3,1),(3,21),(3,16),(3,9),(3,10),(3,4),(3,7),(3,18),(3,24),(3,8),(3,2),(3,11),(3,22),(3,17),(3,13),(4,19),(4,14),(4,12),(4,3),(4,5),(4,15),(4,1),(4,20),(4,16),(4,9),(4,4),(4,7),(4,18),(4,24),(4,8),(4,11),(4,23),(4,22),(4,17),(4,13),(5,5),(5,6),(5,7),(5,2),(5,1),(5,21),(5,16),(5,9),(5,10),(5,4),(5,18),(5,22),(5,17),(5,13),(5,14),(5,12),(5,15),(5,24),(5,8),(5,11),(6,14),(6,12),(6,3),(6,5),(6,15),(6,1),(6,21),(6,11),(6,22),(6,6),(6,17),(6,13),(6,4),(6,10),(6,16),(6,2),(6,7),(6,18),(6,24),(6,8),(7,27),(7,36),(7,30),(7,46),(7,29),(7,35),(7,42),(7,37),(7,34),(7,44),(7,3),(7,5),(7,1),(7,25),(7,41),(7,33),(7,32),(7,4),(7,31),(7,26);
/*!40000 ALTER TABLE `argumentario_conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `apellidos` varchar(250) DEFAULT NULL,
  `cartas_relevantes` varchar(10) DEFAULT NULL,
  `id_disciplina` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'René','Descartes','7|6|1',1),(2,'David','Hume','25',2);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id_hablante` int(10) unsigned DEFAULT NULL,
  `id_oyente` int(10) unsigned DEFAULT NULL,
  `mensaje` varchar(2000) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  KEY `id_hablante` (`id_hablante`) USING BTREE,
  KEY `id_oyente` (`id_oyente`) USING BTREE,
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_hablante`) REFERENCES `jugador` (`id`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_oyente`) REFERENCES `jugador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,3,'ola','2023-05-29 07:00:07'),(1,2,'ola','2023-05-29 07:00:32'),(1,3,'😂😂😂','2023-05-30 07:16:11'),(3,1,'Hotia los emojis funcan tu guapísimo','2023-05-30 07:16:29');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concepto_libros`
--

DROP TABLE IF EXISTS `concepto_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepto_libros` (
  `id_concepto` int(10) unsigned DEFAULT NULL,
  `id_libro` int(10) unsigned DEFAULT NULL,
  KEY `id_concepto` (`id_concepto`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `concepto_libros_ibfk_1` FOREIGN KEY (`id_concepto`) REFERENCES `conceptos` (`id`),
  CONSTRAINT `concepto_libros_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto_libros`
--

LOCK TABLES `concepto_libros` WRITE;
/*!40000 ALTER TABLE `concepto_libros` DISABLE KEYS */;
INSERT INTO `concepto_libros` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,4),(19,4),(20,4),(21,4),(22,4),(23,4),(24,4),(25,5),(26,5),(27,5),(28,5),(29,5),(30,6),(31,6),(32,6),(33,6),(34,6),(35,6),(36,7),(37,7),(38,7),(39,7),(40,7),(41,7),(42,8),(43,8),(44,8),(45,8),(46,8),(47,8),(48,8);
/*!40000 ALTER TABLE `concepto_libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos`
--

DROP TABLE IF EXISTS `conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conceptos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo` enum('concepto','replica','contrareplica') DEFAULT NULL,
  `contra` int(11) DEFAULT NULL,
  `beneficio` int(11) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `costo` varchar(10) DEFAULT NULL,
  `busca` varchar(50) DEFAULT NULL,
  `roba` int(11) DEFAULT NULL,
  `turnos` int(11) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `texto_aparicion` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos`
--

LOCK TABLES `conceptos` WRITE;
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` VALUES (1,'Duda metódica','replica',1,3,NULL,'3@t','2',0,0,'Cuando juegas quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca Pienso luego existo y ganas 3 puntos de debate, quitándole 1 al rival','Este afán de claridad y de evidencia se revela en el proceso de la duda metódica, que eli­mina cuantas objeciones pudieran oponerse a semejante fundamentación en los últimos ele­mentos intuitivos. En la duda metódica se in­daga el último criterio de toda verdad. No es una duda en un sentido escéptico con una fi­nalidad nihilista o con un propósito moral: se duda justamente porque sólo de la duda puede nacer la certeza máxima. La duda pone sólo entre paréntesis los juicios, pero no las accio­nes. Toda irresolución en estas últimas queda suprimida por lo que Descartes llama la «mo­ral provisional», indispensable para no con­vertir la actitud dubitativa en una destrucción del orden moral, político y religioso existente.'),(2,'Pienso Luego Existo','concepto',5,1,NULL,'4@t','1@replica',0,0,'Este concepto quita 2 puntos al rival y te da 1 a tí, éste te permite obtener 1 carta de réplica al jugarla','Yo pienso: luego, yo existo; yo soy, por lo pronto, una cosa pensante, algo que permanece irreducti­ble tras el absoluto dudar (Discurso, IV. Me­ditaciones, II). El Cogito es, por consiguiente, la evidencia primaria, la idea clara y distinta por antonomasia (idea distinta, certeza prima­ria, pues, más bien que primaria realidad). Tal proposición es juzgada por Descartes como una verdad inconmovible «por las más extra­vagantes suposiciones de los escépticos». El Cogito —que no debe interpretarse como un mero acto intelectual, sino como un «poseer en la conciencia»— afirma que «yo soy una cosa pensante» con completa independencia de la coincidencia del pensar con la situación objetiva y aun de la propia existencia de tal situación.'),(3,'Deducción','contrareplica',0,0,NULL,'3@t','2@replica',0,0,'Si el rival juega una carta replica, puedes jugar esta carta. Si la juegas buscas 2 cartas réplica','Muchas son las definicio­nes que se han dado de la deducción. He aquí algunas: 1) es un razonamiento de tipo me­diato; 2) es un proceso discursivo y descen­dente que pasa de lo general a lo particular; 3) es un proceso discursivo que pasa de una pro­posición a otras proposiciones hasta llegar a una proposición que se considera la conclu­sión del proceso; 4) es la derivación de lo concreto a partir de lo abstracto; 5) es la ope­ración inversa a la inducción; 6) es un razo­namiento equivalente al silogismo y, por lo tanto, una operación estrictamente distinta de la inductiva; 7) es una operación discursiva en la cual se procede necesariamente de unas proposiciones a otras.'),(4,'Imaginacion','replica',0,1,'2','3@t','1@concepto',0,0,'Si \"Pienso Luego Existo\" está en el campo, puedes jugar esta carta, tras jugarla ganas 1 punto de debate y obtenes 2 cartas del tipo concepto','. Ello tiene lugar por medio del indicado paso a la de­mostración de la existencia de Dios. Sólo Dios puede garantizar la coincidencia entre semejantes evidencias y sus existencias correspondientes. Como demostración princi­pal usa Descartes el argumento ontológico, pero le da un sentido distinto al deducir la existencia de Dios de su idea como ser infinito en el seno de la conciencia finita. Sólo porque una naturaleza infinita existe puede poner su idea en una naturaleza finita que la piensa'),(5,'Dios','concepto',5,5,NULL,'6@t','2@replica',0,0,'Juegas esta carta restas 2 puntos al rival y te da 2 a tí, posterormente buscas 2 cartas réplica','En todo caso, Descartes aspira a salir lo antes posible del fenómeno o de la conciencia con el fin de encontrar una realidad que le garan­tice la existencia de las realidades. Ello tiene lugar por medio del indicado paso a la de­mostración de la existencia de Dios. Sólo Dios puede garantizar la coincidencia entre semejantes evidencias y sus existencias correspondientes. Como demostración princi­pal usa Descartes el argumento ontológico, pero le da un sentido distinto al deducir la existencia de Dios de su idea como ser infinito en el seno de la conciencia finita.'),(6,'Yo','concepto',5,5,NULL,'6@t','1@contrareplica',0,0,'Cuando juegas esta carta restas 2 puntos al rival y te da 2 a tí, posteriormente buscas una 1 contraréplica',' La razón cartesiana puede ser consi­derada, además, como intuitiva, en el sentido de que parte de intuiciones (véase Intuición) para desembocar en intuiciones, en una ca­dena que tiene que ser perfectamente transpa­rente. Ahora bien, la filosofía de Descartes no queda detenida en el paso de la prueba de la existencia del yo como yo pensante a la prueba de Dios como ser infinito capaz de ga­rantizar al yo pensante las verdades, y en par­ticular las verdades eternas. El yo se apre­hende a sí mismo como naturaleza pensante, y aprehende a Dios como alguien que «con­curre conmigo para formar los actos de mi voluntad», pero Descartes estima que debe considerarse si hay también cosas externas. Esta consideración se hace por lo pronto, al hilo de la idea clara y distinta de lo externo. '),(7,'Mundo','concepto',5,5,NULL,'6@t','1@replica',0,0,'Cuando juegas esta carta restas 2 puntos al rival y te da 2 a tí, posteriormente busca 1 réplica y 1 contraréplica','El término ‘mundo’ designa: a) el conjunto de todas las cosas; b) el con­junto de todas las cosas creadas; c) el conjunto de entidades de una clase («el mundo de las ideas», «el mundo de las cosas físicas»); d) una zona geográfica («el Nuevo Mundo», «el Viejo Mundo»); e) una zona ge­ográfica en un período histórico («el mundo antiguo»); f)un horizonte o marco en el cual se hallan ciertos conocimientos, cosas, acon­tecimientos, etc. («el mundo de la física», «el mundo de los sueños»). Conviene, en cada caso en que se emplee el vocablo ‘mundo’, precisar su significación.'),(8,'Pensar','replica',3,1,'2','3@t','1@replica',0,0,'Si \"Pienso luego existo\" está en el campo, puedes jugar esta carta, tras jugaarla restas 3 puntos al rival y te da a tí 1, posteriormente busca 1 réplica','Como señalamos en el artículo Pensamiento, hemos distinguido, por razones puramente metodológicas, entre ‘pensa­miento’ y ‘pensar’. Consideramos que este úl­timo es un acto o una operación, principal­mente de carácter intelectual.'),(9,'Sustancia','concepto',0,5,'2','3@t','5',0,0,'Cuando juegas esta carta ganas 2 puntos, posteriormente busca 1 concepto Dios','El término ‘idea’ procede del griego ἰδέα, nombre que corresponde al verbo ἰδέῖν (= «ver»). ’Ιδέα (‘idea’) equi­vale, pues, etimológicamente, a ‘visión’ (cfr. el latín videre [= «ver»]; -vid es la raíz tanto de ἰδέῖν como de videre). Debe tenerse en cuenta, sin embargo, que esta «visión» no es sólo, ni siquiera primariamente, la que al­guien tiene de algo; la «visión» a la que se refiere la ἰδέα griega es más bien el aspecto o figura que ofrece una cosa al verla. ‘Idea’ significó luego tanto el aspecto de la cosa como el hecho de «verla». Cuando se acen­tuó lo último, la «idea» designó lo que se «ve» de una cosa cuando se contempla cierto aspecto de ésta.'),(10,'Ideas','contrareplica',5,5,NULL,'3@t','2@replica',0,0,'Cuando juegas esta carta quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca 2 réplicas','El término ‘idea’ procede del griego ἰδέα, nombre que corresponde al verbo ἰδέῖν (= «ver»). ’Ιδέα (‘idea’) equi­vale, pues, etimológicamente, a ‘visión’ (cfr. el latín videre [= «ver»]; -vid es la raíz tanto de ἰδέῖν como de videre). Debe tenerse en cuenta, sin embargo, que esta «visión» no es sólo, ni siquiera primariamente, la que al­guien tiene de algo; la «visión» a la que se refiere la ἰδέα griega es más bien el aspecto o figura que ofrece una cosa al verla. ‘Idea’ significó luego tanto el aspecto de la cosa como el hecho de «verla». Cuando se acen­tuó lo último, la «idea» designó lo que se «ve» de una cosa cuando se contempla cierto aspecto de ésta.'),(11,'Precipitación','replica',1,5,NULL,'3@t','1',0,0,'Cuando juegas esta carta quitas 1 punto al rival y ganas 2 puntos, posteriormente busca una Duda metódica',' término con el que Descartes alude a uno de los dos errores cometidos habitualmente por algunos ingenios y que son corregidos con la aplicación rigurosa y metódica de las reglas que Descartes expone en la segunda parte de su obra “Discurso del método”.'),(12,'Conocimiento','contrareplica',1,1,NULL,'3@t','1@replica',0,0,'Cuando juegas esta carta quitas 1 punto al rival y ganas 2 puntos, posteriormente busca 1 carta réplica','Se tiene un método cuando se dispone de, o se sigue, cierto «camino», ὁδός, para alcanzar un determinado fin, propuesto de antemano. Este fin puede ser el conoci­miento o puede ser también un «fin humano» o «vital»; por ejemplo, la «felicidad». En am­bos casos hay, o puede haber, un método. En este sentido decía Platón que hay que buscar el camino más apropiado para alcanzar el saber (Soph., 218 D), y cuando se trata del más alto saber, el saber, el camino o circuito más largo (Rep., VI, 504, B-E), ya que el más corto sería inadecuado para tan elevado fin. También en este sentido hablaba Aristóteles del método a seguir en «ética» (cfr., por ejem­plo, Eth. Nic., V, I, 1129 a 6). En el presente artículo nos confinaremos al método en filo­sofía y ciencia y, en general, en el conoci­miento.'),(13,'Método','contrareplica',1,1,NULL,'3@t','1@replica',0,0,'Cuando juegas esta carta quitas 1 punto al rival y ganas 1 punto, posteriormente busca 1 carta réplica',' término con el que Descartes alude a uno de los dos errores cometidos habitualmente por algunos ingenios y que son corregidos con la aplicación rigurosa y metódica de las reglas que Descartes expone en la segunda parte de su obra “Discurso del método”.'),(14,'Claridad','replica',5,5,NULL,'3@t','1@replica',0,0,'Cuando juegas esta carta quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca 1 carta réplica','Los escolásticos consideraban que un concepto de objeto es claro cuando permite distinguir el objeto de otros objetos. Un concepto claro puede ser distinto o indistinto (un concepto indistinto se llama también «confuso»),'),(15,'Distinción','replica',3,0,NULL,'3@t','1@contrareplica',0,0,'Cuando juegas esta carta quitas 3 puntos al rival, posteriormente busca 1 carta de contraréplica','Desde el punto de vista ontológico, la distin­ción ha sido tratada con frecuencia como una distinción dentro de la unidad y, por lo tanto, como una diferencia dentro de (o, según los casos, contra) la identidad. En este sentido, la noción de distinción ha desempe­ñado un papel capital en la filosofía antigua; muchas de las investigaciones metafísicas y ontológicas de Platón, Aristóteles, los estoi­cos y los neoplatónicos se hallan fundadas en una cierta concepción de la distinción. Ahora bien, aun en los casos en que la distinción era entendida ontológicamente, tenía asimismo un alcance epistemológico (o, si se quiere, ló­gico-epistemológico). En efecto, se pregun­taba no solamente qué es el ser distinto (de otro), sino también cómo puede conocerse que es distinto'),(16,'Espíritu','contrareplica',7,0,'6','7@t',NULL,0,0,'Si \"Yo\" está en el campo, puedes jugar esta carta, tras jugarla el rival perderá 7 puntos','Estos térmi­nos han sido usados, y son en parte todavía usados, en varios sentidos y dentro de muy di­versos contextos. Examinaremos aquí algunos de los significados y de los usos, y bosqueja­remos luego diversas concepciones sobre el espíritu y lo espiritual en las cuales estos tér­minos son de fundamental importancia.El término ‘espíritu’ se ha usado con fre­cuencia para traducir el vocablo griego νοῦς (nous) y también para traducir el vocablo griego πνεῦμα (pneuma). Hay razones a favor y en contra de esta traducción. Entre las razones en favor, mencionaremos las siguientes. El término νοῦς, se ha usado muchas veces para designar una realidad —o un principio de actividades— de naturaleza distinta y casi siempre «superior» a la reali­dad —o principio de actividades— designada por el vocablo ψυχή (psyche) o «alma». Mientras el «alma» (en este sentido) es algo orgánico o protoorgánico, o algo afectivo y emotivo, etc., el nous es algo «intelectual». '),(17,'Verdadero','contrareplica',1,5,NULL,'2@t','1@replica',0,0,'Cuando juegas esta carta quitas 1 punto al rival y tú ganas 5 posteriormente busca 1 carta réplica',' término con el que Descartes alude a uno de los dos errores cometidos habitualmente por algunos ingenios y que son corregidos con la aplicación rigurosa y metódica de las reglas que Descartes expone en la segunda parte de su obra “Discurso del método”.'),(18,'Opiniones','replica',5,1,NULL,'1@t',NULL,0,0,'Cuando juegas esta carta quitas 2 puntos al rival y tu ganas 1.','Como conocimiento de las aparien­cias, la opinión es el modo natural de acceso al mundo del devenir y, por lo tanto, no puede ser simplemente desechada. Sin embargo, lo que caracteriza al filósofo es el no ser «amigo de la opinión», es decir, el estar continuamente abo­cado al conocimiento de la inmutable esencia.'),(19,'Ciencias','replica',5,5,'20','7@t','2@replica',0,0,'Si \"Mundo\", \"Yo\" y \"Duda metódica\" están en el campo, puedes jugar esta carta, tras jugarla el rival pierde 5 puntos, y tú ganas 5 además de poder buscar 4 réplicas y 1 contraréplica','En la concepción de la metodología establecida en la obra \'\'El discurso del método\'\' Descartes establecería la concepción de como hacer ciencia. Ella la haría por medio de su metodología, en la que sustentaría las bases del método deductivo para poder alcanzar el conocimiento de los fenómenos que nos acontecen, puesto que su postura no puede dar credibilidad a los hechos, sí que puede darla a las imágenes mentales que se producen en el entendimiento y cómo de ellas una cosa deriva en otra'),(20,'Entendimiento','replica',9,0,'6','10@t',NULL,0,0,'Si \"Yo\" y \"Dios\" están en el campo, puedes jugar esta carta, tras jugarla el rival perde 9 puntos','El vocablo griego νοῦς (véase Nous) y el vocablo latino intellectus se traducen al español de varias ma­neras, entre ellas por ‘entendimiento’ e ‘inte­lecto’. Estos dos vocablos son a veces usados como si fuesen sinónimos. Así, por ejemplo, se escribe ‘entendimiento agente (o activo)’. En la presente obra tratamos bajo el vocablo ‘Intelecto’ de diversos sentidos que se dan a νοῦς y a intellectus en la filosofía anti­gua y medieval'),(21,'Esencia','concepto',1,3,NULL,'3@t',NULL,0,0,'Cuando juegas esta carta quitas 1 punto al rival y tú ganas 3','La esencia de algo, o como dirá también Descartes, su \'naturaleza eterna e inmutable\', consiste en sus propiedades \'necesarias\' -aquéllas sin las cuales no podemos concebir ese algo. En el caso de las substancias que reconoce Descartes, sus esencias respectivas son los distintos atributos en virtud de los cuales son distinguidas: la extensión para la substancia material, el pensamiento para el alma, la máxima perfección y realidad en el caso de Dios.'),(22,'Res extensa','replica',3,5,'21','5@t','1@concepto',0,0,'Si \"Esencia\" está en el campo puedes jugar esta carta, tras jugarla el rival pierde 3 puntos y tú ganas 5 además puedes buscar un concepto','Hemos reseñado en materia algu­nas ideas modernas sobre la noción de cuerpo. Muy influyente fue la distinción pro­puesta e insistentemente desarrollada por Descartes entre la substancia o «cosa» ex­tensa, res extensa, y la substancia o «cosa» pensante, res cogitans. El cuerpo es substan­cia extensa. En la Meditación Segunda, Des­cartes caracteriza el cuerpo en una forma aún «intuitiva», es decir, como lo entendía antes de precisar su naturaleza: «Por cuerpo en­tiendo todo lo que termina en alguna figura, lo que puede estar incluido en algún lugar y llenar un espacio de tal modo que todo otro cuerpo quede excluido, que puede ser sentido o por el tacto, o por la vista, o por el oído, o por el gusto, o por el olfato; que puede mo­verse de diversas maneras, no por sí mismo, sino por algo ajeno por el cual sea tocado y del cual reciba su impresión>>'),(23,'Res cogitans','replica',5,0,'21','3@t',NULL,0,0,'Si \"Esencia\" está en el campo puedes jugar esta carta, el rival pierde 5 puntos','  En la filosofía cartesiana esta expresión designa a las mentes. Es la realidad de la que cabe el conocimiento más cierto, conocimiento que Descartes describe con la frase «pienso luego existo». La característica esencial o atributo de la res cogitans es el pensamiento, entendido como el «ser consciente de», y las formas variables de darse o modos el pensamiento en sentido estricto, la voluntad, los sentimientos, los recuerdos y, en general lo que ahora llamamos vivencias. Descartes defenderá también tres tesis fundamentales respecto de las mentes'),(24,'Pensar','contrareplica',5,4,NULL,'4@t',NULL,0,0,'Cuando juegas esta carta quitas 2 puntos al rival y tú ganas 4','En la medida en que semejante acto u ope­ración son «mentales», parece que deben ser objeto de investigación psicológica. Como las investigaciones psicológicas pueden condu­cirse de muy distintas maneras y estar enmar­cadas dentro de muy distintos supuestos, son muy diversos los modos como cabe entender ‘pensar’. Puede hablarse de «pensar» desde un punto de vista puramente mentalista, des­de un punto de vista naturalista, desde un punto de vista conductista, etc.'),(25,'Experiencia','concepto',5,5,NULL,'5@t',NULL,0,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2 puntos','El término ‘experiencia’ se usa en varios sentidos. 1) La aprehensión por un sujeto de una realidad, una forma de ser, un modo de hacer, una manera de vivir, etcétera. La experiencia es entonces un modo de conocer algo inmediatamente antes de todo juicio formulado sobre lo aprehendido. 2) La aprehensión sensible de la realidad externa. Se dice entonces que tal realidad se da por medio de la experiencia, también por lo común antes de toda reflexión (y, como diría Husserl, pre-predicativamente). 3) La ense­ñanza adquirida con la práctica. Se habla en­tonces de la experiencia en un oficio y en ge­neral, de la experiencia de la vida. 4) La con­firmación de los juicios sobre la realidad por medio de una verificación, por lo usual sensi­ble, de esta realidad. Se dice entonces que un juicio sobre la realidad es confirmable, o verificable, por medio de la experiencia. 5) El hecho de soportar o «sufrir» algo, como cuando se dice que se experimenta un dolor, una alegría, etc.'),(26,'Inmanencia','concepto',5,5,'25','3@t',NULL,2,0,'Si \"Experiencia Sensible\" está en el campo puedes jugar esta carta, el rival pierde 2 puntos y tú ganas 2. Robas 2 cartas','Se dice de una actividad que es inmanente a un agente cuando «permanece» dentro del agente en el sentido de que tiene en el agente su propio fin. El ser in­manente se contrapone, pues, al ser trascen­dente —o «transitivo»— y, en general, la in­manencia se contrapone a la trascendencia. En el artículo Acto nos hemos refe­rido ya a dos tipos de actividades de que ha­bló Aristóteles en Met.: las actividades en que la acción pasa del agente al objeto (como «cortar», «separar», etc.) y las actividades en que la acción revierte sobre el agente y se completa en él (como «pensar»). Puede lla­marse a estas últimas propiamente «activida­des», a diferencia de las primeras, que son «movimientos».'),(27,'Asociacion','concepto',1,1,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 1 punto y tú ganas 1. Robas 1 carta','El uso del concepto de asociación en psicolo­gía es muy antiguo. Precedentes del mismo se encuentran en Aristóteles. Cuando en su tra­tado De memoria et reminiscentia (II 451 b 10 sigs.) presentó un principio de asociación en las dos formas principales de la asociación por semejanza y asociación por contigüidad. Esta tesis fue aceptada y desarrollada por los comentaristas del Estagirita y por muchos es­colásticos medievales. El asunto fue diluci­dado, además, con considerable detalle, por Juan Luis Vives en su De anima et vita. Por lo tanto, no puede decirse que solamente con los filósofos modernos y especialmente con los filósofos y psicólogos de fines del siglo XVIII y del XIX haya aparecido un concepto de asociación. Entre los filósofos modernos tra­taron el problema Hobbes, y especialmente Locke (con su concepción de la «asociación de las ideas») y Berkeley.'),(28,'Semejanza','replica',5,5,NULL,'2@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.','Estos dos términos pertenecen a un grupo de voca­blos por medio de los cuales se expresan rela­ciones (vocablos tales como ‘igualdad’, ‘iden­tidad, ‘diferencia’, ‘homogeneidad’, etc.). Grosso modo puede decirse que dos o más entidades son semejantes entre sí, o similares, cuando no son idénticas, ni son iguales, ni son distintas, pero poseen a la vez algo igual y algo distinto. Aunque dos entidades semejan­tes pueden ser homogéneas, se suele conside­rar que lo homogéneo no es siempre equiparable a lo semejante. En efecto, dos en­tidades pueden ser semejantes sin pertenecer a la misma especie.'),(29,'Contigüidad','replica',5,5,NULL,'2@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.','Las conexiones causales son inferencias probables, fundadas en las asociaciones de ideas tal como han te­nido lugar en el pasado, lo que nos permite predecir —con «certidumbre moral»— el fu­turo. Inferimos que la llama es efecto del fuego cuando asociamos mediante semejanza la impresión de la llama con ideas de llamas que hemos visto en el pasado y que hemos re­lacionado mediante contigüidad con la idea del fuego. La conexión causal es, pues, una inferencia fundada en la repetición; ésta en­gendra la «costumbre», la cual produce la «creencia».'),(30,'Causa-Efecto','replica',5,5,NULL,'2@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.',' Como la causa permite explicar por qué un cierto efecto se ha producido, se supuso muy pronto que la causa era, o podía ser, asimismo una razón o motivo de la pro­ducción del efecto. Las ideas de causa, finalidad, principio, fundamento, razón, explicación y otras similares se han relacionado en­tre sí con mucha frecuencia, y en ocasiones se han confundido. Además, al tratar las cuestiones relativas a la causa y a la acción y efecto de causar algo —la causalidad— se ha indicado no pocas veces qué cosas o aconteci­mientos, y hasta qué principio último, podían ser considerados como propiamente causas'),(31,'Impresiones','concepto',3,1,NULL,'2@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 1. Robas 1 carta.','Se ha entendido por ‘impre­sión’ la producción de una huella, impronta o «carácter» en el alma, el espíritu, etc., sobre todo cuando éstos han sido concebidos por analogía con una tabla de cera en la que los estímulos «inscriben» sus «tipos» o «imágenes». Más específicamente se ha en­tendido por ‘impresión’ la excitación de los órganos de los sentidos por estímulos exterio­res, y también la sensación o sensaciones pro­ducidas por una excitación de tales órganos. Lo usual ha sido concebir las impresiones en el nivel de la sensación o de la percepción, pero se ha hablado asimismo de impresiones en la memoria; en tal caso se supone que las impresiones han quedado fijadas de tal modo que pudiesen luego recordarse.'),(32,'Ideas','replica',5,4,NULL,'4@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.','Fundamental en el estudio propuesto por Hume es la investigación del «origen de nuestras ideas». Los resultados de la investigación de Hume a este respecto pueden resumirse en las siguientes proposiciones. En primer lugar, todo lo que el espíritu (mind) contiene son percepciones. Éstas pueden ser impresiones o ideas. La diferencia entre ellas consiste en el grado de fuerza y vivacidad: las impresiones son las percepciones que poseen mayor fuerza y violencia. Ejemplos de impresiones son las sensaciones, las pasiones y las emociones. Las ideas son solamente copias o imágenes desvaídas de las impresiones tal como las po­see el espíritu en los procesos del pensamiento y del razonamiento'),(33,'Hábito','replica',5,4,NULL,'4@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.','El vocablo ‘hábito’ se usa co­múnmente para traducir el latín habitus, usado por muchos filósofos, especialmente por los escolásticos (cfr. infra). Esta traduc­ción tiene un inconveniente: habitus es un tér­mino técnico, en tanto que ‘hábito’ no lo es. Además, ‘hábito’ puede traducir tanto habitus (disposición o manera de ser en general) como habitudo (modo de ser tal como es ma­nifestado en una o varias costumbres). Por ello se ha propuesto a veces usar habitus más bien que ‘hábito’, o bien reservar habitus para referirse a las concepciones aristotélicas o es­colásticas, y ‘habito’ para referirse a varias concepciones modernas.  Hay, en cambio, un cierto predominio de lo gnoseológico en Hume, el cual trata del há­bito o costumbre'),(34,'Crítica','replica',5,1,NULL,'1@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 1. Robas 1 carta.','Así, sin prejuzgar si la crítica humana del conocimiento es o no «anterior» a las ideas morales del autor, empezaremos con ella, tanto más cuanto que ya en ella se mani­fiesta el espíritu general de Hume como «es­céptico práctico» y como dado al «razona­miento moral» (en el sentido de ‘probable’ que tiene en su caso, y en muchos otros de su época, el vocablo ‘moral’).'),(35,'Contradiccion','contrareplica',3,1,NULL,'1@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 1. Robas 1 carta.','Dicha noción es estudiada tradicionalmente bajo la forma de un principio: el llamado «principio de contradicción» (y que podría asimismo llamarse «principio de no contradicción»). Con frecuencia, tal principio es considerado como un principio ontológico, y entonces se enuncia del modo siguiente: «Es imposible que una cosa sea y no sea al mismo tiempo y bajo el mismo respecto.» Otras ve­ces es considerado como un principio lógico (en un amplio sentido de este término), y en­tonces se enuncia del modo siguiente: «No a la vez p y no p», donde ‘p’ es símbolo de un enunciado declarativo.'),(36,'Causa','replica',4,3,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 3. Robas 1 carta.','El término griego αἰτία, traducido por «causa», tuvo originariamente un sentido jurídico y significo «acusación» o «imputación». Αἰτέω significa «acuso»; y αἰτιάομαι, «pido». Algunos autores suponen que el término latino causa procede del verbo caveo, «me defiendo», «paro el golpe», «tomo precauciones (contra alguien o algo)», y hasta «no me fío (de alguien)». Parece, pues, que también el vocablo causa tiene un previo sentido jurídico, si bien inverso al del griego; en éste se subraya la imputación mientras que en aquél se destaca la defensa.'),(37,'Creencia','concepto',5,3,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.','Indicamos en el artículo so­bre la noción de fe que en muchos ca­sos se usan ‘creencia’ y ‘fe’ indistintamente. En otros casos se usa o ‘creencia’ o ‘fe’ según ciertos hábitos lingüísticos. Hoy es bastante común usar ‘creencia’ en un sentido más ge­neral, y ‘fe’ en un sentido más específico, cuando se trata de creencia religiosa. El tér­mino más extendido hoy en contextos no reli­giosos es ‘creencia’.'),(38,'Sentimiento','concepto',4,1,NULL,'1@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 1. Robas 1 carta.','Si se entiende ‘senti­miento’ como «sentir algo» o «resultado de sentir algo», el término ‘sentimiento’ podrá tener tantas acepciones como las derivadas del verbo ‘sentir’. Por lo pronto, ‘sentimiento’ puede ser definido como «la acción y el efecto de experimentar sensaciones». Estas sensaciones pueden ser, además, de varias clases: sensaciones de los sentidos corporales, emociones, pasiones, etc. Si reservamos para las sensaciones de los sentidos corporales el nombre de «sensaciones», todavía se podrá entender ‘sentimiento’ de varios modos: como una afección, como una emoción, como una aflicción, etc. Además, puede entenderse por ‘sentimiento’ una opinión, un barrunto, una expresión de pena, etc.'),(39,'Mérito','replica',3,3,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 3. Robas 1 carta.','Mérito: En la Investigación sobre los fundamentos de la moral Hume entiende el mérito personal como el conjunto de cualidades mentales que nos llevan a apreciar o a rechazar a una persona. La naturaleza del lenguaje nos da ya una pista: cada lenguaje incluye un conjunto de términos o calificativos positivos, que nos llevan a valorar a una persona y estos conceptos pueden y deben servirnos como fundamento de la moral. Hume ordena estas virtudes de acuerdo con estos criterios: cualidades útiles para otros, cualidades útiles para uno mismo, cualidades inmediatamente agradables para otros y cualidades inmediatamente agradables para uno mismo. Este tipo de cualidades son para Hume la base de la moral y son una cuestión de hecho, no el resultado de una reflexión abstracta.'),(40,'Utilidad','concepto',1,3,NULL,'2@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 2. Robas 1 carta.','Utilidad: como definición general, podríamos entender utilidad como todo aquello que aumenta nuestro placer personal o disminuye el dolor. Este concepto se terminará convirtiendo en un principio ético y político, ligado al consecuencialismo: en el terreno ético tendemos a tomar las decisiones que nos proporcionarán mayor placer o disminuirán el dolor. Igualmente ocurrirá lo mismo en la política: hay que tener en cuenta como criterio fundamental el mayor placer o el menor dolor para la mayoría.'),(41,'Felicidad','concepto',5,3,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.','Felicidad: una primera aproximación a la felicidad en Hume podría ponerla en relación con la satisfacción de los deseos y con la búsqueda permanente del placer y el agrado personal. Sin embargo, esta concepción no estaría completa sin una referencia al bienestar de los demás, pues esta es una condición necesaria para el propio. En tercer lugar, cabría citar dos sentimientos fundamentales que juegan un papel esencial en la vida moral del ser humano: la simpatía y la benevolencia. En la Investigación sobre los fundamentos de la moral nos ofrece esta caracterización: “Una íntima paz de la mente, conciencia de integridad, un examen de nuestra propia conducta con resultados satisfactorios: éstas son las circunstancias que se requieren para la felicidad [...]”'),(42,'Contrato Social','replica',4,3,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 3. Robas 1 carta.','Contrato social: en contra de la larga tradición del contractualismo británico, Hume niega que la obediencia a las leyes se deba a un compromiso tácito. En su opinión, el concepto de contrato social es una ficción para justificar un orden que encuentra su razón de ser en un orden bien distinto: la tendencia natural del ser humano a buscar la compañía de otros (piénsese en la familia) y el beneficio personal y el interés mutuo que nos lleva a crear acuerdos que cristalizan en leyes. Nunca hubo, en consecuencia, contrato social, ni mucho menos estado de naturaleza: hay tendencias sociales dentro de cada ser humano y la política se justifica por razones empíricas y pragmáticas.'),(43,'Libertad','concepto',1,3,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 3. Robas 1 carta.','Libertad: en la Investigación sobre el entendimiento humano encontramos una de las mejores aproximaciones al concepto de libertad en Hume. Según el autor escocés, “por libertad, pues, solo podemos entender el poder de actuar o no actuar, de acuerdo a las determinaciones de la voluntad, es decir, si escogemos permanecer quietos, lo podemos hacer; si escogemos movernos, también podemos.” Con esta concepción trata Hume de compatibilizar la existencia de la libertad con el determinismo de la naturaleza. La voluntad, los sentimientos y las pasiones nos vienen dadas por la naturaleza, no podemos escogerlas. Nos empujan a actuar en una u otra dirección. Nuestra libertad consiste en actuar en la línea que nos marcan o resistirnos a la misma.'),(44,'Deber','contrareplica',3,3,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 3. Robas 1 carta.','Deber: una conocida frase de Hume nos indica cuál es su concepción del deber. Según el pensador británico, “la razón es, y solo debe ser, esclava de las pasiones”. Es decir, no hay deber moral más que aquel que nos marcan nuestras pasiones, nuestros deseos, nuestro propio interés. La simpatía, la benevolencia y la utilidad personal son las que marcan lo que debemos hacer. A este respecto es bien conocida la crítica de Hume a todas aquellas teorías éticas que pretenden fundar deberes en nuestra naturaleza. Todas ellas incurren en la falacia naturalista, según la cual no se puede inferir el deber a partir del ser, error que de una forma más o menos manifiesta comete la mayor parte de teorías éticas precedentes.'),(45,'Representación','concepto',3,4,NULL,'4@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 4. Robas 1 carta.','El término ‘repre­sentación’ es usado como vocablo general que puede referirse a diversos tipos de apre­hensión de un objeto (intencional). Así, se ha­bla de representación para referirse a la fanta­sía (intelectual o sensible) en el sen­tido de Aristóteles; a la impresión (directa o indirecta), en el sentido de los estoicos; a la presentación (sensible o intelectual, interna o externa) de un objeto intencional o repraesentatio en el sentido asimismo de los esco­lásticos; a la imaginación en el sentido de Descartes; a la aprehensión sensible, distinta de la conceptual, en el sentido de Spinoza; a la percepción en el sentido de Leibniz; a la idea en el sentido de Locke, de Hume y de al­gunos «ideólogos»; a la aprehensión general, que puede ser, como en Kant, intuitiva o con­ceptual; a la forma del mundo de los objetos como manifestaciones de la Voluntad en el sentido de Schopenhauer, etc.'),(46,'Contemplación','concepto',1,5,NULL,'2@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 2. Robas 1 carta.','Contemplar es, ori­ginariamente, ver; contemplación es, pues, vi­sión, es decir, teoría. Según los datos proporcionados por A.-J. Festugière (Contemplation et vie contemplative selon Platon, 2.ª ed., 1950), θεωρία es un compuesto de dos temas que indican igualmente la acción de ver: θέα y Fop (ὁράω). La raíz ‘Fop’ de­signa la acción de «prestar atención a», «cui­dar de», «vigilar a» y, por ende, «observar» (cfr. F. Boll, Vita contemplativa, 1922). Por eso se empleó mucho θεωρία en el sentido de división de algún espectáculo, del mundo, etc. (cfr. Herodoto, 1, 30, 4-5).'),(47,'Práctica','replica',5,3,NULL,'3@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.','La razón es sierva de las pasiones. Esto se interpreta de dos modos: por un lado, si queremos que los deberes sean efectivos necesitamos que muevan alguna pasión, amor, odio o el que sea. Hume se da cuenta de que los discursos racionales pueden formarse en grandes secuencias perfectamente elaboradas, pero cuanto más perfectamente elaboradas son menos mueven a la acción. La razón debe mover a una pasión si quiere realizarse. Por otro lado, las pasiones o emociones son activas, esto es, no ejercen solamente el papel de seducidas en la acción moral.'),(48,'Negación de Transcensus','replica',5,4,NULL,'4@t',NULL,1,0,'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.','Lo que Hume sostiene es que la identidad del yo (la identidad de cada uno de nosotros, eso que nos define) es algo fluido, cambiante, y que por lo tanto no se la puede fijar o definir de un modo completo y definitivo, por eso niega que el yo sea o pueda ser una \"substancia\", algo idéntico y permanente en términos absolutos y completos; esto es, entiende Hume, una ilusión motivada porque en efecto uno en un momento de su vida alcanza, o eso parece, una cierta \"estabilidad\" pero luego la exagera y la convierte en una ilusoria \"identidad permanente\". Por otra parte lo que \"ata\" o \"vincula\" todas esas experiencias en las que nos hemos ido definiendo poco a poco o paso a paso es, principalmente, la \"memoria\" (gracias a ella, por ejemplo, alguien puede relatarnos o narrarnos su vida, o sea: su \"identidad\", en la acepción \"fluida\" de identidad que él plantea.');
/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos_jugador`
--

DROP TABLE IF EXISTS `conceptos_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conceptos_jugador` (
  `id_jugador` int(10) unsigned DEFAULT NULL,
  `id_concepto` int(10) unsigned DEFAULT NULL,
  KEY `id_jugador` (`id_jugador`),
  KEY `id_concepto` (`id_concepto`),
  CONSTRAINT `conceptos_jugador_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id`),
  CONSTRAINT `conceptos_jugador_ibfk_2` FOREIGN KEY (`id_concepto`) REFERENCES `conceptos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos_jugador`
--

LOCK TABLES `conceptos_jugador` WRITE;
/*!40000 ALTER TABLE `conceptos_jugador` DISABLE KEYS */;
INSERT INTO `conceptos_jugador` VALUES (1,3),(1,2),(1,1),(1,4),(1,5),(1,8),(1,11),(1,7),(1,10),(1,9),(1,6),(1,13),(1,17),(1,15),(1,12),(1,16),(1,14),(1,22),(1,23),(1,24),(1,18),(1,19),(1,20),(1,21),(1,27),(1,25),(1,29),(1,28),(1,26),(2,4),(2,1),(2,3),(2,2),(2,5),(2,6),(2,10),(2,11),(2,8),(2,9),(2,7),(2,16),(2,15),(2,17),(2,14),(2,12),(2,13),(2,18),(2,24),(2,22),(2,21),(4,2),(4,3),(4,1),(4,4),(4,5),(4,8),(4,6),(4,10),(4,9),(4,11),(4,7),(4,16),(4,13),(4,17),(4,14),(4,12),(4,15),(4,23),(4,19),(4,18),(4,22),(4,24),(4,20),(3,5),(3,4),(3,2),(3,3),(3,1),(3,27),(3,25),(3,29),(3,28),(3,26),(3,30),(3,33),(3,32),(3,34),(3,35),(3,31),(3,36),(3,38),(3,41),(3,40),(3,39),(3,37),(3,48),(3,47),(3,45),(3,46),(3,43),(3,44),(3,42),(5,23),(5,18);
/*!40000 ALTER TABLE `conceptos_jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debate`
--

DROP TABLE IF EXISTS `debate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_jugador_retante` int(10) unsigned NOT NULL,
  `id_jugador_retado` int(10) unsigned NOT NULL,
  `recurso` varchar(200) DEFAULT NULL,
  `jugable` tinyint(1) DEFAULT 1,
  `ganador` int(10) unsigned DEFAULT NULL,
  `perdedor` int(10) unsigned DEFAULT NULL,
  `empate` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jugador_retante` (`id_jugador_retante`),
  KEY `id_jugador_retado` (`id_jugador_retado`),
  CONSTRAINT `debate_ibfk_1` FOREIGN KEY (`id_jugador_retante`) REFERENCES `jugador` (`id`),
  CONSTRAINT `debate_ibfk_2` FOREIGN KEY (`id_jugador_retado`) REFERENCES `jugador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debate`
--

LOCK TABLES `debate` WRITE;
/*!40000 ALTER TABLE `debate` DISABLE KEYS */;
/*!40000 ALTER TABLE `debate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `win_condition` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Racionalistas','Metafísica Generalis'),(2,'Empiristas','Materialismo Idealista');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `contrasena` varchar(250) DEFAULT NULL,
  `id_google` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `img_perfil` varchar(500) DEFAULT NULL,
  `enlinea` tinyint(1) DEFAULT 0,
  `codigo_recuperacion` int(11) DEFAULT NULL,
  `debates_realizados` int(11) DEFAULT NULL,
  `debates_ganados` int(11) DEFAULT NULL,
  `debates_perdidos` int(11) DEFAULT NULL,
  `dinero` int DEFAULT 50,
  `elo` int(11) DEFAULT 1000,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'mrakami98','$2y$10$fNAX./xLe8eVIC6Lo3wm/e0aOW622EpTZTQkGW3rmp1/sbqaCMl5y','104086696446064496521','mrakami98@gmail.com','http://ec2-54-172-21-72.compute-1.amazonaws.com/user/1685432370_3a8c26f0011dd287b05e.png',0,NULL,NULL,NULL,NULL,0,1000,1),(2,'pruebatesting621','$2y$10$cViL6IrJd2.c1NPCK05l5OQ06kUdXSVK7tr39f7CpO190VdWeAjgy','107704565332519509151','pruebatesting621@gmail.com',NULL,0,NULL,NULL,NULL,NULL,0,1000,1),(3,'22.daw.jafednunez','$2y$10$KnjlNsEdJuYsGPHWnktyjO./95umrOv0/RPAGai.XtMcK0R2jrxGK','109856816316097034059','22.daw.jafednunez@fundacionmontessori.com','http://ec2-54-172-21-72.compute-1.amazonaws.com/user/1685431639_1d191c6a8bfc1442382c.jpg',0,NULL,NULL,NULL,NULL,0,1000,1),(4,'unusuario','$2y$10$/ZPzQWFdOokBPNYMOrlNBuEpovKfEITDomLpCMB.1buB.dOEawlO2',NULL,'correo@correo.correo',NULL,0,NULL,NULL,NULL,NULL,20,1000,1),(5,'kardiad','$2y$10$OEbVf3H3p76EmhnLKMU4OekPhEFbYEujc7oxFxeeeW1VhPI0brBuS',NULL,'jafet434@hotmail.com',NULL,1,NULL,NULL,NULL,NULL,0,1000,1),(6,'a','$2y$10$FIPUJeZTKWQFoMyqqjdTMuXqXx486Ew4dEUp.oK2jiknVCa2KqniS',NULL,'a@a.a',NULL,1,NULL,NULL,NULL,NULL,50,1000,1);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador_libros`
--

DROP TABLE IF EXISTS `jugador_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador_libros` (
  `id_jugador` int(10) unsigned DEFAULT NULL,
  `id_libro` int(10) unsigned DEFAULT NULL,
  KEY `id_libro` (`id_libro`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `jugador_libros_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`),
  CONSTRAINT `jugador_libros_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador_libros`
--

LOCK TABLES `jugador_libros` WRITE;
/*!40000 ALTER TABLE `jugador_libros` DISABLE KEYS */;
INSERT INTO `jugador_libros` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(4,1),(4,2),(4,2),(4,3),(4,3),(4,4),(4,5),(4,6),(3,1),(3,8),(3,7),(3,6),(3,5),(5,8),(5,7),(5,6),(5,5),(5,4);
/*!40000 ALTER TABLE `jugador_libros` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER if NOT exists paga
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
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `id_disciplina` int(10) unsigned DEFAULT NULL,
  `id_autor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_disciplina` (`id_disciplina`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Meditaciones Metafísicas',10,1,1),(2,'Discurso del método',10,1,1),(3,'Principios de la filosofía',10,1,1),(4,'Pasiones del alma',10,1,1),(5,'Tratado de la naturaleza humana',10,2,2),(6,'Investigación sobre el entendimiento humano',10,2,2),(7,'Investigación sobre los principios de la moral',10,2,2),(8,'Historia natural de la religión',10,2,2);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masterizados`
--

DROP TABLE IF EXISTS `masterizados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterizados` (
  `id_libro` int(10) unsigned DEFAULT NULL,
  `id_jugador` int(10) unsigned DEFAULT NULL,
  KEY `id_jugador` (`id_jugador`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `masterizados_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id`),
  CONSTRAINT `masterizados_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masterizados`
--

LOCK TABLES `masterizados` WRITE;
/*!40000 ALTER TABLE `masterizados` DISABLE KEYS */;
INSERT INTO `masterizados` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(1,4),(2,4),(3,4),(1,3),(5,3),(6,3),(7,3),(8,3);
/*!40000 ALTER TABLE `masterizados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lascartasdesofia'
--

--
-- Dumping routines for database 'lascartasdesofia'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30 14:05:40
