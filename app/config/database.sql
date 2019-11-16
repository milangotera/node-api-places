-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-11-2019 a las 00:32:47
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
  `category_icon` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `category_display` int(11) NOT NULL,
  `category_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_icon`, `category_display`, `category_created_at`, `category_updated_at`) VALUES
(1, 'HOTELES', 'category/1.png', 1, '2019-11-12 22:09:12', '2019-11-15 14:08:39'),
(2, 'FARMACIAS', 'category/2.png', 1, '2019-11-12 22:09:12', '2019-11-15 14:08:45'),
(3, 'HOSPITALES', 'category/3.png', 1, '2019-11-14 16:01:33', '2019-11-15 14:08:50'),
(4, 'SUPER MERCADO', 'category/4.png', 1, '2019-11-14 16:01:33', '2019-11-15 14:08:56'),
(5, 'PARQUES', 'category/5.png', 1, '2019-11-14 16:02:07', '2019-11-15 14:09:01'),
(6, 'CANCHAS', 'category/6.png', 1, '2019-11-14 16:02:07', '2019-11-15 14:09:05'),
(7, 'PISCINAS', 'category/7.png', 1, '2019-11-14 16:02:33', '2019-11-15 14:09:11'),
(8, 'PLAZAS', 'category/8.png', 1, '2019-11-14 16:02:33', '2019-11-15 14:09:16'),
(9, 'RESTAURANTES', 'category/9.png', 1, '2019-11-14 16:13:22', '2019-11-15 14:09:22'),
(10, 'BARES', 'category/10.png', 1, '2019-11-14 16:13:33', '2019-11-15 14:09:28'),
(11, 'GRIFOS', 'category/11.png', 1, '2019-11-14 16:14:03', '2019-11-15 14:09:37'),
(12, 'ESTACIONAMIENTOS', 'category/12.png', 1, '2019-11-14 16:14:31', '2019-11-15 14:09:43'),
(13, 'DISCOTECAS', 'category/13.png', 1, '2019-11-14 16:15:25', '2019-11-15 14:09:47'),
(14, 'CENTROS COMERCIALES', 'category/14.png', 1, '2019-11-14 16:15:56', '2019-11-15 14:09:52'),
(15, 'IGLESIAS', 'category/15.png', 1, '2019-11-14 16:16:32', '2019-11-15 14:09:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_content` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `comment_vote` int(11) NOT NULL,
  `comment_display` int(11) NOT NULL,
  `comment_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `place_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_content`, `comment_vote`, `comment_display`, `comment_created_at`, `comment_updated_at`, `place_id`, `user_id`) VALUES
(1, 'Me gusta mucho porque es bastante económico', 1, 1, '2019-11-12 22:28:00', '2019-11-14 13:26:48', 1, 7),
(2, 'El campo comentario es requerido', 0, 1, '2019-11-14 13:13:51', '2019-11-14 13:13:51', 1, 7),
(3, 'El campo comentario es requerido', 1, 1, '2019-11-14 13:29:12', '2019-11-14 13:29:12', 1, 7);

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
  `user_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `place`
--

INSERT INTO `place` (`place_id`, `place_name`, `place_description`, `place_address`, `place_location`, `place_image`, `place_display`, `place_created_at`, `place_updated_at`, `user_id`, `zone_id`, `category_id`) VALUES
(1, 'Inkafarma', 'Farmacia donde venden a bueno precios', 'Frente al Mercdo Bolognessi', '0,0', 'place/0.png', 1, '2019-11-12 22:15:41', '2019-11-15 14:24:13', 7, 1, 2);

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
  `user_role` int(11) NOT NULL DEFAULT '0',
  `user_status` int(11) NOT NULL,
  `user_token` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_password`, `user_avatar`, `user_premium`, `user_role`, `user_status`, `user_token`, `user_created_at`, `user_updated_at`) VALUES
(7, 'Thiago', 'Gotera', 'milangotera@gmail.com', 'roko2090', 'avatar/7.png', 0, 1, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo3LCJ1c2VyX2ZpcnN0bmFtZSI6IlRoaWFnbyIsInVzZXJfbGFzdG5hbWUiOiJHb3RlcmEiLCJ1c2VyX2VtYWlsIjoibWlsYW5nb3RlcmFAZ21haWwuY29tIiwidXNlcl9hdmF0YXIiOiJhdmF0YXIvNy5wbmciLCJ1c2VyX3JvbGUiOjEsInVzZXJfcHJlbWl1bSI6MCwidXNlcl9zdGF0dXMiOjAsImlhdCI6MTU3Mzg2NDE0NiwiZXhwIjoxNTczOTUwNTQ2fQ.u9VdwetnoMatBVoPtwZe-s-pwAbQ2s4g5NhkWYake4w', '2019-11-12 21:00:34', '2019-11-15 19:29:06');

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
(1, 'Tacna', 23000, '0,0', 1, NULL, '2019-11-12 22:12:51', '2019-11-15 19:06:06'),
(2, 'Jorge Basadre', 23000, '0,0', 1, NULL, '2019-11-15 11:59:15', '2019-11-15 11:59:15'),
(3, 'Candarave', 23000, '0,0', 1, NULL, '2019-11-15 11:59:15', '2019-11-15 11:59:15'),
(4, 'Tarata', 23000, '0,0', 1, NULL, '2019-11-15 11:59:15', '2019-11-15 11:59:15');

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
  ADD KEY `fk_place_user` (`user_id`),
  ADD KEY `fk_place_zone` (`zone_id`),
  ADD KEY `fk_place_category` (`category_id`);

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
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `fk_place_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_place_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_place_zone` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`zone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
