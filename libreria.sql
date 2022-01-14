-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-01-2022 a las 02:03:38
-- Versión del servidor: 8.0.17
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `title` varchar(70) DEFAULT NULL,
  `autor` varchar(70) DEFAULT NULL,
  `editorial` varchar(70) DEFAULT NULL,
  `anio_publicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `title`, `autor`, `editorial`, `anio_publicacion`) VALUES
(1, 'Don quijote de la mancha', 'Miguel de Cervantes Saavedra', 'Librería de Garnier Hermanos', 1890),
(2, 'Historia de dos ciudades', ' Charles Dickens', 'Juventud', 1859),
(3, 'El señor de los anillos', ' J. R. R. Tolkien', 'George Allen & Unwin', 1954),
(4, 'El principito', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock', 1943),
(6, 'El hobbit', 'J. R. R. Tolkien', 'George Allen y Unwin', 1937),
(7, 'Las aventuras de Alicia en el país de las maravillas', 'Lewis Carroll', 'Macmillan Publishers', 1865),
(8, 'Diez negritos', 'Agatha Christie', 'Collins Crime Club+', 1939),
(9, 'Las Crónicas de Narnia', 'C. S. Lewis', 'Andres Bello', 1950),
(11, ' El código Da Vinci', ' Dan Brown', 'Doubleday', 2003),
(13, 'Ella', 'H.Rider Haggard', 'Longman', 1887);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `autor` (`autor`),
  ADD UNIQUE KEY `editorial` (`editorial`),
  ADD UNIQUE KEY `anio_publicacion` (`anio_publicacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
