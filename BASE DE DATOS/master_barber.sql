-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2024 a las 02:40:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `master_barber`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--
-- Creación: 29-05-2024 a las 20:48:32
--

CREATE TABLE `carrito_compras` (
  `id_carrito_compras` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--
-- Creación: 29-05-2024 a las 20:22:57
--

CREATE TABLE `categoria_producto` (
  `id_categoria_producto` int(11) NOT NULL,
  `Categoria` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--
-- Creación: 29-05-2024 a las 20:41:55
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `Precio_Total` int(250) NOT NULL,
  `Tipo_Pago` varchar(250) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--
-- Creación: 29-05-2024 a las 21:06:54
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `Fecha` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--
-- Creación: 29-05-2024 a las 21:22:14
--

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL,
  `Fecha_Hora` datetime(6) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--
-- Creación: 29-05-2024 a las 20:13:10
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `Cantidad` int(250) NOT NULL,
  `id_categoria_producto` int(11) NOT NULL,
  `Precio` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorio`
--
-- Creación: 29-05-2024 a las 21:18:12
--

CREATE TABLE `recordatorio` (
  `id_recordatorio` int(11) NOT NULL,
  `Mensaje` varchar(250) NOT NULL,
  `id_ReservaTurno` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_turno`
--
-- Creación: 29-05-2024 a las 20:05:44
--

CREATE TABLE `reserva_turno` (
  `id_ReservaTurno` int(11) NOT NULL,
  `id_TipoServicio` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `aceptar_turno` tinyint(4) NOT NULL,
  `cancelar_turno` tinyint(4) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--
-- Creación: 29-05-2024 a las 19:34:54
-- Última actualización: 29-05-2024 a las 20:14:30
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `Nombre_rol` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `Nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Barbero'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--
-- Creación: 29-05-2024 a las 22:19:28
--

CREATE TABLE `tipo_servicio` (
  `id_TipoServicio` int(11) NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `Precio` int(250) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 29-05-2024 a las 19:44:12
-- Última actualización: 29-05-2024 a las 19:55:08
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `Nombre_usuario` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Nit` int(10) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `Contraseña` varchar(250) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `Nombre_usuario`, `Email`, `Nit`, `Telefono`, `Contraseña`, `id_rol`) VALUES
(1, 'David Vaiss', 'cristianrueda0313@gmail.com', 1014481682, 3044495505, '1234567cristian.', 1),
(3, 'Fidel ', 'fideljoseespi10@gmail.com', 1234567891, 302202022, '1234567fidel.', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`id_carrito_compras`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_compra` (`id_compra`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id_categoria_producto`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria_producto` (`id_categoria_producto`);

--
-- Indices de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD PRIMARY KEY (`id_recordatorio`),
  ADD KEY `id_recordatorio` (`id_recordatorio`,`id_ReservaTurno`),
  ADD KEY `id_horario` (`id_horario`),
  ADD KEY `id_ReservaTurno` (`id_ReservaTurno`);

--
-- Indices de la tabla `reserva_turno`
--
ALTER TABLE `reserva_turno`
  ADD PRIMARY KEY (`id_ReservaTurno`),
  ADD KEY `id_TipoServicio` (`id_TipoServicio`),
  ADD KEY `id_horario` (`id_horario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id_TipoServicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  MODIFY `id_carrito_compras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id_categoria_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  MODIFY `id_recordatorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reserva_turno`
--
ALTER TABLE `reserva_turno`
  MODIFY `id_ReservaTurno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id_TipoServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD CONSTRAINT `carrito_compras_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `carrito_compras_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `carrito_compras_ibfk_3` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categoria_producto` (`id_categoria_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD CONSTRAINT `recordatorio_ibfk_1` FOREIGN KEY (`id_ReservaTurno`) REFERENCES `reserva_turno` (`id_ReservaTurno`),
  ADD CONSTRAINT `recordatorio_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`);

--
-- Filtros para la tabla `reserva_turno`
--
ALTER TABLE `reserva_turno`
  ADD CONSTRAINT `reserva_turno_ibfk_1` FOREIGN KEY (`id_TipoServicio`) REFERENCES `tipo_servicio` (`id_TipoServicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_turno_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_turno_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
