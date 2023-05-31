-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para lascartasdesofia
CREATE DATABASE IF NOT EXISTS `lascartasdesofia` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `lascartasdesofia`;

-- Volcando estructura para tabla lascartasdesofia.amigos
CREATE TABLE IF NOT EXISTS `amigos` (
  `id_solicitado` int(10) unsigned DEFAULT NULL,
  `id_solicitante` int(10) unsigned DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT 0,
  `checkeado` tinyint(1) DEFAULT 0,
  KEY `id_solicitado` (`id_solicitado`),
  KEY `id_solicitante` (`id_solicitante`),
  CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`id_solicitado`) REFERENCES `jugador` (`id`),
  CONSTRAINT `amigos_ibfk_2` FOREIGN KEY (`id_solicitante`) REFERENCES `jugador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.amigos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
INSERT INTO `amigos` (`id_solicitado`, `id_solicitante`, `confirmado`, `checkeado`) VALUES
	(2, 1, 1, 1),
	(1, 3, 1, 1),
	(2, 4, 1, 1);
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.argumentario
CREATE TABLE IF NOT EXISTS `argumentario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_jugador` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `jugable` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.argumentario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `argumentario` DISABLE KEYS */;
INSERT INTO `argumentario` (`id`, `id_jugador`, `nombre`, `jugable`) VALUES
	(1, 1, 'La locura del Genio Maligno', 1),
	(3, 2, 'La Locura del Genio Maligno', 1),
	(4, 4, 'La locura del Genio Maligno', 1),
	(5, 2, 'La superioridad del Yo frente al Genio Maligno', 1),
	(6, 2, 'La idiotez de la Ignorancia', 1),
	(7, 5, 'La locura del Genio Maligno', 0);
/*!40000 ALTER TABLE `argumentario` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.argumentario_conceptos
CREATE TABLE IF NOT EXISTS `argumentario_conceptos` (
  `id_argumentario` int(10) unsigned DEFAULT NULL,
  `id_concepto` int(10) unsigned DEFAULT NULL,
  KEY `id_argumentario` (`id_argumentario`),
  KEY `id_concepto` (`id_concepto`),
  CONSTRAINT `argumentario_conceptos_ibfk_1` FOREIGN KEY (`id_argumentario`) REFERENCES `argumentario` (`id`),
  CONSTRAINT `argumentario_conceptos_ibfk_2` FOREIGN KEY (`id_concepto`) REFERENCES `conceptos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.argumentario_conceptos: ~100 rows (aproximadamente)
/*!40000 ALTER TABLE `argumentario_conceptos` DISABLE KEYS */;
INSERT INTO `argumentario_conceptos` (`id_argumentario`, `id_concepto`) VALUES
	(1, 27),
	(1, 19),
	(1, 14),
	(1, 12),
	(1, 29),
	(1, 3),
	(1, 5),
	(1, 15),
	(1, 1),
	(1, 20),
	(1, 21),
	(1, 16),
	(1, 25),
	(1, 9),
	(1, 10),
	(1, 4),
	(1, 26),
	(1, 7),
	(1, 18),
	(1, 8),
	(3, 14),
	(3, 12),
	(3, 3),
	(3, 5),
	(3, 15),
	(3, 1),
	(3, 21),
	(3, 16),
	(3, 9),
	(3, 10),
	(3, 4),
	(3, 7),
	(3, 18),
	(3, 24),
	(3, 8),
	(3, 2),
	(3, 11),
	(3, 22),
	(3, 17),
	(3, 13),
	(4, 19),
	(4, 14),
	(4, 12),
	(4, 3),
	(4, 5),
	(4, 15),
	(4, 1),
	(4, 20),
	(4, 16),
	(4, 9),
	(4, 4),
	(4, 7),
	(4, 18),
	(4, 24),
	(4, 8),
	(4, 11),
	(4, 23),
	(4, 22),
	(4, 17),
	(4, 13),
	(5, 5),
	(5, 6),
	(5, 7),
	(5, 2),
	(5, 1),
	(5, 21),
	(5, 16),
	(5, 9),
	(5, 10),
	(5, 4),
	(5, 18),
	(5, 22),
	(5, 17),
	(5, 13),
	(5, 14),
	(5, 12),
	(5, 15),
	(5, 24),
	(5, 8),
	(5, 11),
	(6, 14),
	(6, 12),
	(6, 3),
	(6, 5),
	(6, 15),
	(6, 1),
	(6, 21),
	(6, 11),
	(6, 22),
	(6, 6),
	(6, 17),
	(6, 13),
	(6, 4),
	(6, 10),
	(6, 16),
	(6, 2),
	(6, 7),
	(6, 18),
	(6, 24),
	(6, 8);
/*!40000 ALTER TABLE `argumentario_conceptos` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.autor
CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `apellidos` varchar(250) DEFAULT NULL,
  `cartas_relevantes` varchar(10) DEFAULT NULL,
  `id_disciplina` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.autor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` (`id`, `nombre`, `apellidos`, `cartas_relevantes`, `id_disciplina`) VALUES
	(1, 'René', 'Descartes', '7|6|1', 1),
	(2, 'David', 'Hume', '25', 2);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.chat
CREATE TABLE IF NOT EXISTS `chat` (
  `id_hablante` int(10) unsigned DEFAULT NULL,
  `id_oyente` int(10) unsigned DEFAULT NULL,
  `mensaje` varchar(2000) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  KEY `id_hablante` (`id_hablante`) USING BTREE,
  KEY `id_oyente` (`id_oyente`) USING BTREE,
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_hablante`) REFERENCES `jugador` (`id`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_oyente`) REFERENCES `jugador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.chat: ~46 rows (aproximadamente)
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`id_hablante`, `id_oyente`, `mensaje`, `fecha`) VALUES
	(1, 2, '????????????', '2023-05-05 15:44:25'),
	(1, 2, '😀😀', '2023-05-05 15:45:54'),
	(1, 2, 'Ya hay emojiiiiiiiis ????????????????????????????????????????????????????????????????????????????????????????????????????????????', '2023-05-05 15:47:40'),
	(2, 1, 'sigue saliendo mierda ????', '2023-05-05 15:48:32'),
	(1, 2, 'vamos a probar ahora 😄 ', '2023-05-05 15:53:30'),
	(2, 1, 'carga', '2023-05-05 15:53:35'),
	(2, 1, 'ya baja el scroll', '2023-05-05 16:05:44'),
	(1, 2, 'ah, pues a mí no me ha bajado cuando me has mandado el comentario', '2023-05-05 16:05:56'),
	(2, 1, 'espera, falta sincronizarlo', '2023-05-05 16:06:05'),
	(1, 2, 'ahora?', '2023-05-05 16:07:25'),
	(2, 1, 'gfgbjlrgjfghkghlkgkjh 🤣🤣🤣🤣🤣🤣 amooooo!!!', '2023-05-05 16:07:38'),
	(1, 2, 'mira que es cutre esta mierda pero voy a llorar de lo currao que va', '2023-05-05 16:08:01'),
	(2, 1, 'mucho sufrimiento', '2023-05-05 16:08:07'),
	(1, 2, 'pues como todo en esta vida hijo', '2023-05-05 16:08:31'),
	(2, 1, 'yap', '2023-05-05 16:08:33'),
	(1, 2, 'igual, habría que hacer un observer, apuntando a este div', '2023-05-05 16:08:56'),
	(2, 1, 'claro y si crece o no pues que te salga o no el mensajito de si hay alguien', '2023-05-05 16:09:15'),
	(1, 2, 'yap', '2023-05-05 16:09:24'),
	(1, 2, 'es gracioso este chat mide más que el puto body', '2023-05-05 16:10:07'),
	(2, 1, '🤣🤣🤣🤣🤣🤣 ya te digo', '2023-05-05 16:10:18'),
	(1, 2, 'creo que se solventó lo del scroll', '2023-05-05 16:18:08'),
	(2, 1, 'hmmm eso veo', '2023-05-05 16:18:17'),
	(1, 2, 'lo que no hace animación', '2023-05-05 16:18:24'),
	(2, 1, 'me la pela 🤣🤣🤣🤣', '2023-05-05 16:18:31'),
	(1, 2, 'al menos ahora parece que hace un push', '2023-05-05 16:18:44'),
	(1, 2, 'sigue funcionando esto? ', '2023-05-08 08:47:04'),
	(2, 1, 'yo te leo de puta madre bro 😂😂', '2023-05-08 08:47:17'),
	(2, 1, 'kias', '2023-05-10 10:17:02'),
	(1, 2, 'sdfjkhsdk', '2023-05-10 10:17:13'),
	(4, 2, 'ola', '2023-05-10 10:18:08'),
	(2, 1, 'ola', '2023-05-11 17:18:48'),
	(1, 2, 'que tal?', '2023-05-11 17:19:43'),
	(2, 1, 'vivo XD 😂😂😂', '2023-05-11 17:20:03'),
	(2, 1, 'a', '2023-05-11 17:20:10'),
	(2, 1, 'a', '2023-05-11 17:20:21'),
	(2, 1, 'a', '2023-05-11 17:20:22'),
	(2, 1, 'a', '2023-05-11 17:20:22'),
	(2, 1, 'a', '2023-05-11 17:20:22'),
	(2, 1, 'aa', '2023-05-11 17:20:22'),
	(2, 1, 'a', '2023-05-11 17:20:22'),
	(2, 1, 'a', '2023-05-11 17:20:22'),
	(2, 1, 'aa', '2023-05-11 17:20:23'),
	(2, 1, 'a', '2023-05-11 17:20:23'),
	(2, 1, 'a', '2023-05-11 17:20:23'),
	(2, 4, 'pepe', '2023-05-11 17:30:46'),
	(1, 2, 'eres un pesaoo', '2023-05-22 09:12:27'),
	(4, 2, 'o no estas pero te mando 😘😘', '2023-05-26 10:11:50');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.conceptos
CREATE TABLE IF NOT EXISTS `conceptos` (
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.conceptos: ~48 rows (aproximadamente)
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` (`id`, `nombre`, `tipo`, `contra`, `beneficio`, `referencia`, `costo`, `busca`, `roba`, `turnos`, `descripcion`, `texto_aparicion`) VALUES
	(1, 'Duda metódica', 'replica', 1, 3, NULL, '3@t', '2', 0, 0, 'Cuando juegas quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca Pienso luego existo y ganas 3 puntos de debate, quitándole 1 al rival', 'texto'),
	(2, 'Pienso Luego Existo', 'concepto', 5, 1, NULL, '4@t', '1@replica', 0, 0, 'Este concepto quita 2 puntos al rival y te da 1 a tí, éste te permite obtener 1 carta de réplica al jugarla', 'texto'),
	(3, 'Deducción', 'contrareplica', 0, 0, NULL, '3@t', '2@replica', 0, 0, 'Si el rival juega una carta replica, puedes jugar esta carta. Si la juegas buscas 2 cartas réplica', 'texto'),
	(4, 'Imaginacion', 'concepto', 0, 1, '2', '3@t', '1@concepto', 0, 0, 'Si "Pienso Luego Existo" está en el campo, puedes jugar esta carta, tras jugarla ganas 1 punto de debate y obtenes 2 cartas del tipo concepto', 'texto'),
	(5, 'Dios', 'concepto', 5, 5, NULL, '6@t', '2@replica', 0, 0, 'Juegas esta carta restas 2 puntos al rival y te da 2 a tí, posterormente buscas 2 cartas réplica', 'texto'),
	(6, 'Yo', 'concepto', 5, 5, NULL, '6@t', '1@contrareplica', 0, 0, 'Cuando juegas esta carta restas 2 puntos al rival y te da 2 a tí, posteriormente buscas una 1 contraréplica', 'texto'),
	(7, 'Mundo', 'concepto', 5, 5, NULL, '6@t', '1@replica', 0, 0, 'Cuando juegas esta carta restas 2 puntos al rival y te da 2 a tí, posteriormente busca 1 réplica y 1 contraréplica', 'texto'),
	(8, 'Pensar', 'replica', 3, 1, '2', '3@t', '1@replica', 0, 0, 'Si "Pienso luego existo" está en el campo, puedes jugar esta carta, tras jugaarla restas 3 puntos al rival y te da a tí 1, posteriormente busca 1 réplica', 'texto'),
	(9, 'Sustancia', 'replica', 0, 5, '2', '3@t', '5', 0, 0, 'Cuando juegas esta carta ganas 2 puntos, posteriormente busca 1 concepto Dios', 'texto'),
	(10, 'Ideas', 'contrareplica', 5, 5, NULL, '3@t', '2@replica', 0, 0, 'Cuando juegas esta carta quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca 2 réplicas', 'texto'),
	(11, 'Precipitación', 'replica', 1, 5, NULL, '3@t', '1', 0, 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 2 puntos, posteriormente busca una Duda metódica', 'texto'),
	(12, 'Conocimiento', 'contrareplica', 1, 1, NULL, '3@t', '1@replica', 0, 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 2 puntos, posteriormente busca 1 carta réplica', 'texto'),
	(13, 'Método', 'contrareplica', 1, 1, NULL, '3@t', '1@replica', 0, 0, 'Cuando juegas esta carta quitas 1 punto al rival y ganas 1 punto, posteriormente busca 1 carta réplica', 'texto'),
	(14, 'Claridad', 'replica', 5, 5, NULL, '3@t', '1@replica', 0, 0, 'Cuando juegas esta carta quitas 2 puntos al rival y ganas 2 puntos, posteriormente busca 1 carta réplica', 'texto'),
	(15, 'Distinción', 'replica', 3, 0, NULL, '3@t', '1@contrareplica', 0, 0, 'Cuando juegas esta carta quitas 3 puntos al rival, posteriormente busca 1 carta de contraréplica', 'texto'),
	(16, 'Espíritu', 'contrareplica', 7, 0, '6', '7@t', NULL, 0, 0, 'Si "Yo" está en el campo, puedes jugar esta carta, tras jugarla el rival perderá 7 puntos', 'texto'),
	(17, 'Verdadero', 'contrareplica', 1, 5, NULL, '2@t', '1@replica', 0, 0, 'Cuando juegas esta carta quitas 1 punto al rival y tú ganas 5 posteriormente busca 1 carta réplica', 'texto'),
	(18, 'Opiniones', 'replica', 5, 1, NULL, '1@t', NULL, 0, 0, 'Cuando juegas esta carta quitas 2 puntos al rival y tu ganas 1.', 'text'),
	(19, 'Ciencias', 'replica', 5, 5, '20', '7@t', '2@replica', 0, 0, 'Si "Mundo", "Yo" y "Duda metódica" están en el campo, puedes jugar esta carta, tras jugarla el rival pierde 5 puntos, y tú ganas 5 además de poder buscar 4 réplicas y 1 contraréplica', 'texto'),
	(20, 'Entendimiento', 'replica', 9, 0, '6', '10@t', NULL, 0, 0, 'Si "Yo" y "Dios" están en el campo, puedes jugar esta carta, tras jugarla el rival perde 9 puntos', 'text0'),
	(21, 'Esencia', 'concepto', 1, 3, NULL, '3@t', NULL, 0, 0, 'Cuando juegas esta carta quitas 1 punto al rival y tú ganas 3', 'text'),
	(22, 'Res extensa', 'replica', 3, 5, '21', '5@t', '1@concepto', 0, 0, 'Si "Esencia" está en el campo puedes jugar esta carta, tras jugarla el rival pierde 3 puntos y tú ganas 5 además puedes buscar un concepto', 'texto'),
	(23, 'Res cogitans', 'replica', 5, 0, '21', '3@t', NULL, 0, 0, 'Si "Esencia" está en el campo puedes jugar esta carta, el rival pierde 5 puntos', 'text'),
	(24, 'Pensar', 'contrareplica', 5, 4, NULL, '4@t', NULL, 0, 0, 'Cuando juegas esta carta quitas 2 puntos al rival y tú ganas 4', 'text'),
	(25, 'Experiencia', 'concepto', 5, 5, NULL, '5@t', NULL, 0, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2 puntos', 'texto'),
	(26, 'Inmanencia', 'concepto', 5, 5, '25', '3@t', NULL, 2, 0, 'Si "Experiencia Sensible" está en el campo puedes jugar esta carta, el rival pierde 2 puntos y tú ganas 2. Robas 2 cartas', 'texto'),
	(27, 'Asociacion', 'concepto', 1, 1, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 1 punto y tú ganas 1. Robas 1 carta', 'texto'),
	(28, 'Semejanza', 'replica', 5, 5, NULL, '2@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.', 'texto'),
	(29, 'Contigüidad', 'replica', 5, 5, NULL, '2@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.', 'texto'),
	(30, 'Causa-Efecto', 'replica', 5, 5, NULL, '2@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 2. Robas 1 carta.', 'texto'),
	(31, 'Impresiones', 'concepto', 3, 1, NULL, '2@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 1. Robas 1 carta.', 'texto'),
	(32, 'Ideas', 'replica', 5, 4, NULL, '4@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.', 'texto'),
	(33, 'Hábito', 'concepto', 5, 4, NULL, '4@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.', 'texto'),
	(34, 'Crítica', 'replica', 5, 1, NULL, '1@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 1. Robas 1 carta.', 'texto'),
	(35, 'Contradiccion', 'contrareplica', 3, 1, NULL, '1@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 1. Robas 1 carta.', 'texto'),
	(36, 'Causa', 'replica', 4, 3, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 3. Robas 1 carta.', 'texto'),
	(37, 'Creencia', 'concepto', 5, 3, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.', 'texto'),
	(38, 'Sentimiento', 'concepto', 4, 1, NULL, '1@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 1. Robas 1 carta.', 'texto'),
	(39, 'Mérito', 'replica', 3, 3, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 3. Robas 1 carta.', 'texto'),
	(40, 'Utilidad', 'concepto', 1, 3, NULL, '2@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 2. Robas 1 carta.', 'texto'),
	(41, 'Felicidad', 'concepto', 5, 3, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.', 'texto'),
	(42, 'Contrato Social', 'replica', 4, 3, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 4 puntos y tú ganas 3. Robas 1 carta.', 'texto'),
	(43, 'Libertad', 'concepto', 1, 3, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 3. Robas 1 carta.', 'texto'),
	(44, 'Deber', 'contrareplica', 3, 3, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 3. Robas 1 carta.', 'texto'),
	(45, 'Representación', 'concepto', 3, 4, NULL, '4@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 3 puntos y tú ganas 4. Robas 1 carta.', 'texto'),
	(46, 'Contemplación', 'concepto', 1, 5, NULL, '2@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 1 puntos y tú ganas 2. Robas 1 carta.', 'texto'),
	(47, 'Práctica', 'replica', 5, 3, NULL, '3@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 3. Robas 1 carta.', 'texto'),
	(48, 'Negación de Transcensus', 'replica', 5, 4, NULL, '4@t', NULL, 1, 0, 'Cuando juegas esta carta tu rival pierde 2 puntos y tú ganas 4. Robas 1 carta.', 'texto');
/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.conceptos_jugador
CREATE TABLE IF NOT EXISTS `conceptos_jugador` (
  `id_jugador` int(10) unsigned DEFAULT NULL,
  `id_concepto` int(10) unsigned DEFAULT NULL,
  KEY `id_jugador` (`id_jugador`),
  KEY `id_concepto` (`id_concepto`),
  CONSTRAINT `conceptos_jugador_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id`),
  CONSTRAINT `conceptos_jugador_ibfk_2` FOREIGN KEY (`id_concepto`) REFERENCES `conceptos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.conceptos_jugador: ~65 rows (aproximadamente)
/*!40000 ALTER TABLE `conceptos_jugador` DISABLE KEYS */;
INSERT INTO `conceptos_jugador` (`id_jugador`, `id_concepto`) VALUES
	(1, 3),
	(1, 2),
	(1, 1),
	(1, 4),
	(1, 5),
	(1, 8),
	(1, 11),
	(1, 7),
	(1, 10),
	(1, 9),
	(1, 6),
	(1, 13),
	(1, 17),
	(1, 15),
	(1, 12),
	(1, 16),
	(1, 14),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 27),
	(1, 25),
	(1, 29),
	(1, 28),
	(1, 26),
	(2, 4),
	(2, 1),
	(2, 3),
	(2, 2),
	(2, 5),
	(2, 6),
	(2, 10),
	(2, 11),
	(2, 8),
	(2, 9),
	(2, 7),
	(2, 16),
	(2, 15),
	(2, 17),
	(2, 14),
	(2, 12),
	(2, 13),
	(2, 18),
	(2, 24),
	(2, 22),
	(2, 21),
	(4, 2),
	(4, 3),
	(4, 1),
	(4, 4),
	(4, 5),
	(4, 8),
	(4, 6),
	(4, 10),
	(4, 9),
	(4, 11),
	(4, 7),
	(4, 16),
	(4, 13),
	(4, 17),
	(4, 14),
	(4, 12),
	(4, 15),
	(4, 23),
	(4, 19),
	(4, 18),
	(4, 22),
	(4, 24),
	(4, 20),
	(5, 20),
	(5, 22),
	(5, 19),
	(5, 24),
	(5, 23),
	(5, 21),
	(5, 18),
	(5, 28),
	(5, 29),
	(5, 26),
	(5, 27),
	(5, 25),
	(5, 34),
	(5, 31),
	(5, 33),
	(5, 35),
	(5, 32),
	(5, 30),
	(5, 37),
	(5, 36),
	(5, 41),
	(5, 38),
	(5, 40),
	(5, 39),
	(5, 44),
	(5, 48),
	(5, 47),
	(5, 43),
	(5, 45),
	(5, 46),
	(5, 42);
/*!40000 ALTER TABLE `conceptos_jugador` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.concepto_libros
CREATE TABLE IF NOT EXISTS `concepto_libros` (
  `id_concepto` int(10) unsigned DEFAULT NULL,
  `id_libro` int(10) unsigned DEFAULT NULL,
  KEY `id_concepto` (`id_concepto`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `concepto_libros_ibfk_1` FOREIGN KEY (`id_concepto`) REFERENCES `conceptos` (`id`),
  CONSTRAINT `concepto_libros_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.concepto_libros: ~48 rows (aproximadamente)
/*!40000 ALTER TABLE `concepto_libros` DISABLE KEYS */;
INSERT INTO `concepto_libros` (`id_concepto`, `id_libro`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 3),
	(13, 3),
	(14, 3),
	(15, 3),
	(16, 3),
	(17, 3),
	(18, 4),
	(19, 4),
	(20, 4),
	(21, 4),
	(22, 4),
	(23, 4),
	(24, 4),
	(25, 5),
	(26, 5),
	(27, 5),
	(28, 5),
	(29, 5),
	(30, 6),
	(31, 6),
	(32, 6),
	(33, 6),
	(34, 6),
	(35, 6),
	(36, 7),
	(37, 7),
	(38, 7),
	(39, 7),
	(40, 7),
	(41, 7),
	(42, 8),
	(43, 8),
	(44, 8),
	(45, 8),
	(46, 8),
	(47, 8),
	(48, 8);
/*!40000 ALTER TABLE `concepto_libros` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.debate
CREATE TABLE IF NOT EXISTS `debate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_jugador_retante` int(10) unsigned NOT NULL,
  `id_jugador_retado` int(10) unsigned NOT NULL,
  `recurso` varchar(200) DEFAULT NULL,
  `jugable` tinyint(1) DEFAULT 1,
  `ganador` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jugador_retante` (`id_jugador_retante`),
  KEY `id_jugador_retado` (`id_jugador_retado`),
  CONSTRAINT `debate_ibfk_1` FOREIGN KEY (`id_jugador_retante`) REFERENCES `jugador` (`id`),
  CONSTRAINT `debate_ibfk_2` FOREIGN KEY (`id_jugador_retado`) REFERENCES `jugador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.debate: ~151 rows (aproximadamente)
/*!40000 ALTER TABLE `debate` DISABLE KEYS */;
INSERT INTO `debate` (`id`, `id_jugador_retante`, `id_jugador_retado`, `recurso`, `jugable`, `ganador`) VALUES
	(73, 2, 1, 'afa6282f97b80e8e3b461751e78b2a0d', 0, NULL),
	(74, 2, 1, '940f495c719a9e7995e99607f85301ec', 0, NULL),
	(75, 2, 1, 'ed1ae2e88174b48412aee98aff664971', 0, NULL),
	(76, 2, 1, '1dcf20f9a8d5a0a905e9ff3ba035dc1c', 0, NULL),
	(77, 2, 1, 'c02f5411aaeba39237cdeb3e73dd2ea4', 0, NULL),
	(78, 2, 1, 'f4cdee10f4f55caea558845406ef5092', 0, NULL),
	(79, 2, 1, 'c35025b0a3e5c14d92400a19b7399034', 0, NULL),
	(80, 2, 1, '8793bfceecd0235acba5bfe21a0e7ad8', 0, NULL),
	(81, 2, 1, '25798fa66216428fd8499255a8c2f198', 0, NULL),
	(82, 2, 1, '461a2514ac18a41ce9f1d5e0cb58da71', 0, NULL),
	(83, 2, 1, '216d44fa1e26f8d9d7dd464a171b8e5c', 0, NULL),
	(84, 2, 1, '5cedc4f5f505b0c4b638a217be9660ea', 0, NULL),
	(85, 2, 1, 'd1ca3f4cc7f945b082db057f3f641ad9', 0, NULL),
	(86, 2, 1, 'ba0217354de65f2eceedfdc0b1403b0a', 0, NULL),
	(87, 2, 1, '2f47b9e31de6e8150b0a3f6c9246ab0e', 0, NULL),
	(88, 2, 1, '9ba40db301992d95ec8014166519a274', 0, NULL),
	(89, 2, 1, 'dc788b4337dbe07caa47fc17698f7c97', 0, NULL),
	(90, 2, 1, 'b59159da843dfd5e21f03a57b0b5ee2f', 0, NULL),
	(91, 2, 1, '35bf6ee11b543e8738056f27db9be270', 0, NULL),
	(92, 2, 1, 'cb2e3e61fd459381aa7ae388718c3c87', 0, NULL),
	(93, 2, 1, '059dcbc6b13a682f0c293c648d0858fc', 0, NULL),
	(94, 2, 1, 'b4dcadde0d8a2ead21daed21336eb474', 0, NULL),
	(95, 2, 1, 'a26b0ba203ffb7fb9401bdc5ded19b21', 0, NULL),
	(96, 2, 1, '720a5aa738360fd02174b87d1f08ac19', 0, NULL),
	(97, 2, 1, '3f290714d50c72dad00401d27304a50c', 0, NULL),
	(98, 2, 1, '1c4744ba9a1b978a7135da53e7d9519d', 0, NULL),
	(99, 2, 1, 'a9d352221d814611f14db458bc0d3f9d', 0, NULL),
	(100, 2, 1, 'f3321240b7577677ce37fe2dd37deb66', 0, NULL),
	(101, 2, 1, '9e3cee8ff20d3c9ce6561a0024cbca1b', 0, NULL),
	(102, 2, 1, 'f5ff9b7ff5055ed49bd7f4ac34e933db', 0, NULL),
	(103, 2, 1, 'c2e6815ba9d843b5654ae6413c449fd2', 0, NULL),
	(104, 2, 1, 'f762add9cbaaf859764126823a24c86b', 0, NULL),
	(105, 2, 1, '84931931dda19505cd9cbbe5b89d5d38', 0, NULL),
	(106, 2, 1, 'b425056aef0eb43a3572c196093b6022', 0, NULL),
	(107, 2, 1, '69f59be06f7815eaf4127df07a780daf', 0, NULL),
	(108, 2, 1, '6eec789b7ad8454a9276a30c05c0a014', 0, NULL),
	(109, 2, 1, '28081c175ae26e30ab91d14e11f8a18c', 0, NULL),
	(110, 2, 1, 'c8497c3a55ef77c480c2b8c95e5e74b1', 0, NULL),
	(111, 2, 1, 'c6e555be3a70460d127b170cc61d05a5', 0, NULL),
	(112, 2, 1, '758d2b9cbedd9e0a5d59e99db349ad82', 0, NULL),
	(113, 2, 1, '380f085178751fea5abe94eeffc4a892', 0, NULL),
	(114, 2, 1, 'ebb26012903053fc11374ae207fd87d2', 0, NULL),
	(115, 2, 1, '1ce64811751bd50efcac9149a0082a89', 0, NULL),
	(116, 2, 1, '4ea6db33f46e06a6ca70cdf61d2dfdba', 0, NULL),
	(117, 2, 1, '5a10d9601f1e6228168093882e4d6273', 0, NULL),
	(118, 2, 1, '9d61c4198ecd029c8c66484b878a6f75', 0, NULL),
	(119, 2, 1, '1a4e6dcec69d5ea55f2a577bec1ca48c', 0, NULL),
	(120, 2, 1, '093a400e1330201511921b8d2665765c', 0, NULL),
	(121, 2, 1, '599e6157ec65243cd97f750aff158766', 0, NULL),
	(122, 2, 1, '0c206aaf64830001d0f005ddd55d74b3', 0, NULL),
	(123, 2, 1, '72fa505aae0fdc1be133ac14313d23d2', 0, NULL),
	(124, 2, 1, 'b00052990dfbe49c9c672c9df46d7dae', 0, NULL),
	(125, 2, 1, 'f4e0f87f976b31b0d170af177ebf4575', 0, NULL),
	(126, 2, 1, 'd3f9e1b17cce881a259119b4409487d6', 0, NULL),
	(127, 2, 1, '6c5616f01ac8ed05c9e21612407b0b69', 0, NULL),
	(128, 2, 1, '4628ba3b4e971875d2290f2c1b496b93', 0, NULL),
	(129, 2, 1, '48491a4ae8dc7dc12ea590c0b120331c', 0, NULL),
	(130, 2, 1, '5d525b4c93c85babe64fc51dca99779d', 0, NULL),
	(131, 2, 1, 'bcc4a635607d07fa2b3c9d5f682a8df0', 0, NULL),
	(132, 2, 1, 'f299c3c6f01d661831416c7464987b88', 0, NULL),
	(133, 2, 1, 'c0c5567f1e1fd68c3ea8bd4114611b0d', 0, NULL),
	(134, 2, 1, 'a284f33060995cad201bdc6ba95d7bca', 0, NULL),
	(135, 2, 1, 'cb2ad297f0d950e7bdafb0a7e8852570', 0, NULL),
	(136, 2, 1, 'c3bbf97383638fbd53d4028f925cae83', 0, NULL),
	(137, 2, 1, '301f06c6ee581b00137a0702d7604518', 0, NULL),
	(138, 2, 1, '016308fa85de2008cb7ced81b21f9143', 0, NULL),
	(139, 2, 1, 'ea4e4f5efbf28bc9c2c790e3928373ae', 0, NULL),
	(140, 2, 1, '2239eb75ec57293d673603b866c3f787', 0, NULL),
	(141, 2, 1, '2a636e31fd83b18a1f749eacc197d40d', 0, NULL),
	(142, 2, 1, '00f1d707917e8eeb13ccc2b59a81ce8b', 0, NULL),
	(143, 2, 1, '4eae1d25cb2fcfe8894e1df52d3ab8c9', 0, NULL),
	(144, 2, 1, 'b201c14eac9d77e82d1c9e1270b307db', 0, NULL),
	(145, 2, 1, '93daea9c6f1f23eb7c6b6263c4cda0f0', 0, NULL),
	(146, 2, 1, '6b88f8a0f93adf6ad352d030511b2bc7', 0, NULL),
	(147, 2, 1, '5d644a1514052c2bcaaedc4f6d261a23', 0, NULL),
	(148, 2, 1, 'c03cb103a5143f2f792f5b5a93076159', 0, NULL),
	(149, 2, 1, 'a1ed46b2c97f0aa38e573083e1b511e2', 0, NULL),
	(150, 2, 1, '9027c58c6e0173cc3ce773dcd4b521ba', 0, NULL),
	(151, 2, 1, 'f9b73f0ecb627eba80a429e182fd2947', 0, NULL),
	(152, 2, 1, '49bf2589d9238c312032920853e54d86', 0, NULL),
	(153, 2, 1, 'e8ffbb1bd1810902d4445930e13bde91', 0, NULL),
	(154, 2, 1, 'da4567fa16289bd1a62d93848c14b997', 0, NULL),
	(155, 2, 1, 'f2331a47657a92b14284e445ad244291', 0, NULL),
	(156, 2, 4, '554307d5f494afed2c154baea3d1f9e5', 0, NULL),
	(157, 2, 4, 'ff41700be03763fea19f7aa74bbca908', 0, NULL),
	(158, 2, 4, '32c67b82233e1aa9bdc449ff9f292ab8', 0, NULL),
	(159, 2, 1, 'd2a90029540bf4bfdbf69c444724fb8e', 0, NULL),
	(160, 2, 1, '6939ad05f88261455a00489c72f6e659', 0, NULL),
	(161, 2, 1, 'bb25fd5587ae5741e5f292e5da0caf82', 0, NULL),
	(162, 2, 1, '7ad89ed5ab1642bdad288169d5e5431c', 0, NULL),
	(163, 2, 1, 'f127600c139668fa20f48b8c9eb8be10', 0, NULL),
	(164, 2, 1, '3b5d532733b1933b78b8fbb8231b49a2', 0, NULL),
	(165, 2, 1, '4f26b9da97d493df50b92eead3f18f6c', 0, NULL),
	(166, 2, 1, 'fc4cfded16bf88b3168dd40c1b2d63e9', 0, NULL),
	(167, 2, 1, 'fc5741c41802b87de937c2b801d897a6', 0, NULL),
	(168, 2, 1, 'be3fd93a180b4f9edfdd36639442f8eb', 0, NULL),
	(169, 2, 1, '1466b9180ad2165a31999664cc9223dd', 0, NULL),
	(170, 2, 1, '9734e3b76540d0eda6f8dedfcb50cdc4', 0, NULL),
	(171, 2, 1, '1a783ad60975ced9101002eac9a95b4b', 0, NULL),
	(172, 2, 1, '14bef6441a27f83c3064797d72598be3', 0, NULL),
	(173, 2, 1, '6ba2e8af477b1615f2f19b514b2e7222', 0, NULL),
	(174, 2, 1, '2636126ae077e6e96a8615039d1fa50a', 0, NULL),
	(175, 2, 1, '93f740ace68ad45a26fd5a9ef0136082', 0, NULL),
	(176, 2, 1, 'b77ddc0079d226f0efe346089c869747', 0, NULL),
	(177, 2, 1, '25c408e19b6222c8cb6419c7c3568319', 0, NULL),
	(178, 2, 1, '32b1449d0e488e21f2df185ba469a7fc', 0, NULL),
	(179, 2, 1, 'dff843de3f25f4650f9ae17ee0672d21', 0, NULL),
	(180, 2, 1, 'e44b4382192460ef2b2bf3dbcab0bcd1', 0, NULL),
	(181, 2, 1, '275af22a14405dec9afa7f09d5f883d7', 0, NULL),
	(182, 2, 1, 'de9cb95fa570d6b648a61b3f33f3e8ed', 0, NULL),
	(183, 2, 1, '8db4bed69a402a7f10dcf5f76ef98cbb', 0, NULL),
	(184, 2, 1, 'e8264d7128b3c5987d52001dc15be499', 0, NULL),
	(185, 2, 1, '674ed6edc9938451e99e3efae49188da', 0, NULL),
	(186, 2, 1, 'beef0aa878119d962673b6d79049274e', 0, NULL),
	(187, 2, 1, '0543bb050862304f8b97fb8d01d689d6', 0, NULL),
	(188, 2, 1, 'b9c9b4d07ceebadfa52f994653f5ebb4', 0, NULL),
	(189, 2, 1, '1a8b6b0f2d7b44e7b90cc06830400b54', 0, NULL),
	(190, 2, 1, '2b2db5ff7da7dfd7aa289fb9d75d16a8', 0, NULL),
	(191, 2, 1, 'a2811e24eed0e65031ba763661f98314', 0, NULL),
	(192, 2, 1, '90837e82a814fd9b44c3dc3379d65f61', 0, NULL),
	(193, 2, 1, '62f857853294ddece4be857df360549e', 0, NULL),
	(194, 2, 1, '1bf4b7b12fb76421e9bdd05b618cfdad', 0, NULL),
	(195, 2, 1, '796da8a656871e79e884dba66f7925fa', 0, NULL),
	(196, 2, 1, '457e0f3c5ace123331d7b64297d89515', 0, NULL),
	(197, 2, 1, '00075dc10f680d8165d065fe980f2f60', 0, NULL),
	(198, 2, 1, 'ad28d4ca66d5b2b8502b106481a02ac9', 0, NULL),
	(199, 1, 2, 'cea089818ceffbee6bb8c4b6ceb3a0cf', 0, NULL),
	(200, 1, 2, 'a37ba5a28cbff03a6508a35df66d16a2', 0, NULL),
	(201, 1, 2, '907bc2422abe17c5d5d2c14f79a49ea8', 0, NULL),
	(202, 1, 2, 'f20cad1f6375301e919aa5bb330b6ae9', 0, NULL),
	(203, 1, 2, 'bc101be300e24eeae8371d6bf0b98083', 0, NULL),
	(204, 1, 2, '0b77b366986d0a390d707fdce7f4e18b', 0, NULL),
	(205, 1, 2, 'fe6a9f4e25c1075d7ad1c41df471944b', 0, NULL),
	(206, 1, 2, 'b1455505612929f0abb20ee2a4cbf1af', 0, NULL),
	(207, 1, 2, '01c9ffdb8a3fd87732572b0a715616aa', 0, NULL),
	(208, 1, 2, '47a960ad2da0e8e41d986d525a2539a7', 0, NULL),
	(209, 1, 2, 'e4e0bcf1485a0869ce294127f649d9c4', 0, NULL),
	(210, 1, 2, '4c26fcc1d8d2f12deb8397c0ffa3ad4f', 0, NULL),
	(211, 1, 2, 'ff11321ba002bb3526e8d377ae965c84', 0, NULL),
	(212, 1, 2, '823cba430e697f5b48c4029e636b8073', 0, NULL),
	(213, 1, 2, '1475fed596215033310202de83ef6f57', 0, NULL),
	(214, 1, 2, '372b3779f8580a17b41f836b2fa7d057', 0, NULL),
	(215, 1, 2, 'dae9e6d7b422bc2171d463bb259facde', 0, NULL),
	(216, 1, 2, 'b883fec8b123b6d2f90938fba4d9436d', 0, NULL),
	(217, 1, 2, '0bfd36af7f7335af91846d23575efc88', 0, NULL),
	(218, 1, 2, 'f403387fd7869c209a12fe9a744ecc92', 0, NULL),
	(219, 1, 2, '4bfcfc2bf154168e4952f6d2ddcdc8bf', 0, NULL),
	(220, 1, 2, 'c4bf811bcb6adf0ced7148bee5dfb7b4', 0, NULL),
	(221, 1, 2, '356d27d55d3e03c3fdbf0f9de287eb08', 0, NULL),
	(222, 1, 2, 'df6efca9cad4a7b7574e904b422120a9', 0, NULL),
	(223, 1, 2, '963c18ec568625e425b7e4237a807a74', 1, NULL),
	(224, 1, 2, '06d62159408e91a88d379ab05d65dbe3', 1, NULL),
	(225, 1, 2, '3a910514083ea28a3c9d6d2c29e3f2bd', 1, NULL),
	(226, 1, 2, 'e7ee6c42867f91965a317b6ad30c3c3f', 1, NULL),
	(227, 1, 2, '3f3e0b2f6cd06b6050dc78af2d6c66e2', 1, NULL),
	(228, 2, 1, 'f8ecda81052f07b35c56e006bf5cd71c', 1, NULL),
	(229, 2, 1, '6811c55a325c4cbd90539a61ea21792e', 1, NULL),
	(230, 2, 1, 'afb7ab94297f30ba9402ba7d5831957a', 1, NULL),
	(231, 2, 1, '911bd05c7a6791238820974f4bba4667', 1, NULL),
	(232, 2, 1, '1a46e6d046e030617b2b627425c9a2c0', 1, NULL),
	(233, 2, 1, 'ddad8480b55802cdd88b4b1eb773e19e', 1, NULL),
	(234, 2, 1, '2d65684e73be33dda119aac971a445dd', 1, NULL),
	(235, 2, 1, 'a70f83976353a587ad4148e188cb23dc', 1, NULL),
	(236, 2, 1, '774fdaf24946232abf2158fa3f1d88ba', 1, NULL),
	(237, 2, 1, '5fcd105cba8fbe84ac4a769d6bcfb771', 1, NULL),
	(238, 1, 2, '418b274a7c3fa41bc6ae402f8378b859', 1, NULL),
	(239, 1, 2, '2b7b20c80b4319fcc44f19f37c2e7053', 1, NULL),
	(240, 1, 2, 'd5b78931cbdcf423dc1f51f2974ee730', 1, NULL),
	(241, 1, 2, '8b7396181c42a12b22696c6b4704470a', 1, NULL),
	(242, 2, 1, 'ed3dff49312ed4fe215373a3307cb946', 1, NULL),
	(243, 2, 1, 'b7eb00ade22e8edcb79e5a3bf89cf3f5', 1, NULL),
	(244, 2, 1, '566625c1ef062d12bbdd0334da919a6c', 0, NULL),
	(245, 2, 1, '4405893a3512ff2f31dbc0f4ad08f566', 1, NULL),
	(246, 2, 1, 'c717194b6dc575fec96798cb8384c1c7', 1, NULL),
	(247, 1, 2, 'db2687bce89a93d417fdadae92098d03', 0, NULL);
/*!40000 ALTER TABLE `debate` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `win_condition` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.disciplina: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`id`, `nombre`, `win_condition`) VALUES
	(1, 'Racionalistas', 'Metafísica Generalis'),
	(2, 'Empiristas', 'Materialismo Idealista');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.jugador
CREATE TABLE IF NOT EXISTS `jugador` (
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
  `dinero` float DEFAULT 50,
  `elo` int(11) DEFAULT 1000,
  `activo` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.jugador: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` (`id`, `nombre`, `contrasena`, `id_google`, `direccion`, `img_perfil`, `enlinea`, `codigo_recuperacion`, `debates_realizados`, `debates_ganados`, `debates_perdidos`, `dinero`, `elo`, `activo`) VALUES
	(1, 'mrakami98', '$2y$10$fNAX./xLe8eVIC6Lo3wm/e0aOW622EpTZTQkGW3rmp1/sbqaCMl5y', '104086696446064496521', 'mrakami98@gmail.com', 'http://localhost/user/1682686945_6690b60f3a3a3fdef528.jpg', 0, 1685089301, NULL, NULL, NULL, 0, 1000, 1),
	(2, 'pruebatesting621', '$2y$10$cViL6IrJd2.c1NPCK05l5OQ06kUdXSVK7tr39f7CpO190VdWeAjgy', '107704565332519509151', 'pruebatesting621@gmail.com', 'http://localhost/user/1683008637_dc007a0d63184bea4447.jpg', 0, NULL, NULL, NULL, NULL, 0, 1000, 1),
	(3, '22.daw.jafednunez', '$2y$10$KnjlNsEdJuYsGPHWnktyjO./95umrOv0/RPAGai.XtMcK0R2jrxGK', '109856816316097034059', '22.daw.jafednunez@fundacionmontessori.com', NULL, 0, NULL, NULL, NULL, NULL, 50, 1000, 1),
	(4, 'unusuario', '$2y$10$/ZPzQWFdOokBPNYMOrlNBuEpovKfEITDomLpCMB.1buB.dOEawlO2', NULL, 'correo@correo.correo', NULL, 0, NULL, NULL, NULL, NULL, 10, 1000, 0),
	(5, 'kardiad', '$2y$10$H..yr6jIGDlz6MZxV3vIjuiP7eLNOWIivCKlKVIOkkift5EqVP7n.', NULL, 'jafet434@hotmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, 1000, 1);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.jugador_libros
CREATE TABLE IF NOT EXISTS `jugador_libros` (
  `id_jugador` int(10) unsigned DEFAULT NULL,
  `id_libro` int(10) unsigned DEFAULT NULL,
  KEY `id_libro` (`id_libro`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `jugador_libros_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`),
  CONSTRAINT `jugador_libros_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.jugador_libros: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `jugador_libros` DISABLE KEYS */;
INSERT INTO `jugador_libros` (`id_jugador`, `id_libro`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(4, 1),
	(4, 2),
	(4, 2),
	(4, 3),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 6),
	(4, 7),
	(5, 8),
	(5, 7),
	(5, 6),
	(5, 5),
	(5, 4);
/*!40000 ALTER TABLE `jugador_libros` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.libro
CREATE TABLE IF NOT EXISTS `libro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `id_disciplina` int(10) unsigned DEFAULT NULL,
  `id_autor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_disciplina` (`id_disciplina`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.libro: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` (`id`, `titulo`, `precio`, `id_disciplina`, `id_autor`) VALUES
	(1, 'Meditaciones Metafísicas', 10, 1, 1),
	(2, 'Discurso del método', 10, 1, 1),
	(3, 'Principios de la filosofía', 10, 1, 1),
	(4, 'Pasiones del alma', 10, 1, 1),
	(5, 'Tratado de la naturaleza humana', 10, 2, 2),
	(6, 'Investigación sobre el entendimiento humano', 10, 2, 2),
	(7, 'Investigación sobre los principios de la moral', 10, 2, 2),
	(8, 'Historia natural de la religión', 10, 2, 2);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;

-- Volcando estructura para tabla lascartasdesofia.masterizados
CREATE TABLE IF NOT EXISTS `masterizados` (
  `id_libro` int(10) unsigned DEFAULT NULL,
  `id_jugador` int(10) unsigned DEFAULT NULL,
  KEY `id_jugador` (`id_jugador`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `masterizados_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id`),
  CONSTRAINT `masterizados_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla lascartasdesofia.masterizados: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `masterizados` DISABLE KEYS */;
INSERT INTO `masterizados` (`id_libro`, `id_jugador`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(1, 4),
	(2, 4),
	(3, 4),
	(4, 5),
	(5, 5),
	(6, 5),
	(7, 5),
	(8, 5);
/*!40000 ALTER TABLE `masterizados` ENABLE KEYS */;

-- Volcando estructura para disparador lascartasdesofia.paga
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER if NOT exists paga
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
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
