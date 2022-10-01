-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2022 a las 10:17:08
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `minzon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(128) NOT NULL,
  `apellidos` varchar(128) NOT NULL,
  `correo` varchar(128) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `rol` int(1) NOT NULL,
  `archivo_n` varchar(255) NOT NULL,
  `archivo` varchar(128) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `eliminado` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `nombre`, `apellidos`, `correo`, `pass`, `rol`, `archivo_n`, `archivo`, `status`, `eliminado`) VALUES
(12, 'Edson', 'Ortega', 'repulser@gmail.com', '7ad9acf65f34ecdf546743020e84fb5c', 2, '7538ab17d0676e3829a6131f09586b2c', 'login.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(128) NOT NULL,
  `apellidos` varchar(128) NOT NULL,
  `correo` varchar(128) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `eliminado` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellidos`, `correo`, `pass`, `status`, `eliminado`) VALUES
(1, 'Invitado', '', '', '', 1, 0),
(10, 'Edson ', 'Ortega', 'edson.ortega9301@alumnos.udg.mx', '7ad9acf65f34ecdf546743020e84fb5c', 1, 0),
(11, 'Isaac', 'Berumen', 'isaac@gmail.com', '7ad9acf65f34ecdf546743020e84fb5c', 1, 0),
(12, 'Irma', 'Berumen', 'irma@gmail.com', '6f7ffa2e09bdf776c3f539c069c67bbe', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `calle` text NOT NULL,
  `colonia` text NOT NULL,
  `CP` int(11) NOT NULL,
  `ciudad` text NOT NULL,
  `estado` text NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `numero_calle` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `observaciones` text NOT NULL,
  `paqueteria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `user_id`, `tipo`, `calle`, `colonia`, `CP`, `ciudad`, `estado`, `nombre`, `apellidos`, `numero_calle`, `email`, `telefono`, `observaciones`, `paqueteria`) VALUES
(21, 12, 'domicilio', 'Misión San Diego', 'Plaza Guadalupe', 45030, 'Zapopan', 'Jalisco', 'Irma Isela', 'Berumen Vilchis', '386', 'irma@gmail.com', '12345678', 'Casa blanca', 'UPS'),
(22, 12, 'domicilio', 'Misión San Diego', 'Plaza Guadalupe', 45030, 'Zapopan', 'Jalisco', 'Edson', 'Ortega', '386', 'edson@gmail.com', '12345678', '', 'DHL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `domicilio` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `paqueteria` text NOT NULL,
  `entregado` tinyint(1) NOT NULL,
  `fecha_embarque` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `entrega_estimada` date NOT NULL,
  `numero_rastreo` int(11) NOT NULL,
  `id_transaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id`, `user_id`, `tipo`, `domicilio`, `estado`, `paqueteria`, `entregado`, `fecha_embarque`, `fecha_entrega`, `entrega_estimada`, `numero_rastreo`, `id_transaccion`) VALUES
(15, 12, 'domicilio', 21, 'Entregado', 'UPS', 0, '0000-00-00', '0000-00-00', '0000-00-00', 0, 7),
(16, 12, 'domicilio', 22, 'Entregado', 'DHL', 0, '0000-00-00', '0000-00-00', '0000-00-00', 0, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `usuario` varchar(32) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `metodo_pago` varchar(30) NOT NULL,
  `id_transaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha`, `usuario`, `status`, `metodo_pago`, `id_transaccion`) VALUES
(17, '2022-09-30', '12', 1, 'tarjeta', 7),
(18, '2022-10-01', '12', 1, 'tarjeta', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos`
--

CREATE TABLE `pedidos_productos` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos_productos`
--

INSERT INTO `pedidos_productos` (`id`, `id_pedido`, `id_producto`, `cantidad`) VALUES
(40, 17, 42, 1),
(41, 18, 43, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(128) NOT NULL,
  `Autor` varchar(200) NOT NULL,
  `codigo` varchar(32) NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `costo` double NOT NULL,
  `stock` int(11) NOT NULL,
  `archivo_n` varchar(225) NOT NULL,
  `archivo` varchar(128) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `eliminado` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `Autor`, `codigo`, `descripcion`, `costo`, `stock`, `archivo_n`, `archivo`, `status`, `eliminado`) VALUES
(42, 'Libro Troll Rubius', 'ElRubiusOMG', 'ELT12', 'Tu vida es un libro a medio construir, una aventura espontánea, un juego a veces provocador, pero siempre extraordinario. elrubius, un auténtico fenómeno de YouTube, está dispuesto a acompañarte en una experiencia que recoge tus momentos más gloriosos. .', 225, 14, '47086b7d63f0ecb8d88d5c016b2da069', 'Librotroll.jpg', 1, 0),
(43, 'El Arte de la seducción', 'Robert Greene', 'EADLS', 'Veinticuatro maniobras guiarán a los lectores por el proceso de seducción, proporcionando instrucciones astutas y amorales, y un análisis de esta dominante forma de poder. Una obra indispensable sobre la persuasión que ofrece las mejores lecciones sobre cómo obtener lo que queremos de los demás.', 296, 24, 'ca6c0e1ec3dd6f2cad75ffc250bf33d2', 'ArteSeduccion.jpg', 1, 0),
(44, 'Padre Rico Padre Pobre', 'Robert T. Kiyosaki', 'PRPP', 'Padre rico, padre pobre es una lectura necesaria si quieres aprender sobre finanzas personales y educación financiera. Este bestseller ha ayudado a la mayoría de la gente a entender cuáles son sus malos hábitos financieros, cómo cambiarlos, saber cómo invertir y tener una mejor comprensión de los mercados.', 300, 30, 'e1e9f570ab73b420c8da51fa82a359c2', 'padreRico.jpg', 1, 0),
(45, 'El arte de la guerra', 'Sun Tzu', 'EADLG', 'La obra del general Sun Tzu no es solo un libro de militar, sino un tratado que enseña la estrategia aplicada con sabiduría a la naturaleza humana en los momentos de conflicto. Es decir; una obra para comprender las raíces de un conflicto y buscar una solución.', 250, 12, 'b4027d5c53387d4f29ea2c28a3adc4da', 'ArteGuerra.jpg', 1, 0),
(46, 'Dopamina', ' Daniel Z. Lieberman', 'DPMA', 'Sinopsis de Dopamina: Una historia de placer y euforia, amor y adicciones, locura y creatividad a través del prisma de la molécula que domina el mundo. ¿Por qué nos obsesionamos con las cosas que queremos y nos aburrimos cuando las conseguimos? ¿Por qué la adicción no es una cuestión moral?', 360, 5, '10dbfb568d0d26cc003595bd4643e3b0', 'dopamina.jpg', 1, 0),
(47, 'Orgullo y prejuicio', 'Jane Austen', 'OYP', 'Orgullo y prejuicio narra las aventuras y desventuras amorosas de las hermanas Bennet, centrándose en el personaje de Elizabeth, a través de las cuales la autora nos presenta con comicidad la sociedad de su tiempo y coloca a la mujer en un lugar más notorio que el que le correspondía en su época con la figura de la protagonista.', 400, 10, '4e610514754c41ff3d77ca1e6421c4ee', 'orgullo.jpg', 1, 0),
(48, 'Viaje al centro de la Tierra', 'Jules Verne', 'VACDLT', 'Viaje al centro de la Tierra es una novela de Julio Verne, publicada el 25 de noviembre de 1864; la cual trata de la expedición de un profesor de mineralogía, Otto Lidenbrock, su sobrino Axel y un guía llamado Hans al interior de la Tierra.', 170, 30, 'd2e4dadc69e6d956dc2077968e1672cb', 'viaje.jpg', 1, 0),
(49, 'Lugares asombrosos', 'Luisito Comunica', 'LA', 'Luisito Comunica viaja de un extremo a otro del planeta. La curiosidad es el motor de las aventuras que lo lanzan hasta los terrenos más inhóspitos y misteriosos. ', 238, 15, '04bd43e1c1a18d2ced30154e2be93ec5', 'asombrosos.jpg', 1, 0),
(50, 'Wigetta', 'Willyrex y Vegetta777', 'WG', 'Para Willy y Vegetta, una invasión zombi que fulmina el sitio en el que vives es solo el principio de una gran aventura. Viajes a las profundidades, intensos duelos al amanecer, misteriosas brujas y temibles gigantes...', 150, 4, '7033d407bef51f466da78d62d7d5cd53', 'wigetta.jpg', 1, 0),
(51, 'One Piece Vol. 1', 'Eiichir? Oda', 'OP1', 'Esta es la gran Era Pirata. Gold Roger, el legendario “Rey de los piratas” ha dejado el “One Piece” - su legendario Tesoro - escondido en una zona del mundo llamada “GRAND LINE” y los piratas más fuertes compiten por hallarlo. ', 150, 30, '4e17c346e11a1b0feac3ab49d9ac2975', 'OP.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `id` int(11) NOT NULL,
  `metodo` varchar(50) NOT NULL,
  `cantidad` float NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`id`, `metodo`, `cantidad`, `fecha`) VALUES
(7, 'tarjeta', 225, '2022-09-30'),
(8, 'tarjeta', 296, '2022-10-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
