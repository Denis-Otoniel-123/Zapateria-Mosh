-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2024 a las 07:05:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pymeurban`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `compra_detalle` (IN `idprima` INT(10), IN `cantidad` INT(11), IN `precio` DECIMAL(10,2), IN `descuento` DECIMAL(11,2), IN `subtotal` DECIMAL(20,2), IN `estado` VARCHAR(30))   BEGIN

INSERT INTO detalle_compra(idcompra,idprima,cantidad,precio,descuento,subtotal,estado)
values((SELECT MAX(id) from compra),idprima,cantidad,precio,descuento,subtotal,estado);
SELECT MAX(id) from venta;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `compra_insert` (IN `idproveedor` INT(10), IN `tipo_comprobante` VARCHAR(20), IN `serie_comprobante` VARCHAR(7), IN `num_comprobante` VARCHAR(10), IN `fecha_hora` VARCHAR(50), IN `total` DECIMAL(11,2), IN `estado` VARCHAR(30))   BEGIN
INSERT INTO compra(idproveedor,tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,total,estado)
values(idproveedor,tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,total,estado);
COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertproveedor` (IN `nombre` VARCHAR(100), IN `tipo_documento` VARCHAR(20), IN `num_documento` VARCHAR(20), IN `direccion` VARCHAR(70), IN `telefono` VARCHAR(20), IN `email` VARCHAR(50), IN `contacto` VARCHAR(50), IN `telefono_contacto` VARCHAR(50))   BEGIN

INSERT INTO persona(nombre,tipo_documento,num_documento,direccion,telefono,email)values(nombre,tipo_documento,num_documento,direccion,telefono,email);

INSERT INTO proveedor(idpersona,contacto,telefono_contacto)values(last_insert_id(),contacto,telefono_contacto);
SELECT MAX(id) from persona;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `venta_detalle` (IN `idproducto` INT(10), IN `cantidad` INT(11), IN `precio` DECIMAL(10,2), IN `descuento` DECIMAL(11,2), IN `subtotal` DECIMAL(20,2), IN `estado` VARCHAR(30))   BEGIN

INSERT INTO detalle_venta(idventa,idproducto,cantidad,precio,descuento,subtotal,estado)
values((SELECT MAX(id) from venta),idproducto,cantidad,precio,descuento,subtotal,estado);
SELECT MAX(id) from venta;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `venta_insertar` (IN `idcliente` INT(10), IN `tipo_comprobante` VARCHAR(20), IN `ruc` VARCHAR(50), IN `num_comprobante` VARCHAR(10), IN `fecha_hora` VARCHAR(50), IN `total` DECIMAL(11,2), IN `estado` VARCHAR(30))   BEGIN
INSERT INTO venta(idcliente,tipo_comprobante,ruc,num_comprobante,fecha_hora,total,estado)
values(idcliente,tipo_comprobante,ruc,num_comprobante,fecha_hora,total,estado);

  

COMMIT;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `estado`) VALUES
(20, 'Casual', 'Activo'),
(21, 'Depotivo', 'Activo'),
(22, 'Casual', 'Activo'),
(23, 'zapatos altos', 'Activo'),
(24, 'pool', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(10) UNSIGNED NOT NULL,
  `idproveedor` int(10) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(50) NOT NULL,
  `serie_comprobante` varchar(50) NOT NULL,
  `num_comprobante` varchar(50) NOT NULL,
  `fecha_hora` varchar(50) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcompra` int(10) UNSIGNED NOT NULL,
  `idprima` int(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Disparadores `detalle_compra`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockcompra` AFTER INSERT ON `detalle_compra` FOR EACH ROW BEGIN
 UPDATE prima SET stock = stock + NEW.cantidad 
 WHERE prima.id = NEW.idprima;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockcompraAnular` AFTER UPDATE ON `detalle_compra` FOR EACH ROW BEGIN
  UPDATE prima a
    JOIN detalle_compra di
      ON di.idprima = a.id
     AND di.estado ='Anulado'
     AND di.id =NEW.id
     set a.stock = a.stock - di.cantidad
;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso_produccion`
--

CREATE TABLE `detalle_ingreso_produccion` (
  `id` int(10) UNSIGNED NOT NULL,
  `idproducto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ingreso_produccion`
--

INSERT INTO `detalle_ingreso_produccion` (`id`, `idproducto`, `cantidad`, `fecha`, `estado`) VALUES
(12, 30, 10, '21/11/2018 - 08:39:24', 'Anulado'),
(13, 32, 40, '28/10/2024 - 06:08:56', 'Activo'),
(14, 32, 10, '28/10/2024 - 07:29:53', 'Activo'),
(15, 33, 10, '28/10/2024 - 08:31:28', 'Activo');

--
-- Disparadores `detalle_ingreso_produccion`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso_produccion` FOR EACH ROW BEGIN
 UPDATE producto SET stock = stock + NEW.cantidad 
 WHERE producto.id = NEW.idproducto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockIngresoAnular` AFTER UPDATE ON `detalle_ingreso_produccion` FOR EACH ROW BEGIN
  UPDATE producto a
    JOIN detalle_ingreso_produccion di
      ON di.idproducto = a.id
     AND di.estado ='Anulado'
     AND di.id =NEW.id
     set a.stock = a.stock - di.cantidad;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(10) UNSIGNED NOT NULL,
  `idventa` int(10) UNSIGNED NOT NULL,
  `idproducto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `subtotal` decimal(20,2) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `idventa`, `idproducto`, `cantidad`, `precio`, `descuento`, `subtotal`, `estado`) VALUES
(61, 26, 33, 10, 200.00, 0.00, 2000.00, 'Activo'),
(62, 27, 33, 10, 200.00, 0.00, 2000.00, 'Activo'),
(63, 28, 30, 10, 200.00, 0.00, 2000.00, 'Activo'),
(64, 29, 32, 10, 200.00, 0.00, 2000.00, 'Activo'),
(65, 30, 33, 10, 200.00, 0.00, 2000.00, 'Activo'),
(66, 31, 30, 10, 200.00, 0.00, 2000.00, 'Activo'),
(67, 32, 33, 10, 50.00, 10.00, 490.00, 'Activo'),
(68, 33, 34, 20, 57.00, 10.00, 1130.00, 'Activo'),
(69, 34, 37, 56, 20.00, 0.00, 1120.00, 'Activo'),
(70, 36, 32, 10, 100.00, 10.00, 990.00, 'Activo');

--
-- Disparadores `detalle_venta`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockventa` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
 UPDATE producto SET stock = stock - NEW.cantidad 
 WHERE producto.id = NEW.idproducto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockventaAnular` AFTER UPDATE ON `detalle_venta` FOR EACH ROW BEGIN
  UPDATE producto a
    JOIN detalle_venta di
      ON di.idproducto = a.id
     AND di.estado ='Anulado'
     AND di.id =NEW.id
     set a.stock = a.stock + di.cantidad
;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diseño`
--

CREATE TABLE `diseño` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `diseño`
--

INSERT INTO `diseño` (`id`, `nombre`, `estado`) VALUES
(1, 'Sandalias', 'Activo'),
(2, 'Botines de cuero', 'Activo'),
(3, 'Tenis casuales', 'Activo'),
(4, 'Formales', 'Activo'),
(5, 'Sandalias de charol', 'Activo'),
(8, 'Botines de mujer', 'Activo'),
(9, 'Deportivos', 'Activo'),
(10, 'tenis para caballero', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `sueldo` decimal(11,2) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `dni`, `sueldo`, `telefono`, `direccion`, `email`) VALUES
(1, 'angel', '878789', 1000.00, '987666 ', 'Z18 PARAISO 3CALLE 2AV 23-5', 'angel@gmail.com'),
(2, 'juan gnior', '09', 30000.00, '989  ', 'Z18 PARAISO 5 AV 2-51', 'ing@gmail.com'),
(3, 'juan', '98667899', 4000.00, '7654434  ', 'Z18 PARAISO 3CALLE 2AV 23-5', 'juan@gmail.com'),
(4, 'denis', '123456789', 300.00, '50105549', '3calle z18', 'dmoralesg15@miumg.edu.gt');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `estado`) VALUES
(1, 'ZAXY', 'Activo'),
(2, 'ADIDAS', 'Activo'),
(3, 'NIKE', 'Activo'),
(5, 'MD', 'Activo'),
(12, 'gucci', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdf`
--

CREATE TABLE `pdf` (
  `codigopdf` int(11) NOT NULL,
  `nombrepdf` varchar(50) NOT NULL,
  `archivopdf` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoprima`
--

CREATE TABLE `pedidoprima` (
  `id` int(10) NOT NULL,
  `idprima` int(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedidoprima`
--

INSERT INTO `pedidoprima` (`id`, `idprima`, `cantidad`, `fecha`, `descripcion`, `estado`) VALUES
(1, 1, 50, 'hoy', ' ', 'Activo'),
(2, 3, 0, '21/11/2018 - 02:12:42', 'PLANTILLAS', 'Anulado'),
(3, 4, 11, '21/11/2018 - 08:41:29', 'CUERO', 'Anulado'),
(4, 1, 36, '28/10/2024 - 05:51:09', 'LENGUETAS', 'Activo'),
(5, 1, 10, '28/10/2024 - 07:29:26', 'LENGUETAS', 'Activo'),
(6, 5, 50, '28/10/2024 - 08:30:41', 'sticker marca nike', 'Activo');

--
-- Disparadores `pedidoprima`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockPedido` AFTER INSERT ON `pedidoprima` FOR EACH ROW BEGIN
 UPDATE prima SET stock = stock - NEW.cantidad 
 WHERE prima.id = NEW.idprima;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockPedidoAnular` AFTER UPDATE ON `pedidoprima` FOR EACH ROW BEGIN
  UPDATE prima a
    JOIN pedidoprima di
      ON di.idprima = a.id
     AND di.estado ='Anulado'
     AND di.id =NEW.id
     set a.stock = a.stock + di.cantidad
;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(52, 'denis', 'DPI', '123456789', '3calle z20', '50105549', 'dmoralesg15@miumg.edu.gt'),
(53, 'JOSE', 'DPI', '30113587890101', '3calle z18', '12345678', 'JOSEPED15@GMAIL.COM'),
(72, 'OTTO', 'DPI', '3011653250101', '4AV.SECTOR LUZ ESPERANZA Z4 VILLA NUEVA', '55662332', 'OTTOMORALES8886@GMAIL.COM'),
(74, 'heriberto', 'DPI', '301123650101', 'z4 villa nueva', '12345688', 'heriberto44@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prima`
--

CREATE TABLE `prima` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `prima`
--

INSERT INTO `prima` (`id`, `nombre`, `precio`, `stock`, `descripcion`, `estado`) VALUES
(1, 'Lenguetas', 9.00, 40, '      ', 'Activo'),
(2, 'Suela', 5.00, 100, '  ', 'Activo'),
(3, 'plantillas', 14.00, 100, '      ', 'Activo'),
(4, 'Cuero', 15.00, 111, 'para cortes ', 'Activo'),
(5, 'sticker marca nike', 10.00, 50, 'sticker marca nike ', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcategoria` int(10) UNSIGNED NOT NULL,
  `idmarca` int(10) UNSIGNED NOT NULL,
  `iddiseño` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `talla` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `idcategoria`, `idmarca`, `iddiseño`, `nombre`, `precio_venta`, `stock`, `descripcion`, `estado`, `talla`) VALUES
(30, 20, 1, 4, 'MOCASINES', 85.00, 68, 'FORMALES NEGROS  ', 'Desactivado', '40'),
(32, 21, 2, 9, 'PREDATOR', 130.00, 80, 'Zapatos deportivos', 'Activo', '39'),
(33, 21, 3, 9, 'jordan', 200.00, 70, 'jordan altos ', 'Activo', '42'),
(34, 23, 3, 2, 'jovianos', 50.00, 130, 'botines', 'Activo', '30'),
(35, 21, 1, 3, 'jovianos', 50.00, 150, 'tenis', 'Activo', '41'),
(36, 20, 1, 1, 'jupos', 30.00, 50, 'sandalias', 'Activo', '39'),
(37, 23, 2, 4, 'jupos', 30.00, -6, 'sandalias', 'Desactivado', '38'),
(38, 23, 2, 4, 'jupos', 30.00, 50, 'sandalias', 'Activo', '39'),
(41, 23, 2, 4, 'jupos', 30.00, 50, 'sandalias ', 'Activo', '40'),
(42, 20, 1, 4, 'mocasines', 85.00, 68, 'mocasines ', 'Activo', '35'),
(43, 20, 3, 4, 'aoc', 100.00, 100, 'aoc  ', 'Activo', '50'),
(44, 24, 3, 3, 'aoc', 100.00, 100, 'aoc', 'Activo', '45'),
(45, 24, 3, 3, 'aoc', 100.00, 100, 'aoc  ', 'Activo', '45'),
(46, 20, 1, 1, 'mocasines', 500.00, 69, 'Zapatos deportivos', 'Activo', '40'),
(47, 20, 1, 1, 'mocasines', 500.00, 69, 'Zapatos deportivos', 'Activo', '40'),
(48, 20, 1, 1, 'mocasines', 500.00, 69, 'Zapatos deportivos', 'Activo', '40'),
(49, 21, 1, 3, 'mocasines', 500.00, 69, 'Zapatos deportivos', 'Activo', '40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idpersona` int(10) UNSIGNED NOT NULL,
  `contacto` varchar(50) NOT NULL,
  `telefono_contacto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idpersona`, `contacto`, `telefono_contacto`) VALUES
(72, 'null', '55662332'),
(74, 'null', '12345688');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) NOT NULL,
  `idempleado` int(10) NOT NULL,
  `usu` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `idempleado`, `usu`, `password`, `rol`) VALUES
(1, 1, 'angel', 'angel', 'Produccion'),
(3, 3, 'almacen', 'almacen', 'Almacen'),
(4, 2, 'venta', 'venta', 'Ventas'),
(6, 4, 'denis', 'denis', 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcliente` int(10) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `ruc` varchar(50) NOT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` varchar(50) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `idcliente`, `tipo_comprobante`, `ruc`, `num_comprobante`, `fecha_hora`, `total`, `estado`) VALUES
(24, 52, 'Boleta', '123456789', '000001', '28/10/2024 - 06:15:55', 0.00, 'Vendido'),
(25, 52, 'Factura', '123512', '000001', '28/10/2024 - 06:48:39', 0.00, 'Vendido'),
(26, 52, 'Factura', '13213545662252', '000002', '28/10/2024 - 08:35:32', 2240.00, 'Vendido'),
(27, 52, 'Factura', '13213545662252', '000003', '29/10/2024 - 05:46:18', 2240.00, 'Vendido'),
(28, 74, 'Factura', '13213545662252', '000004', '30/10/2024 - 05:37:33', 2240.00, 'Vendido'),
(29, 52, 'Factura', '13213545662252', '000005', '30/10/2024 - 05:47:04', 2240.00, 'Vendido'),
(30, 53, 'Boleta', '13213545662252', '000002', '30/10/2024 - 05:51:39', 2240.00, 'Vendido'),
(31, 53, 'Boleta', '13213545662252', '000003', '30/10/2024 - 05:54:47', 2240.00, 'Vendido'),
(32, 52, 'Boleta', '13213545662252', '000004', '30/10/2024 - 09:20:34', 548.80, 'Vendido'),
(33, 53, 'Boleta', '13213545662252', '000005', '30/10/2024 - 09:21:24', 1265.60, 'Vendido'),
(34, 53, 'Boleta', '10215', '000006', '30/10/2024 - 09:28:12', 1254.40, 'Vendido'),
(35, 53, 'Boleta', '13213545662252', '000007', '30/10/2024 - 10:41:05', 0.00, 'Vendido'),
(36, 53, 'Factura', '13213545662252', '000006', '30/10/2024 - 10:41:34', 0.00, 'Vendido');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcompra` (`idcompra`),
  ADD KEY `idprima` (`idprima`);

--
-- Indices de la tabla `detalle_ingreso_produccion`
--
ALTER TABLE `detalle_ingreso_produccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ingresos_idarticulo_foreign` (`idproducto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ventas_idventa_foreign` (`idventa`),
  ADD KEY `detalle_ventas_idarticulo_foreign` (`idproducto`);

--
-- Indices de la tabla `diseño`
--
ALTER TABLE `diseño`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pdf`
--
ALTER TABLE `pdf`
  ADD PRIMARY KEY (`codigopdf`);

--
-- Indices de la tabla `pedidoprima`
--
ALTER TABLE `pedidoprima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idprima` (`idprima`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prima`
--
ALTER TABLE `prima`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulos_idcategoria_foreign` (`idcategoria`),
  ADD KEY `idmarca` (`idmarca`),
  ADD KEY `iddiseño` (`iddiseño`) USING BTREE;

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `idpersona` (`idpersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idempleado` (`idempleado`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_idcliente_foreign` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso_produccion`
--
ALTER TABLE `detalle_ingreso_produccion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `diseño`
--
ALTER TABLE `diseño`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedidoprima`
--
ALTER TABLE `pedidoprima`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `prima`
--
ALTER TABLE `prima`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idpersona`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`idprima`) REFERENCES `prima` (`id`);

--
-- Filtros para la tabla `detalle_ingreso_produccion`
--
ALTER TABLE `detalle_ingreso_produccion`
  ADD CONSTRAINT `detalle_ingresos_idarticulo_foreign` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_ventas_idarticulo_foreign` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `detalle_ventas_idventa_foreign` FOREIGN KEY (`idventa`) REFERENCES `venta` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidoprima`
--
ALTER TABLE `pedidoprima`
  ADD CONSTRAINT `pedidoprima_ibfk_1` FOREIGN KEY (`idprima`) REFERENCES `prima` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`iddiseño`) REFERENCES `diseño` (`id`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`id`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `ventas_idcliente_foreign` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
