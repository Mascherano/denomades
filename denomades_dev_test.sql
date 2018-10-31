-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2018 a las 18:47:51
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `denomades_dev_test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(160) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `activities`
--

INSERT INTO `activities` (`id`, `name`, `description`, `slug`, `price`) VALUES
(1, 'Geysers del Tatio', 'Imperdible tour a los Geysers del Tatio, un espectáculo único en el mundo. Incluye desayuno y visita al pueblo de Machuca.', 'geysers-del-tatio', 22000),
(2, 'Valle de la Luna', 'En nuestro tour al Valle de la Luna, disfruta de un atardecer de otro planeta, visitando las Tres Marías, el Cañón, el Anfiteatro y la Piedra del Coyote.', 'valle-de-la-luna', 13000),
(3, 'Salar de Uyuni', 'Tour compartido de 4 días al Salar de Uyuni, comenzando y finalizando en San Pedro de Atacama. Incluye transporte, alojamiento básico y alimentación.', 'salar-de-uyuni', 150000),
(4, 'Laguna Cejar', 'Tour a Laguna Cejar, Laguna Piedra, Ojos del Salar y Laguna Tebinquinche, experiencia donde podrás ver aguas turquesas en un paisaje sobrecogedor.', 'laguna-cejar', 19000),
(5, 'Lagunas Altiplánicas', 'Tour al Salar de Atacama, Lagunas Altiplánicas y los pueblos de Toconao y Socaire. Incluye desayuno.', 'laguna-altiplanicas', 30000),
(6, 'Salar de Tara', 'Tour a uno de los secretos mejor guardados del desierto de Atacama. Incluye desayuno y box lunch.', 'salar-de-tara', 50000),
(7, 'Termas de Puritama', 'Disfruta de un reponedor baño en las Termas de Puritama, considerada una de las tres mejores termas de Chile.', 'termas-de-puritama', 12000),
(8, 'Valle del Arcoíris', 'Descubre las coloridas montañas del Valle del Arcoíris y asómbrate con los históricos petroglifos de Yerbas Buenas.', 'valle-del-arcoiris', 25000),
(9, 'Tour Astronómico', 'Toma este Tour Astronómico en el desierto de Atacama, uno de los mejores lugares del mundo para la observación del cielo nocturno.', 'tour-astronomico', 17000),
(10, 'Lagunas Escondidas de Baltinache', 'Visita las lagunas escondidas de Baltinache o Siete Lagunas, uno de los secretos del desierto de Atacama. Incluye transporte compartido.', 'lagunas-escondidas-de-baltinache', 21000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `people_number` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bookings`
--

INSERT INTO `bookings` (`id`, `activity_id`, `date`, `people_number`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 10, '2018-11-01', 1, 21000, '2018-10-31 18:40:26', '2018-10-31 18:40:26'),
(2, 10, '2018-11-02', 2, 42000, '2018-10-31 18:41:08', '2018-10-31 18:41:08');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bookings_activities_activity_id_idx` (`activity_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_bookings_activities_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
