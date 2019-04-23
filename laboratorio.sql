-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2019 a las 01:22:55
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE `laboratorio`;
USE `laboratorio`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laboratorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliacion`
--

CREATE TABLE `afiliacion` (
  `nro_afiliado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `paciente` int(11) NOT NULL,
  `obra_social` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `afiliacion`
--

INSERT INTO `afiliacion` (`nro_afiliado`, `paciente`, `obra_social`) VALUES
('156156156165', 3, 2),
('51561656', 1, 156),
('561189198', 2, 174);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisis`
--

CREATE TABLE `analisis` (
  `protocolo` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `paciente` int(11) NOT NULL,
  `pago` double(8,2) NOT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_analisis`
--

CREATE TABLE `detalle_analisis` (
  `protocolo` int(11) NOT NULL,
  `practica` int(11) NOT NULL,
  `resultado` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_02_13_034412_create_afiliacion_table', 1),
(4, '2019_02_13_034412_create_analisis_table', 1),
(5, '2019_02_13_034412_create_detalle_analisis_table', 1),
(6, '2019_02_13_034412_create_obra_social_table', 1),
(7, '2019_02_13_034412_create_paciente_table', 1),
(8, '2019_02_13_034412_create_practica_table', 1),
(9, '2019_02_13_034412_create_subpractica_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra_social`
--

CREATE TABLE `obra_social` (
  `id` int(10) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `obra_social`
--

INSERT INTO `obra_social` (`id`, `descripcion`) VALUES
(1, 'INSTITUTO OBRA MEDICO ASISTENCIAL'),
(2, 'INSTITUTO OBRA MEDICO ASISTENCIAL - HONORARIOS INTERNADOS'),
(4, 'INSTITUTO OBRA MEDICO ASISTENCIAL - PROGRAMA HIV'),
(60, 'OBRA SOCIAL DEL PERSONAL DE LA INDUSTRIA LADRILLERA A MAQUINA'),
(64, 'IOSFA - INSTITUTO DE OBRA SOCIAL DEL EJERCITO - FUERZAS ARMADAS'),
(86, 'INSTITUTO OBRA MEDICO ASISTENCIAL - CONVENIO INTERPROVINCIAL'),
(119, 'STAFF MEDICO S.A.'),
(146, 'SINDICATO DE OBREROS Y EMPLEADOS DE LA MINORIDAD Y LA EDUCACION'),
(147, 'OBRA SOCIAL FEDERACION ARGENTINA TRABAJADORES LUZ Y FUERZA'),
(154, 'AUDISALUD S.R.L - O. S. DEL PERS. AUX. DE CASAS PARTICULARES'),
(156, 'SINDICATO DE SALUD PUBLICA'),
(159, 'ASOCIACION ARGENTINA DE TELEGRAFISTAS, RADIOTELEGRAFISTAS Y AFINES'),
(165, 'MUTUAL FEDERADA 25 DE JUNIO'),
(171, 'UNION PERSONAL CIVIL DE LA NACION'),
(172, 'ASOCIACION MUTUAL DE LOS SERV. SOC. DEL PERS. DE LA CONTADURIA GRAL. DE LA PROV. DE BS.AS.'),
(173, 'ASOCIACION DE OBREROS Y EMPLEADOS JORNALIZADOS DE LA DIRECCION DE ARQ. DEL MOP'),
(174, 'ASOCIACION DE EMPLEADOS DE RENTAS E INMOBILIARIA'),
(175, 'OBRA SOCIAL DEL PERSONAL DE LA INDUSTRIA DE LA ALIMENTACION'),
(177, 'ASOCIACION MUTUAL DE SERVIDORES PUBLICOS DE LA PCIA. DE BS. AS.'),
(183, 'IOMA PLAN ADHESION VOLUNTARIA'),
(187, 'ASOCIACION DEL PERSONAL SUPERIOR DE LA ORGANIZACION TECHINT'),
(192, 'OBRA SOCIAL DE FUTBOLISTAS'),
(225, 'DIRECCION DE SERVICIOS SOCIALES DE LA UNIVERSIDAD NACIONAL DE LA PLATA'),
(228, 'OBRA SOCIAL FEDERACION DE EDUCADORES BONAERENSES DOMINGO F. SARMIENTO'),
(232, 'CENTRO MEDICO PUEYRREDON '),
(238, 'ASOCIACION JUDICIAL BONAERENSE'),
(245, 'SINDICATO OBRAS SANITARIAS DE LA PCIA. DE BS. AS.'),
(254, 'CONFERENCIA EPISCOPAL ARGENTINA'),
(255, 'UNO SALUD S.A.'),
(266, 'CAJA NOTARIAL COMPLEMENTARIA DE SEGURIDAD SOCIAL'),
(267, 'PERSONAL LEGISLATIVO'),
(276, 'DIRECCION GENERAL DE SERVICIOS SOCIALES DE LA POLICIA DE LA PCIA. DE BS. AS.'),
(285, 'SINDICATO UNIFICADO DE TRABAJADORES DE LA EDUCACION DE BUENOS AIRES'),
(300, 'ASOCIACION MUTUAL EMPLEADOS MUNICIPALES'),
(301, 'SISTEMA COSEGURO ASISTENCIAL MUNICIPAL'),
(304, 'ASOCIACION DE TRABAJADORES DEL MINISTERIO DE GOB. Y DE LA GOBERNACION DE LA PCIA. DE BS. AS.'),
(306, 'SINDICATO DE TRABAJADORES MUNICIPALES DE LANUS'),
(319, 'ASOCIACION TRABAJADORES DEL ESTADO'),
(408, 'MINISTERIO DE SALUD PCIA. DE BS. AS.'),
(409, 'ASOCIACION DEL PERSONAL DE LOS ORGANISMOS DE CONTROL'),
(414, 'UNION DE DOCENTES DE LA PROVINCIA DE BUENOS AIRES'),
(418, 'DIR. GRAL. AC. SOC. SERV. PENITENCIARIO BONAERENSE'),
(419, 'IOMA - PROGRAMA PREVENCION CANCER COLORRECTAL'),
(431, 'OBRA SOCIAL DE LA FEDERACION ARGENTINA DEL TRABAJADOR DE LAS UNIVERSIDADES NACIONALES'),
(433, 'ISALUD S.R.L.'),
(441, 'OBRA SOCIAL PERSONAL DE SEGURIDAD COMERCIAL INDUSTRIAL E INVESTIGACIONES PRIVADAS'),
(470, 'ORGANIZACION MEDICA S.A. - OBRA SOCIAL DEL PERSONAL AUXILIAR DE CASAS PARTICULARES'),
(472, 'APPI - OBRA SOCIAL DEL PERSONAL DE LAS TELECOMUNICACIONES DE LA REPUBLICA ARGENTINA'),
(473, 'APPI - OSTEL JUBILADOS Y PENSIONADOS'),
(487, 'CAJA DE ABOGADOS'),
(490, 'OSSEG PLAN INTEGRAL E INTEGRAL ADHERENTE CONURBANO'),
(547, 'AMSTERDAM SALUD S.A.'),
(586, 'OBRA SOCIAL DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO'),
(601, 'INSTITUTO OBRA MEDICO ASISTENCIAL - PLAN MATERNO INFANTIL'),
(619, 'PREVENCION SALUD S.A.'),
(643, 'OBRA SOCIAL DE LOS SUPERVISORES DE LA INDUSTRIA METALMECANICA DE LA REPUBLlCA ARGENTINA'),
(685, 'OBRA SOCIAL DEL PERSONAL DE ENTIDADES DEPORTIVAS Y CIVILES'),
(696, 'OBRA SOCIAL DEL PERSONAL DE LA SANIDAD ARGENTINA'),
(697, 'OBRA SOCIAL DEL PERSONAL DE LA SANIDAD ARGENTINA'),
(708, 'SEGURO PUBLICO DE SALUD EMBARAZADAS'),
(734, 'OBRA SOCIAL DE FOTOGRAFOS'),
(735, 'ENSALUD S.A.'),
(754, 'IOMA PLAN SER'),
(757, 'OBRA SOCIAL ACEROS PARANA'),
(908, 'IOMA - PROGRAMA DE SALUD RENAL'),
(909, 'MANDAR SALUD S.A. - PLAN DE SALUD SANATORIO SAN JOSÉ'),
(932, 'O.S. DEL PERSONAL DE DIRECCION DE SANIDAD LUIS PASTEUR'),
(950, 'OBRA SOCIAL DE TRABAJORES VIALES'),
(957, 'OBRA SOCIAL DEL PERSONAL DEL PAPEL, CARTON Y QUIMICOS'),
(962, 'ASOCIACION MUTUALISTA DE EMPLEADOS DEL BANCO DE LA PCIA. BS. AS.'),
(970, 'OBRA SOCIAL DEL PERSONAL DE EDIFICIOS DE RENTA Y HORIZONTALES DE LA REPÚBLICA ARGENTINA'),
(978, 'IOMA - PROGRAMA DE FERTILIZACION ASISTIDA'),
(991, 'OBRA SOCIAL VENDEDORES AMBULANTES DE LA REPUBLICA ARGENTINA'),
(992, 'SCIS S.A - PLANES SC 50 - SC 100 - SC 150 - SC 250 - SC 300 - SC 1100'),
(994, 'SCIS S.A - PLANES SC 500 - SC 550 - SC 600'),
(1041, 'GRUPO SAN NICOLAS S.R.L.'),
(1586, 'ASOCIACION MUTUAL DEL CONTROL INTEGRAL'),
(1643, 'HEALTH MEDICAL S.A.'),
(2015, 'GALENO ARGENTINA S.A.'),
(2068, 'OBRA SOCIAL PERSONAL DE LA INDUSTRIA ACEITERA, DESMOTADORA Y AFINES'),
(2070, 'JERARQUICOS SALUD'),
(2125, 'UNIVERSIDAD NACIONAL DE LA PLATA - CONVENIO DE RECIPROCIDAD'),
(2138, 'OBRA SOCIAL DEL PERSONAL DE LA INDUSTRIA LECHERA'),
(2149, 'OBRA SOCIAL PERSONAL DE FARMACIA'),
(2161, 'OBRA SOCIAL DE LA SOCIEDAD ARGENTINA DE AUTORES Y COMPOSITORES'),
(2165, 'MUTUAL FEDERADA 25 DE JUNIO PLAN 4000'),
(2209, 'OBRA SOCIAL EMPLEADOS DE LA MARINA MERCANTE'),
(2212, 'SERVESALUD CONURBANO'),
(2213, 'SANCOR PLANES 5000 - 4065 - 4000 - 3500 - 3000 - 2500 - 2000'),
(2216, 'CORTE SUPREMA DE JUSTICIA OBRA SOCIAL DEL PODER JUDICIAL'),
(2240, 'DIRECCION DE ASISTENCIA SOCIAL Y MEDICINA INTEGRAL DE LA UNIVERSIDAD NACIONAL DE LUJAN'),
(2246, 'ASOCIACION MUTUAL FARMACEUTICOS FLORENTINO AMEGHINO'),
(2249, 'CAJA DE SEGURIDAD SOCIAL PARA ESCRIBANOS DE LA PROVINCIA DE BUENOS AIRES'),
(2252, 'OBRA SOCIAL DEL PERSONAL DE LA INDUSTRIA MADERERA'),
(2260, 'OBRA SOCIAL DEL PERSONAL DE DIRECCION DE EMPRESAS DE LA ALIMENTACION'),
(2284, 'OBRA SOCIAL DEL PERSONAL SOCIEDADES DE AUTORES Y AFINES'),
(2320, 'OBRA SOCIAL DE LA CAJA DE ODONTOLOGOS - CONURBANO'),
(2338, 'PAMI UGL XXXVIII DISTRITO VII'),
(2357, 'OBRA SOCIAL DE EMPRESARIOS - CONURBANO'),
(2365, 'OBRA SOCIAL PERSONAL DE PRENSA DE LA REPUBLICA ARGENTINA'),
(2366, 'OBRA SOCIAL DEL PERSONAL DE ESCRIBANIAS DE LA PCIA. DE BS. AS.'),
(2434, 'OBRA SOCIAL FERROVIARIA CONURBANO'),
(2435, 'OBRA SOCIAL DE LOCUTORES'),
(2465, 'MUTUAL FEDERADA 25 DE JUNIO PLAN 5000'),
(2485, 'SWISS MEDICAL CONURBANO'),
(2500, 'ACA SALUD COOPERATIVA DE PRESTACION DE SERVICIOS MEDICO ASISTENCIALES LIMITADA'),
(2539, 'PAMI UGL XI - MAR DEL PLATA'),
(2540, 'PAMI UGL VIII SAN MARTIN'),
(2573, 'OBRA SOCIAL DEL PERSONAL JERARQUICO DE LA REPUBLlCA ARGENTINA'),
(2589, 'O.S. DEL PERSONAL DEL ORGANISMO DE CONTROL EXTERNO PLAN PMO'),
(2628, 'PAMI UGL XXIX - MORON'),
(2632, 'PAMI UGL XXX - AZUL'),
(2633, 'PAMI UGL VII - LA PLATA'),
(2635, 'PAMI UGL XXXII - LUJAN'),
(2637, 'PAMI UGL XXXV SAN JUSTO'),
(2645, 'PAMI UGL XXXI - DISTRITO VII'),
(2646, 'PAMI UGL XXXI - DISTRITO VI'),
(2660, 'OSSEG PLAN ESPECIAL Y SALUD CONURBANO PRESTACION - COMEDICA S.A.'),
(2697, 'OBRA SOCIAL DEL PERSONAL DE LA SANIDAD ARGENTINA'),
(2738, 'PAMI UGL XXXVIII DISTRITO V'),
(2808, 'MANDAR SALUD S.A. - DAS CONGRESO'),
(2839, 'OBRA SOCIAL AGENTES DE PROPAGANDA MEDICA'),
(2856, 'OBRA SOCIAL DEL PERSONAL DE TELEVISION'),
(2860, 'OBRA SOCIAL DEL PERSONAL DE BARRACAS DE LANAS, CUEROS Y ANEXOS'),
(2897, 'OSPRERA'),
(2938, 'PAMI UGL XXXVIII DISTRITO VI'),
(3213, 'SANCOR PLANES 1500 - 1000 - 500 - C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `nombre_y_apellido` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `celular` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `documento`, `tipo_documento`, `nombre_y_apellido`, `fecha_nacimiento`, `celular`, `telefono`, `direccion`, `localidad`) VALUES
(1, 36951459, 1, 'Agustin Caputo', '1992-08-26', '1123905540', '44834809', '9 de julio 736', 'Morón'),
(2, 5189198, 1, 'ionefoiefoi', '1992-08-26', '651561651', 'effneifo', 'foineoinf', 'foinefioef'),
(3, 15616551, 2, 'woidbdwiodbwoi', '1966-08-26', '15615615', '56165165', 'diudbueid 736', 'Morón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practica`
--

CREATE TABLE `practica` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `material` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subpractica`
--

CREATE TABLE `subpractica` (
  `id` int(10) UNSIGNED NOT NULL,
  `practica` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `unidad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `valor_referencia` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `tipo_documento` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `tipo_documento`) VALUES
(1, 'DNI'),
(2, 'LC'),
(3, 'LE'),
(4, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `afiliacion`
--
ALTER TABLE `afiliacion`
  ADD PRIMARY KEY (`nro_afiliado`);

--
-- Indices de la tabla `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`protocolo`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `obra_social`
--
ALTER TABLE `obra_social`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `practica`
--
ALTER TABLE `practica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subpractica`
--
ALTER TABLE `subpractica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `analisis`
--
ALTER TABLE `analisis`
  MODIFY `protocolo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `practica`
--
ALTER TABLE `practica`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `subpractica`
--
ALTER TABLE `subpractica`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
