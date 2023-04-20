-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2023 a las 13:12:48
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

drop database if exists lascartasdesofia;
create database if not exists lascartasdesofia;
use lascartasdesofia;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lascartasdesofia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `argumentario`
--

CREATE TABLE `argumentario` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `conceptos_id` int(10) UNSIGNED DEFAULT NULL,
  `id_jugador` int(10) UNSIGNED DEFAULT NULL,
  `id_escuela_filosofica` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `biografia` text DEFAULT NULL,
  `id_escuela_filosofica` int(10) UNSIGNED DEFAULT NULL,
  `efecto_autor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `nombre`, `apellidos`, `biografia`, `id_escuela_filosofica`, `efecto_autor`) VALUES
(1, 'René', 'Descartes', 'Biografía\nInfancia y adolescencia\n\nLa casa donde nació Descartes en La Haye en Touraine.\nDurante la Edad Moderna era también conocido por su nombre latino Renatus Cartesius. Descartes nació el 31 de marzo de 1596 en la Turena, en La Haye en Touraine, hoy en día llamada Descartes en su honor, después de que su madre abandonara la ciudad de Rennes, donde se había declarado una epidemia de peste bubónica. Pertenecía a una familia de baja nobleza; su padre fue Joachim Descartes, consejero en el Parlamento de Bretaña. Era el tercero de los descendientes del matrimonio entre Joachim Descartes, parlamentario de Rennes, y Jeanne Brochard, por lo que, por vía materna, era nieto del alcalde de Nantes.\n\n\nRegistro de graduación de Descartes en el Collège Royal Henry-Le-Grand, La Flèche, 1616.\nDespués de la temprana desaparición de su madre, Jeanne Brochard, a pocos meses después de su nacimiento, quedó al cuidado y crianza de su abuela, su padre y su nodriza. Fue criado por la atención de una nodriza, a quien permanecerá ligado toda su vida, en casa de su abuela materna. Su madre muere el 13 de mayo de 1597, a los trece meses siguientes de haber alumbrado a René y pocos días, luego del nacimiento de un niño que no sobrevive.\n\nSu padre comenzó a llamarle su «pequeño filósofo» porque el pequeño René se pasaba el día planteando preguntas.14​\n\nCon once años entra en el Collège Henri IV de La Flèche, un centro de enseñanza jesuita en el que impartía clase el padre François Fournet —doctor en filosofía por la Universidad de Douai15​— y el padre Jean François (matemático) —que le enseñará matemáticas durante un año— en el que permanecerá hasta 1614.16​ Estaba eximido de acudir a clase por la mañana debido a su débil salud17​ y era muy valorado por los educadores a causa de sus precoces dotes intelectuales.18​ Aprendió física y filosofía escolástica, y mostró un notable interés por las matemáticas; no obstante, no cesará de repetir en su Discurso del método que en su opinión este sistema educativo no era bueno para un adecuado desarrollo de la razón. De este periodo no conservamos más que una carta de dudosa autenticidad —puede ser de uno de sus hermanos— que en teoría Descartes escribió a su abuela.\n\nEducación\nLa educación que recibió en La Flèche hasta los dieciséis años de edad (1604-1612) le proporcionó, durante los cinco primeros años de cursos, una sólida introducción a la cultura clásica, habiendo aprendido latín y griego en la lectura de autores como Cicerón, Horacio y Virgilio, por un lado, y Homero, Píndaro y Platón, por el otro. El resto de la enseñanza estaba basada principalmente en textos filosóficos de Aristóteles (Órganon, Metafísica, Ética a Nicómaco), acompañados por comentarios de jesuitas (Suárez, Fonseca, Toledo, quizá Vitoria) y otros autores españoles (Cayetano). Conviene destacar que Aristóteles era entonces el autor de referencia para el estudio, tanto de la física, como de la biología. El plan de estudios incluía también una introducción a las matemáticas (Clavius), tanto puras como aplicadas: astronomía, música, arquitectura. Siguiendo una extendida práctica medieval y clásica, en esta escuela los estudiantes se ejercitaban constantemente en la discusión (Cfr. Gaukroger, quien toma en cuenta la Ratio studiorum: el plan de estudios que aplicaban las instituciones jesuíticas).\n\nJuventud\n\nRené Descartes en su escritorio.\nA los 18 años de edad, Descartes ingresó en la Universidad de Poitiers para estudiar derecho y medicina. Para 1616 cuenta con los grados de bachiller y licenciado en Derecho.\n\nA los veintidós años parte hacia los Países Bajos, donde observa los preparativos del ejército de Mauricio de Nassau para la inminente Guerra de los Treinta Años. En 1618 y 1619 reside en Países Bajos. En noviembre de 161819​ conoció en Breda a Isaac Beeckman con quien durante varios años mantiene una intensa y estrecha amistad y que intentaba desarrollar una teoría física corpuscularista, muy basada en conceptos matemáticos. El contacto con Beeckman estimuló en gran medida el interés de Descartes por la matemática y la física. Pese a los constantes viajes que realizó en esta época, Descartes no dejó de formarse y en 1620 conoció en Ulm al entonces famoso maestro calculista alemán Johann Faulhaber. Para Beeckman escribe pequeños trabajos de física, como «Sobre la presión del agua en un vaso» y «Sobre la caída de una piedra en el vacío», así como un compendio de música.\n\nEn 1619 se enrola en las filas del duque Maximiliano de Baviera.\n\nLos tres sueños\nDescartes se refirió que, inspirado por una serie de sueños, en esta época vislumbró la posibilidad de desarrollar una «ciencia maravillosa».20​ El filósofo se encontraba acuartelado en Ulm, cerca de Baviera, durante el invierno de 1619. Pasó el día en una habitación calentada por una estufa, al dormirse por la noche tres sueños sucesivos que interpreta como un mensaje del Cielo para consagrarse a su misión de investigador.21​\n\nEn el primer sueño es atormentado por unos fantasmas que lo asustaron tanto que le hicieron salir a la calle. Al caminar iba encorvado hacia el lado izquierdo, porque sentía una gran debilidad en su lado derecho. Cuando intentaba rectificar su paso, fue sacudido por un torbellino. Vio una iglesia y fue hacia ella, con la idea de rezar, pero un hombre se acercó a él diciéndole que Monsieur N tenía algo que darle. Era un melón de un país extranjero. La intensidad del viento disminuyó y se despertó pensando que tal vez un genio maligno lo quería seducir.\n\nAl despertarse, Descartes rezó y le pidió a Dios que lo protegiera y volvió a dormirse. En el segundo sueño un sonido explosivo, como un relámpago, lo estremeció. Esto hizo que se \"despertara\". Abrió los ojos y notó numerosas centellas de fuego dispersas por toda su habitación. El terror se disipó y se volvió a dormir.\n\nEl tercer sueño, Descartes encontró un diccionario y una antología de poesía latina, Corpus Poetarum. Lo abrió en un verso que decía \"Quod vitae sectabor iter?\" (\"¿Qué camino de vida debo seguir?\"). Luego un hombre desconocido le mostró un verso que empezaba \"Est & Non\" (\"Sí o No\"). Era un idyllis de Ausonio. Se lo intentó enseñar al hombre pero no lo encontró. Le dijo al hombre que conocía otro poema, del mismo poeta, que empezaba \"Quod vitae sectabor iter?\". Sin lograrlo, finalmente el libro y el hombre desaparecieron. Se dice que Descartes no despertó, sino que empezó a interpretar su sueño mientras soñaba.\n\nDescartes consideró que \"el Diccionario significaba nada menos que todas las ciencias juntas\" y que los poemas indicaban \"la Filosofía y la Sabiduría unidas\" y por último, que la frase \"Quod vitae sectabor iter\" \"era un buen consejo de una persona sabia, o incluso Teología Moral\". El \"Sí y No\", que era de Pitágoras, debía entenderse como la verdad y la falsedad en el conocimiento humano y en las ciencias seculares.21​ De esa época posiblemente data su concepción de una matemática universal y su invento de la geometría analítica.\n\nEtapa investigadora\nRenunció a la vida militar en 1619. Abandona Países Bajos, vive una temporada en Dinamarca y luego en Alemania, asistiendo a la coronación del emperador Fernando en Fráncfort. Viaja por Alemania y regresa a Francia en 1622, estancia que aprovecha para vender sus posesiones y así asegurarse una vida independiente. Pasa una temporada en Italia (1623-1625), donde sigue de cerca el itinerario que décadas antes había hecho Michel de Montaigne.\n\n\nDescartes en la Corte de la reina Cristina de Suecia (detalle), Louis-Michel Dumesnil, Palacio de Versalles.\nA pesar de discurrir sobre los temas anteriores, Descartes no publicó entonces ninguno de estos resultados. Durante su estancia más larga en París, Descartes reafirma relaciones que había establecido a partir de 1622 con otros intelectuales, como Marin Mersenne y Jean-Louis Guez de Balzac, así como con un círculo conocido como «Los libertinos». En esta época sus amigos propagan su reputación, hasta el punto de que su casa se convirtió entonces en un punto de reunión para quienes gustaban intercambiar ideas y discutir. Con todo ello su vida parece haber sido algo agitada, pues en 1628 se bate en duelo, tras el cual comentó que «no he hallado una mujer cuya belleza pueda compararse a la de la verdad».\n\nEl año siguiente, con la intención de dedicarse por completo al estudio, se traslada definitivamente a los Países Bajos, donde llevaría una vida modesta y tranquila, aunque cambiando de residencia constantemente para mantener oculto su paradero. Descartes permanece allí hasta 1649, viajando, sin embargo, en una ocasión a Dinamarca y en tres a Francia.\n\nLa preferencia de Descartes por Países Bajos parece haber sido bastante acertada, pues mientras en Francia muchas cosas podrían distraerlo y había escasa tolerancia, las ciudades neerlandesas estaban en paz, florecían gracias al comercio y grupos de burgueses potenciaban las ciencias fundándose la academia de Ámsterdam en 1632. Entretanto, el centro de Europa se desgarraba en la Guerra de los Treinta Años, que terminaría en 1648. Aun así, tomando ejemplo de lo sucedido a Galileo con la Iglesia, Descartes se muestra cauteloso en sus escritos y, en su correspondencia de esos años con el médico Regius (1639-1645) o su amigo Mersenne, recomienda a éstos discreción a la hora de dar a conocer sus teorías para evitar un posible encarcelamiento o incluso la muerte. En una carta de 1633 enviada a este último, impactado por la reciente condena al científico italiano, llega a plantearle la quema de sus papeles o, al menos, no dejárselos ver a nadie.22​\n\nFallecimiento\n\nLa tumba de Descartes (en el centro), con vista detallada de la inscripción, en la iglesia de Saint-Germain-des-Prés, París.\nEn septiembre de 1649, la reina Cristina de Suecia llamó a Descartes a Estocolmo. Allí murió de una neumonía el 11 de febrero de 1650, a los 53 años de edad. Actualmente se pone en duda si la causa de su muerte fue la neumonía. En 1980, el historiador y médico alemán Eike Pies halló en la Universidad de Leiden una carta secreta del médico de la corte que atendió a Descartes, el neerlandés Johan Van Wullen, en la que describía al detalle su agonía. Curiosamente, los síntomas presentados —náuseas, vómitos, escalofríos— no eran propios de una neumonía. Tras consultar a varios patólogos, Pies concluyó en su libro El homicidio de Descartes, documentos, indicios, pruebas, que la muerte se debía a envenenamiento por arsénico. La carta secreta fue enviada a un antepasado del escritor, el neerlandés Willem Pies.\n\nEn 1663 su obra filosófica, así como Las pasiones del alma —último trabajo publicado en vida del autor—, fueron incluidas por la Iglesia católica en su Índice de Libros Prohibidos,23​ en ambos casos con el añadido donec corrigantur (\"hasta ser corregida\").24​\n\nEn el año de 1676 se exhumaron los restos de Descartes; colocados en un ataúd de cobre se trasladaron a París para ser sepultados en la iglesia de Sainte-Geneviève-du-Mont. Movidos nuevamente durante el transcurso de la Revolución francesa, los restos fueron colocados en el Panthéon, la basílica dedicada a los grandes hombres de la nación francesa. Nuevamente, en 1819, los restos de René Descartes cambiaron de sitio de reposo y fueron llevados esta vez a la Abadía de Saint-Germain-des-Prés, donde se encuentran en la actualidad, a excepción de su cráneo que se conserva en el Museo del Hombre en París.\n\nEn 1935 se llamó, en su honor, «Descartes» a un cráter lunar.25​ Su ciudad natal también fue bautizada como \"Descartes\".', 1, 'Duda Metódica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `efecto_concepto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conceptos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto_libros`
--

CREATE TABLE `concepto_libros` (
  `id_conceptos` int(10) UNSIGNED NOT NULL,
  `id_libro` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `debate`
--

CREATE TABLE `debate` (
  `id` int(10) UNSIGNED NOT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `tiempo` double DEFAULT 60,
  `puntos_conviccion_jugador1` int(11) DEFAULT 0,
  `puntos_conviccion_jugador2` int(11) DEFAULT 0,
  `id_jugador1` int(10) UNSIGNED DEFAULT NULL,
  `id_jugador2` int(10) UNSIGNED DEFAULT NULL,
  `id_argumentario_jugador1` int(10) UNSIGNED DEFAULT NULL,
  `id_argumentario_jugador2` int(10) UNSIGNED DEFAULT NULL,
  `estado_debate` enum('con asientos','sin asientos') DEFAULT 'con asientos',
  `replicas_jugador1` int(11) DEFAULT 4,
  `replicas_jugador2` int(11) DEFAULT 4,
  `carta_senalada_jugador1` int(10) UNSIGNED DEFAULT NULL,
  `carta_senalada_jugador2` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela_filosofica`
--

CREATE TABLE `escuela_filosofica` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `win_condition` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `escuela_filosofica`
--

INSERT INTO `escuela_filosofica` (`id`, `nombre`, `win_condition`) VALUES
(1, 'Racionalistas', 'Razón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `contrasena` varchar(200) DEFAULT NULL,
  `img_perfil` longblob DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `debates_realizados` int(11) DEFAULT 0,
  `debates_ganados` int(11) DEFAULT 0,
  `debates_perdidos` int(11) DEFAULT 0,
  `elo` int(11) DEFAULT 0,
  `enlinea` tinyint(1) DEFAULT 0,
  `id_google` varchar(100) DEFAULT NULL,
  `codigo_recuperacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugador`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador_jugador`
--

CREATE TABLE `jugador_jugador` (
  `id_jugador_amigante` int(10) UNSIGNED DEFAULT NULL,
  `id_jguador_amigo` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador_libros`
--

CREATE TABLE `jugador_libros` (
  `id_jugador` int(10) UNSIGNED NOT NULL,
  `id_libro` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `texto` text DEFAULT NULL,
  `disciplina_filosofica` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT 0,
  `id_autor` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

-- Índices para tablas volcadas
--

--
-- Indices de la tabla `argumentario`
--
ALTER TABLE `argumentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jugador` (`id_jugador`),
  ADD KEY `id_escuela_filosofica` (`id_escuela_filosofica`);

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_escuela_filosofica` (`id_escuela_filosofica`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `concepto_libros`
--
ALTER TABLE `concepto_libros`
  ADD PRIMARY KEY (`id_libro`,`id_conceptos`),
  ADD KEY `id_conceptos` (`id_conceptos`);

--
-- Indices de la tabla `debate`
--
ALTER TABLE `debate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jugador1` (`id_jugador1`),
  ADD KEY `id_jugador2` (`id_jugador2`),
  ADD KEY `id_argumentario_jugador1` (`id_argumentario_jugador1`),
  ADD KEY `id_argumentario_jugador2` (`id_argumentario_jugador2`);

--
-- Indices de la tabla `escuela_filosofica`
--
ALTER TABLE `escuela_filosofica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jugador_libros`
--
ALTER TABLE `jugador_libros`
  ADD PRIMARY KEY (`id_jugador`,`id_libro`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_autor` (`id_autor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `argumentario`
--
ALTER TABLE `argumentario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `debate`
--
ALTER TABLE `debate`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `escuela_filosofica`
--
ALTER TABLE `escuela_filosofica`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `argumentario`
--
ALTER TABLE `argumentario`
  ADD CONSTRAINT `argumentario_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id`),
  ADD CONSTRAINT `argumentario_ibfk_2` FOREIGN KEY (`id_escuela_filosofica`) REFERENCES `escuela_filosofica` (`id`);

--
-- Filtros para la tabla `autor`
--
ALTER TABLE `autor`
  ADD CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`id_escuela_filosofica`) REFERENCES `escuela_filosofica` (`id`);

--
-- Filtros para la tabla `concepto_libros`
--
ALTER TABLE `concepto_libros`
  ADD CONSTRAINT `concepto_libros_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`),
  ADD CONSTRAINT `concepto_libros_ibfk_2` FOREIGN KEY (`id_conceptos`) REFERENCES `conceptos` (`id`);

--
-- Filtros para la tabla `debate`
--
ALTER TABLE `debate`
  ADD CONSTRAINT `debate_ibfk_1` FOREIGN KEY (`id_jugador1`) REFERENCES `jugador` (`id`),
  ADD CONSTRAINT `debate_ibfk_2` FOREIGN KEY (`id_jugador2`) REFERENCES `jugador` (`id`),
  ADD CONSTRAINT `debate_ibfk_3` FOREIGN KEY (`id_argumentario_jugador1`) REFERENCES `argumentario` (`id`),
  ADD CONSTRAINT `debate_ibfk_4` FOREIGN KEY (`id_argumentario_jugador2`) REFERENCES `argumentario` (`id`);

--
-- Filtros para la tabla `jugador_libros`
--
ALTER TABLE `jugador_libros`
  ADD CONSTRAINT `jugador_libros_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id`),
  ADD CONSTRAINT `jugador_libros_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
