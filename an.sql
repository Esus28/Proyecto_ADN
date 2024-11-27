-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2024 a las 03:55:23
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `an`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `ubicacion` varchar(250) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(5) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellidos`, `telefono`, `correo`, `ubicacion`, `municipio`, `codigo_postal`, `vendedor_id`) VALUES
(2, 'EVELINA', 'MARTINEZ TENORIO', '7223832941', 'evelinamartinez8@gmail.com', 'Carrera El Oro- Villa Victoria Frente a Pista de Canotaje, 50960 Villa Victoria, Méx.', 'Villa Victoria', '50960', 3),
(3, 'VEGETALES JAZMINEZ', NULL, '3232829989', 'compras.vegetalesjazminez@gmail.com', '21°40\'40.3\"N 105°12\'34.0\"W', 'Santiago Ixcuintla', '63570', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL,
  `cumpli_rutas` varchar(200) DEFAULT NULL,
  `cumpli_costos` varchar(200) DEFAULT NULL,
  `cumpli_tiempos` varchar(200) DEFAULT NULL,
  `mapa` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos`
--

CREATE TABLE `costos` (
  `id_costo` int(11) NOT NULL,
  `prec_gasolina` varchar(10) DEFAULT NULL,
  `prec_caseta` varchar(10) DEFAULT NULL,
  `lugar_salida` varchar(255) DEFAULT NULL,
  `lugar_llegada` varchar(255) DEFAULT NULL,
  `distancia` varchar(100) DEFAULT NULL,
  `tiempo` varchar(12) DEFAULT NULL,
  `total_costo` varchar(20) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora_inicio` varchar(20) DEFAULT NULL,
  `hora_fin` varchar(20) DEFAULT NULL,
  `repartidor_id` int(11) DEFAULT NULL,
  `vehiculo_id` int(11) DEFAULT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `costo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidores`
--

CREATE TABLE `repartidores` (
  `id_repartidor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `no_licencia` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repartidores`
--

INSERT INTO `repartidores` (`id_repartidor`, `nombre`, `apellidos`, `no_licencia`, `telefono`, `foto`) VALUES
(1, 'GUSTAVO', 'GONZALEZ TREJO', 'A6661521', '7122147579', 'static/fotos_repartidores/Gustavo.jpeg'),
(2, 'JOSE LUIS', 'ENRIQUEZ CASTRO ', '414613', '7121595986', 'static/fotos_repartidores/Luis.jpeg'),
(4, 'IGNACIO', 'AYALA ', '90000189540', '7224801906', 'static/fotos_repartidores/Ignacio.jpeg'),
(5, 'GUSTAVO', 'ALLENDE TREJO ', 'BH6554', '7224801916', 'static/fotos_repartidores/gustavoo.jpeg'),
(6, 'JUAN CARLOS', 'PICAZZO MARTINEZ ', 'BF6421', '5510023937', 'static/fotos_repartidores/Picazzo.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id_ruta` int(11) NOT NULL,
  `num_ruta` varchar(10) DEFAULT NULL,
  `grupos_rutas` varchar(100) DEFAULT NULL,
  `tiempo_est` varchar(100) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `rol`, `password`) VALUES
(1, 'administrador', 'admin', 'agro_admin'),
(2, 'subadmin', 'usuario ', 'agro_sub');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_vehiculo` int(11) NOT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `placas` varchar(20) DEFAULT NULL,
  `ultimo_servicio` date DEFAULT NULL,
  `prox_verifi` date DEFAULT NULL,
  `ultima_tenencia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `modelo`, `placas`, `ultimo_servicio`, `prox_verifi`, `ultima_tenencia`) VALUES
(1, 'NISSAN ', 'LF-08-560', '2024-09-13', '2024-12-20', '2025-02-25'),
(2, 'NISSAN DIESEL ', 'LC-62-125', '2024-09-09', '2024-12-20', '2025-02-25'),
(3, 'CADDY VAN ', 'LG-28-779', '2024-07-09', '2024-12-20', '2025-02-25'),
(4, 'FRONTIER NARANJA ', 'PAW-931-A', '2024-07-01', '2024-12-20', '2025-02-25'),
(5, 'FORD F350', 'LF-00-690', '0000-00-00', '2024-12-20', '2025-02-25'),
(6, 'TRANSPORTER CARGA', 'JY-53-705', '2024-01-12', '2025-01-12', '2025-02-25'),
(7, 'HYUNDAI HD 120', '76-AJ-7B', '2024-02-10', '2024-12-20', '2025-02-25'),
(8, 'HYUNDAI CAMIONCITO', '75-AJ-7B', '2024-02-01', '2024-12-20', '2025-02-25'),
(9, 'NISSAN ', 'LG-03-359', '2024-09-01', '2024-12-20', '2025-02-25'),
(10, 'HILUX ', 'LF-08-578', '2024-03-01', '2024-12-20', '2025-02-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `id_vendedor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id_vendedor`, `nombre`, `apellidos`, `telefono`, `foto`) VALUES
(1, 'GUSTAVO', 'ALLENDE TREJO', '7224801916', 'static/fotos_vendedores/Gustavo.jpeg'),
(2, 'JUAN CARLOS', 'PICAZZO MARTINEZ ', '5510023937', 'static/fotos_vendedores/Picazzo.jpeg'),
(3, 'IGNACIO', 'AYALA', '7224801906', 'static/fotos_vendedores/Ignacio.jpeg'),
(4, 'ARIANA', 'CENTENO', '7121331392', 'static/fotos_vendedores/Ignacio.jpeg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `costos`
--
ALTER TABLE `costos`
  ADD PRIMARY KEY (`id_costo`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `repartidor_id` (`repartidor_id`),
  ADD KEY `vehiculo_id` (`vehiculo_id`),
  ADD KEY `ruta_id` (`ruta_id`),
  ADD KEY `costo_id` (`costo_id`);

--
-- Indices de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  ADD PRIMARY KEY (`id_repartidor`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id_ruta`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `costos`
--
ALTER TABLE `costos`
  MODIFY `id_costo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  MODIFY `id_repartidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`id_vendedor`);

--
-- Filtros para la tabla `costos`
--
ALTER TABLE `costos`
  ADD CONSTRAINT `costos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`repartidor_id`) REFERENCES `repartidores` (`id_repartidor`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`ruta_id`) REFERENCES `rutas` (`id_ruta`),
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`costo_id`) REFERENCES `costos` (`id_costo`);

--
-- Filtros para la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `rutas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
