-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2024 a las 13:23:02
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquiler_vehiculos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Coche'),
(2, 'Camion'),
(3, 'Moto'),
(4, 'SUV'),
(5, 'Furgoneta'),
(6, 'Deportivo'),
(7, 'Híbrido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `dni_pasaporte` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `pais_nacimiento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellidos`, `dni_pasaporte`, `telefono`, `sexo`, `fecha_nacimiento`, `pais_nacimiento`) VALUES
(1, 'Juan', 'Pérez', 'A1234567', '5551234', 'M', '1985-06-12', 'Spain'),
(2, 'María', 'Gómez', 'B2345678', '5555678', 'F', '1990-08-23', 'México'),
(3, 'Carlos', 'Lopez', 'C3456789', '5556789', 'M', '1975-11-05', 'Argentina'),
(4, 'Ana', 'Martín', 'D4567890', '5557890', 'F', '1982-04-14', 'Spain'),
(5, 'Luis', 'Fernández', 'E5678901', '5558901', 'M', '1992-09-30', 'Chile'),
(6, 'Lucía', 'Ramírez', 'F6789012', '5559012', 'F', '1988-03-02', 'Perú'),
(7, 'Pedro', 'Santos', 'G7890123', '5550123', 'M', '1980-12-25', 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`) VALUES
(1, 'Renault'),
(2, 'Ford'),
(3, 'Opel'),
(4, 'Seat'),
(5, 'Toyota'),
(6, 'BMW'),
(7, 'Mercedes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `nombre_modelo` varchar(50) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id_modelo`, `nombre_modelo`, `id_marca`) VALUES
(1, 'Laguna', 1),
(2, 'Fiesta', 2),
(3, 'Astra', 3),
(4, 'Ibiza', 4),
(5, 'Corolla', 5),
(6, 'Serie 3', 6),
(7, 'Clase C', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `trayecto` text DEFAULT NULL,
  `fecha_alquiler` date DEFAULT NULL,
  `hora_inicio_alquiler` time DEFAULT NULL,
  `hora_fin_alquiler` time DEFAULT NULL,
  `id_vehiculo` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `trayecto`, `fecha_alquiler`, `hora_inicio_alquiler`, `hora_fin_alquiler`, `id_vehiculo`, `id_cliente`) VALUES
(1, 'largo', '2024-01-01', '09:00:00', '15:00:00', 1, 1),
(2, 'medio', '2024-01-02', '10:00:00', '14:00:00', 2, 2),
(3, 'medio', '2024-01-03', '08:00:00', '12:00:00', 3, 3),
(4, 'Madrid a Valencia', '2024-01-04', '11:00:00', '16:00:00', 4, 4),
(5, 'Bogotá a Medellín', '2024-01-05', '07:00:00', '12:00:00', 5, 5),
(6, 'medio', '2024-01-06', '09:30:00', '13:30:00', 6, 6),
(7, 'medio', '2024-01-07', '10:15:00', '14:15:00', 7, 7);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `reservas_no_españoles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `reservas_no_españoles` (
`id_reserva` int(11)
,`trayecto` text
,`fecha_alquiler` date
,`hora_inicio_alquiler` time
,`hora_fin_alquiler` time
,`id_vehiculo` int(11)
,`id_cliente` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `num_matricula` varchar(20) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_modelo` int(11) DEFAULT NULL,
  `año_fabricacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `num_matricula`, `id_categoria`, `id_modelo`, `año_fabricacion`) VALUES
(1, '1234ABC', 1, 1, 2010),
(2, '5678DEF', 2, 2, 2015),
(3, '9012GHI', 3, 3, 2020),
(4, '3456JKL', 4, 4, 2018),
(5, '7890MNO', 5, 5, 2019),
(6, '1122PQR', 6, 6, 2021),
(7, '3344STU', 7, 7, 2023);

-- --------------------------------------------------------

--
-- Estructura para la vista `reservas_no_españoles`
--
DROP TABLE IF EXISTS `reservas_no_españoles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservas_no_españoles`  AS SELECT `r`.`id_reserva` AS `id_reserva`, `r`.`trayecto` AS `trayecto`, `r`.`fecha_alquiler` AS `fecha_alquiler`, `r`.`hora_inicio_alquiler` AS `hora_inicio_alquiler`, `r`.`hora_fin_alquiler` AS `hora_fin_alquiler`, `r`.`id_vehiculo` AS `id_vehiculo`, `r`.`id_cliente` AS `id_cliente` FROM `reserva` AS `r` WHERE `r`.`id_cliente` in (select `cliente`.`id_cliente` from `cliente` where `cliente`.`pais_nacimiento` <> 'Spain')  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `dni_pasaporte` (`dni_pasaporte`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `num_matricula` (`num_matricula`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_modelo` (`id_modelo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `vehiculo_ibfk_2` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
