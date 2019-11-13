-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-11-2019 a las 15:35:20
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_places`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_display` int(11) NOT NULL,
  `category_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_display`, `category_created_at`, `category_updated_at`) VALUES
(1, 'Hotel', 1, '2019-11-12 22:09:12', '2019-11-12 22:09:12'),
(2, 'Farmacia', 1, '2019-11-12 22:09:12', '2019-11-12 22:09:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_content` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `comment_visited` int(11) NOT NULL,
  `comment_return` int(11) NOT NULL,
  `comment_display` int(11) NOT NULL,
  `comment_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `place_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_content`, `comment_visited`, `comment_return`, `comment_display`, `comment_created_at`, `comment_updated_at`, `place_id`, `user_id`) VALUES
(1, 'Me gusta mucho porque es bastante económico', 1, 1, 1, '2019-11-12 22:28:00', '2019-11-12 22:28:00', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `place`
--

CREATE TABLE `place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `place_description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `place_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `place_location` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `place_image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `place_display` int(11) NOT NULL,
  `place_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `place_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `place`
--

INSERT INTO `place` (`place_id`, `place_name`, `place_description`, `place_address`, `place_location`, `place_image`, `place_display`, `place_created_at`, `place_updated_at`, `id_user`, `id_zone`, `id_category`) VALUES
(1, 'Inkafarma', 'Farmacia donde venden a bueno precios', 'Frente al Mercdo Bolognessi', '0,0', '', 1, '2019-11-12 22:15:41', '2019-11-12 22:15:41', 7, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_avatar` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_premium` int(11) NOT NULL,
  `user_status` int(11) NOT NULL,
  `user_token` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_password`, `user_avatar`, `user_premium`, `user_status`, `user_token`, `user_created_at`, `user_updated_at`) VALUES
(7, 'Milan', 'Gotera', 'milangotera@gmail.com', 'roko2090', NULL, 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo3LCJ1c2VyX2ZpcnN0bmFtZSI6Ik1pbGFuIiwidXNlcl9sYXN0bmFtZSI6IkdvdGVyYSIsInVzZXJfZW1haWwiOiJtaWxhbmdvdGVyYUBnbWFpbC5jb20iLCJ1c2VyX2F2YXRhciI6bnVsbCwidXNlcl9wcmVtaXVtIjowLCJ1c2VyX3N0YXR1cyI6MCwiaWF0IjoxNTczNjU4OTg3LCJleHAiOjE1NzM3NDUzODd9.sF8IE_a_bmbpNh8fb_DZF5kwOYkEghCJAFnjjKx56GY', '2019-11-12 21:00:34', '2019-11-13 10:29:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zone`
--

CREATE TABLE `zone` (
  `zone_id` int(11) NOT NULL,
  `zone_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zone_postcode` int(11) NOT NULL,
  `zone_location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zone_type` int(11) DEFAULT NULL,
  `zone_parent` int(11) DEFAULT NULL,
  `zone_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `zone_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zone`
--

INSERT INTO `zone` (`zone_id`, `zone_name`, `zone_postcode`, `zone_location`, `zone_type`, `zone_parent`, `zone_created_at`, `zone_updated_at`) VALUES
(1, 'Tacna', 23000, NULL, 3, NULL, '2019-11-12 22:12:51', '2019-11-12 22:12:51');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_id_UNIQUE` (`category_id`),
  ADD UNIQUE KEY `category_name_UNIQUE` (`category_name`);

--
-- Indices de la tabla `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD UNIQUE KEY `commentary_id_UNIQUE` (`comment_id`),
  ADD KEY `fk_comment_place` (`place_id`),
  ADD KEY `fk_comment_user` (`user_id`);

--
-- Indices de la tabla `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`place_id`),
  ADD UNIQUE KEY `place_id_UNIQUE` (`place_id`),
  ADD KEY `fk_place_user` (`id_user`),
  ADD KEY `fk_place_zone` (`id_zone`),
  ADD KEY `fk_place_category` (`id_category`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `user_email_UNIQUE` (`user_email`);

--
-- Indices de la tabla `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_id`),
  ADD UNIQUE KEY `zone_id_UNIQUE` (`zone_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `place`
--
ALTER TABLE `place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `zone`
--
ALTER TABLE `zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_place` FOREIGN KEY (`place_id`) REFERENCES `place` (`place_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `fk_place_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_place_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_place_zone` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`zone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
