-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2025 a las 18:33:10
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
  `clave` int(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(5) DEFAULT NULL,
  `clasificacion` varchar(250) NOT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `tipo_entrega` varchar(50) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `clave`, `nombre`, `apellidos`, `telefono`, `correo`, `municipio`, `codigo_postal`, `clasificacion`, `vendedor_id`, `tipo_entrega`, `latitud`, `longitud`) VALUES
(8, 773, 'HUERTA ', 'AGRO JAGUAR', '53742269', 'felitz@hotmail.com', 'MORELOS', '50567', 'PRO', 7, 'Directa', 19.713944, -99.637389),
(9, 1142, 'MAYRA', 'BARRANCO BARRANCO', '712226438', 'ejemplo@gmail.com', 'IXTLAHUACA', '50740', 'DLS', 9, 'Directa', 19.575194, -99.790472),
(10, 1082, 'EVELINA', 'MARTINEZ TENORIO', '722383294', 'evelinamartinez8@gmail.com', 'VILLA VICTORIA ', '50960', 'DLS', 7, 'Directa', 19.4583539, -100.0546843),
(11, 107, 'FERNANDO', 'CARMONA GARDUÑO', '2214110047', 'fer230594fercar@hotmail.com', 'CALIMAYA', '52234', 'DLS', 13, 'Directa', 19.185917, -99.655694),
(12, 133, 'RICARDO', 'GARCIA MARTINEZ', '2292274884', 'ejemplo@gmail.com', 'JIQUIPILCO', '50800', 'DLS', 9, 'Directa', 19.644917, -99.741583),
(13, 1372, 'VEGETALES', 'JAZMINEZ', '3232829989', 'compras.vegetalesjazminez@gmail.com', 'Santiago Ixcuintla', '63570', 'ELIT', 15, 'Directa', 21.677861, -105.209444),
(14, 19, 'HORTALIZAS', 'LAS ORQUIDEAS', '3232829989', 'facturacion.agroverdi@gmail.com', 'DOLORES HIDALGO', '63570', 'ELIT', 15, 'Directa', 21.269667, -100.858528),
(15, 25, 'HORTALIZAS', 'AAA', '3232829989', 'compras.vegetalesjazminez@gmail.com', 'SANTIAGO IXCUINTLA', '63550', 'ELIT', 15, 'Directa', 21.677861, -105.209444),
(16, 226, 'GELASIO', 'MARQUEZ', '4141149301', 'ejemplo@gmail.com', 'San Gabriel', '49700', 'DLS', 9, 'Directa', 20.543972, -99.684861),
(17, 431, 'FRANCISCO', 'GARCIA RAMIREZ', '4171020218', 'tecparaelcampo@hotmail.com', 'TARANDACUAO', '38790', 'DLS', 9, 'Directa', 20.0041961, -100.5215238),
(18, 321, 'M. CARMEN', 'ARMENTA ORTIZ', '4171774768', 'carmenarmenta_ortiz@hotmail.com', 'TARANDACUAO', '38790', 'DLS', 9, 'Directa', 20.0132615, -100.537166),
(19, 8, 'VEGETALES', 'NUEVO AMANECER', '4182392042', 'facturacion.agroverdi@gmail.com', 'DOLORES HIDALGO', '37812', 'ELIT', 15, 'Directa', 21.276449, -100.863164),
(20, 340, 'AGROVERDI', '.', '4182392042', 'facturacion.agroverdi@gmail.com', 'DOLORES HIDALGO', '37814', 'ELIT', 15, 'Directa', 21.276449, -100.863164),
(21, 17, 'AGROTIERRA', 'DE GIRASOLES', '4182392042', 'facturacion.agroverdi@gmail.com', 'DOLORES HIDALGO', '37800', 'ELIT', 15, 'Directa', 21.276449, -100.863164),
(22, 14, 'AGROTIERRA', 'DE FUEGO', '4182392042', 'facturacion.agroverdi@gmail.com', 'DOLORES HIDALGO', '37823', 'ELIT', 15, 'Directa', 21.276449, -100.863164),
(23, 1235, 'TECNOLOGIA INTEGRADA', 'PARA PRODUCTOS AGRO ALIMENTARIOS', '4191143637', 'gerenciacompras@tippagro.com', 'Colón', '76280', 'DLS', 8, 'Directa', 20.694639, -100.005694),
(24, 176, 'GUILLERMO', 'FERRO SALINAS', '4214624048', 'ejemplo@gmail.com', 'CORONEO', '38590', 'DLS', 9, 'Directa', 20.201325, -100.365317),
(25, 657, 'ISAAC', 'PADILLA GUERRERO', '4271036023', 'ejemplo@gmail.com', 'POLOTITLAN', '54200', 'DLS', 9, 'Directa', 20.2262031, -99.8193596),
(26, 212, 'VICTOR', 'CHAPARRO ALVAREZ', '4271226625', 'ejemplo@gmail.com', 'AMEALCO DE BONFIL', '76890', 'DLS', 8, 'Directa', 20.062778, -100.066889),
(27, 144, 'MARIA GUADALUPE', 'CRUZ JUSTO', '4271481347', 'ejemplo@gmail.com', 'ACULCO', '50360', 'DLS', 9, 'Directa', 20.125917, -99.865444),
(28, 1100, 'AGROM', '-', '4271523458', 'agromfacturas@yahoo.com.mx', 'AMEALCO', '76850', 'DLS', 8, 'Directa', 20.384278, -100.007639),
(29, 211, 'PATRICIO', 'HUITRON MARTINEZ', '4271841852', 'ejemplo@gmail.com', 'CHAPA DE MOTA', '54387', 'DLS', 8, 'Directa', 19.896444, -99.621028),
(30, 378, 'GRUPO', 'AMEALCO', '4272740587', 'gamealco@hotmail.com', 'San Juan del Río', '76800', 'DLS', 8, 'Directa', 20.3842819, -100.000025),
(31, 215, 'MAURICIO', 'EZQUIVEL TENORIO', '4321076847', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50660', 'PPA', 7, 'Directa', 19.574639, -100.129167),
(32, 223, 'JESUS', 'HERNANDEZ', '4424117703', 'ejemplo@gmail.com', 'POLOTITLAN54200', '54200', 'DLS', 9, 'Directa', 20.032889, -99.514583),
(33, 1373, 'ALEJANDRA', 'MIRANDA RODRIGUEZ', '4424687744', 'fiara_amealco@outlook.com', 'Amealco de Bonfil', '76884', 'DLS', 9, 'Directa', 20.184472, -100.137028),
(34, 660, 'EDUARDO', 'ALCANTAR', '4424754196', 'erealcantar1@gmail.com', 'Epitacio Huerta', '61000', 'DLS', 9, 'Directa', 20.134361, -100.294222),
(35, 289, 'ERIKA', 'ROMERO GUERRA', '4425535976', 'ejemplo@gmail.com', 'CONTEPEC', '61020', 'DLS', 8, 'Directa', 19.942722, -100.171583),
(36, 890, 'JAVIER', 'EQUIHUA TORAL', '4427909209', 'factcamposverdes@gmail.com', 'MARAVATIO', '61254', 'DLS', 8, 'Directa', 19.894972, -100.418583),
(37, 196, 'MIGUEL ANGEL', 'MORENO EZQUIVEL', '4428212542', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 10, 'Directa', 19.572611, -100.14025),
(38, 511, 'JOSE FRANCISCO', 'TINOCO MORALES', '4433680980', 'sucansamorelia@hotmail.com', 'MORELIA', '58089', 'DLS', 9, 'Directa', 19.672194, -101.221444),
(39, 466, 'PHYTO NUTRIMENTOS', 'DE MEXICO', '4433809943', 'ejemplo@gmail.com', 'MARAVATIO', '61250', 'DGS', 9, 'Directa', 19.904056, -100.452),
(40, 886, 'FIDENCIO', 'MARTINEZ PEDRO', '4433921853', 'ejemplo@gmail.com', 'ATLACOMULCO', '50485', 'PRO', 14, 'Directa', 19.458361, -100.05225),
(41, 313, 'JULIO CESAR', 'ESQUIVEL ESQUIVEL', '4434826231', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON', '50671', 'PPA', 10, 'Directa', 19.587667, -100.141556),
(42, 701, 'JOSE LUIS', 'VACA ESQUIVEL', '4434916257', 'jluisve@live.com.mx', 'MARAVATIO', '61262', 'DGS', 9, 'Directa', 19.898583, -100.405806),
(43, 499, 'WENCESLAO', 'SANCHEZ SANCHEZ', '4447259435', 'ejemplo@gmail.com', 'JOCOTITLAN', '50737', 'PRO', 8, 'Directa', 19.715694, -99.8275),
(44, 1239, 'MENDIOLA', 'MENDIOLA', '4471030104', 'mendiola.cooperativa@outlook.com', 'Maravatío', '61258', 'DLS', 8, 'Directa', 19.90525, -100.385417),
(45, 461, 'CARLOS NICOLAS', 'HERRERA MENDIOLA', '4471030104', 'ejemplo@gmail.com', 'MARAVATIO', '61264', 'DLS', 9, 'Directa', 19.905333, -100.385444),
(46, 555, 'MARTHA ESTHELA', 'GRANADOS BALLESTEROS', '4471031961', 'agrogranados@gmail.com', 'Maravatío', '61250', 'DLS', 9, 'Directa', 19.898472, -100.448306),
(47, 1, 'ADN', 'AGROINSUMOS ', '712 124 6426', 'agroquimicosdelnorte@yahoo.com.mx', 'ATLACOMULCO', '50454', 'P', 15, 'Directa', 19.7883106, -99.8711463),
(48, 264, 'JUAN', 'CARRILLO GARCIA', '4471033953', 'ejemplo@gmail.com', 'CONTEPEC', '61041', 'DLS', 8, 'Directa', 19.916222, -100.231167),
(49, 351, 'RANCHO', 'EL RINCON DE LEON', '4471080246', 'fredyfresas@hotmail.com', 'CONTEPEC', '61041', 'PRO', 14, 'Directa', 19.458361, -100.05225),
(50, 1164, 'FRESAS', 'EL CENTENARIO', '4471080246', 'fredyfresas@hotmail.com', 'CONTEPEC', '61020', 'PRO', 14, 'Directa', 19.941889, -100.191),
(51, 530, 'ELEAZIN', 'SALDIVAR MEDRANO', '4471092888', 'ejemplo@gmail.com', 'EPITACIO HUERTA', '61002', 'DLS', 8, 'Directa', 20.082861, -100.203389),
(52, 1022, 'FRESAS', 'BELLAVISTA', '4471100571', 'fresasbellavista@gmail.com', 'CONTEPEC', '61051', 'PRO', 14, 'Directa', 19.941889, -100.191),
(53, 898, 'ANGELA', 'MARTINEZ CANO', '4471115555', 'angela.agroenlace@gmail.com', 'Amealco de Bonfil', '76850', 'DLS', 9, 'Directa', 20.184611, -100.139722),
(54, 772, 'DANIEL', 'HUITRON ROMERO', '4471159585', 'khr.07@outlook.com', 'CONTEPEC', '61051', 'DLS', 8, 'Directa', 19.873833, -100.117306),
(55, 426, 'AGROENLACE', 'TECNOLOGICO S.A. DE C.V.', '4481169511', 'agroenlacetec@gmail.com', 'AMEALCO', '76850', 'DGS', 9, 'Directa', 20.184611, -100.139722),
(56, 559, 'ANGEL', 'ANDRADE CASTAÑEDA', '4481252999', 'distribuidoraagricolaguerrero@gmail.com', 'San Juan del Río', '76813', 'DLS', 9, 'Directa', 20.477194, -100.055056),
(57, 1047, 'JOSE HECTOR', 'AVIÑA PEREZ', '4481698182', 'ejemplo@gmail.com', 'MICHOACAN', '61006', 'DLS', 8, 'Directa', 20.119972, -100.29575),
(58, 722, 'AGROALTEÑA', 'AGROALTEÑA', '4482780482', 'agroaltena@hotmail.com', 'AMEALCO DE BONFIL', '76850', 'DLS', 8, 'Directa', 20.1866662, -100.1408397),
(59, 1289, 'MG', 'ALIMENTOS', '7176909700', 'gcuellar@monteblanco.com.mx', 'Arteaga', '25370', 'DLS', 15, 'Directa', 19.2135773, -99.5574079),
(60, 751, 'INSECTICIDAS Y SEMILLAS', 'SAN RAFAEL', '4621054334', 'sn.rafaelagro@hotmail.com', 'IRAPUATO', '36567', 'DGS', 15, 'Directa', 20.665611, -101.36025),
(61, 380, 'MAINAGRO MAYOREO', 'DE INSUMOS AGRICOLAS', '4621958647', 'facturacion@mainagro.com', 'IRAPUATO', '36560', 'DLS', 15, 'Directa', 20.6698684, -101.3530523),
(62, 587, 'VICTOR', 'CRUZ SANCHEZ', '5518110704', 'victorcruzsanchez1986@gmail.con', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 7, 'Directa', 19.582972, -100.147917),
(63, 474, 'MARIA GUADALUPE', 'ACEVEDO SORIA', '5518526569', 'guadalupesoriaz78@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 7, 'Directa', 19.567333, -100.124361),
(64, 1027, 'LUIS MANUEL', 'MARIN GUADARRAMA', '7221689559', 'marin.guadarrama@gmail.com', 'METEPEC', '52140', 'DLS', 15, 'Directa', 19.2370625, -99.5942934),
(65, 926, 'GENERA', 'AGROINDUSTRIAL', '5521713697', 'rsosa@fundaciongenera.org', 'ACULCO', '50393', 'PRO', 7, 'Directa', 20.145472, -99.844972),
(66, 41, 'HUERTA', 'MICHOACAN', '5523283085', 'facturacion.ehuerta2124@gmail.com', 'Epitacio Huerta', '61014', 'DLS', 8, 'Directa', 20.134667, -100.29375),
(67, 468, 'EPIGMENIA', 'PEREZ MEJIA', '5523335920', 'epigmeniap@gmail.com', 'Naucalpan de Juárez', '53219', 'PRO', 8, 'Directa', 19.464806, -99.657417),
(68, 956, 'FORRAJES', 'LEO', '5525273771', 'ejemplo@gmail.com', 'Jilotepec', '54270', 'DLS', 9, 'Directa', 20.086722, -99.627333),
(69, 143, 'ARMANDO', 'BRAVO GARCIA', '5529603895', 'ejemplo@gmail.com', 'POLOTITLAN', '54200', 'DLS', 9, 'Directa', 20.231472, -99.8265),
(70, 524, 'JOSE', 'DOMINGUEZ EZQUIVEL', '5535629828', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PPA', 7, 'Directa', 19.577528, -100.134806),
(71, 791, 'VICTOR HUGO', 'DIAZ AGUILAR', '5540163221', 'ejemplo@gmail.com', 'JILOTEPEC', '54256', 'DLS', 9, 'Directa', 19.959389, -99.532611),
(72, 437, 'MACAVIED', 'MACAVIED', '5543526351', 'victor.gonzalez@rsl.com.mx', 'IZTAPALAPA', '9040', 'PPA', 15, 'Directa', 19.346444, -99.998944),
(73, -100, 'LUIS MANUEL', 'MARIN REBOLLO', '7222440785', 'luis.marin@marinagro.mx', 'ZINACANTEPEC', '51370', 'DGS', 15, 'Directa', 19.580028, -100.123778),
(74, 846, 'OSCAR', 'BLANQUEL SANCHEZ', '5544165122', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PPA', 15, 'Directa', 19.580028, -100.123778),
(75, 187, 'FACIO', 'GARCIA NELI', '5544513322', 'ejemplo@gmail.com', 'JILOTEPEC', '54275', 'DLS', 9, 'Directa', 20.112917, -99.540389),
(76, 132, 'CELSO', 'LEAL NUÑEZ', '5545479281', 'ejemplo@gmail.com', 'SAN JUAN ACAZUCHITLA', '54274', 'DLS', 9, 'Directa', 20.143917, -99.6),
(77, 1114, 'CESAR', 'HERNANDEZ SANABRIA', '5547697386', 'ejemplo@gmail.com', 'JILOTEPEC', '54253', 'DLS', 8, 'Directa', 19.954222, -99.528),
(78, 640, 'GONZALO', 'GONZALEZ ROSENDO', '5554135514', 'ejemplo@gmail.com', 'Toluca', '50236', 'DLS', 9, 'Directa', 19.351389, -99.553306),
(79, 428, 'PRONATEC', 'PRONATEC', '5554374647', 'info@golfagricola.com', 'CUAUHTEMOC', '6760', 'DGS', 15, 'Directa', 19.403222, -99.166889),
(80, 349, 'GOLF', 'AGRICOLA DE MEXICO', '5554374647', 'info@golfagricola.com', 'CUAUHTEMOC', '6760', 'DLS', 15, 'Directa', 19.403222, -99.166889),
(81, 545, 'ANA LILIA', 'MIRANDA MIRANDA', '5555083232', 'ejemplo@gmail.com', 'JILOTEPEC', '54250', 'DLS', 8, 'Directa', 19.963889, -99.494667),
(82, 572, 'JUAN CARLOS', 'SUAREZ MEJIA', '5559024137', 'ejemplo@gmail.com', 'TENANGO', '52345', 'DLS', 9, 'Directa', 19.108972, -99.656833),
(83, 889, 'HUGO', 'HUITRON MARTINEZ', '5576587794', 'prof.hhmartinez@hotmail.com', 'CHAPA DE MOTA', '54366', 'DLS', 8, 'Directa', 19.958, -99.548806),
(84, 168, 'GABRIEL', 'MONROY CRUZ', '5585094157', 'ejemplo@gmail.com', 'JILOTEPEC', '54240', 'DLS', 8, 'Directa', 19.963889, -99.494667),
(85, 330, 'PARAISO', 'AGROPECUARIO GUIJAM', '5591670923', 'perezcalva_10@hotmail.com', 'JILOTEPEC', '54250', 'DLS', 7, 'Directa', 19.982028, -99.485639),
(86, 253, 'LEONARDO', 'ESQUIVEL HURTADO', '5642733153', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50685', 'PPA', 12, 'Directa', 19.575667, -99.937944),
(87, 678, 'REGINA', 'MONROY DAVILA', '7121020866', 'ejemplo@gmail.com', 'JOCOTITLAN', '50727', 'DLS', 9, 'Directa', 19.679111, -99.768528),
(88, 122, 'VERONICA', 'GOMEZ LOPEZ', '7121051395', 'ejemplo@gmail.com', 'IXTLAHUACA', '50740', 'DLS', 9, 'Directa', 19.570167, -99.765861),
(89, 185, 'RICARDO', 'SANCHEZ CRUZ', '7121079605', 'ejemplo@gmail.com', 'JOCOTITLAN', '50730', 'PRO', 8, 'Directa', 19.702806, -99.824639),
(90, 202, 'XOCHIL ELIA ABADESA', 'VILLA MARTINEZ', '7121089965', 'ejemplo@gmail.com', 'JOCOTITLAN', '50713', 'DLS', 9, 'Directa', 19.784694, -99.923778),
(91, 962, 'OSCAR OMAR', 'ALBARRAN CASTAÑEDA', '7121135802', 'ejemplo@gmail.com', 'JIQUIPILCO', '50800', 'DLS', 9, 'Directa', 19.603583, -99.66325),
(92, 163, 'EFREN', 'GONZALEZ RODRIGUEZ', '7121204110', 'ejemplo@gmail.com', 'ATLACOMULCO', '50480', 'DLS', 9, 'Directa', 19.762333, -99.819361),
(93, 124, 'MARCO ANTONIO', 'BARRANCO SANDOVAL', '7121210155', 'ejemplo@gmail.com', 'IXTLAHUACA', '50745', 'DLS', 9, 'Directa', 19.680361, -99.861667),
(94, 254, 'ALEJANDRO', 'BARRANCO', '7121230951', 'ejemplo@gmail.com', 'JOCOTITLAN', '50700', 'DLS', 9, 'Directa', 19.679056, -99.758028),
(95, 235, 'RAFAEL', 'CASIMIRO LOPEZ', '7121306640', 'ejemplo@gmail.com', 'JOCOTITLAN', '50713', 'DLS', 9, 'Directa', 19.774556, -99.964194),
(96, 217, 'LUCIO', 'EZQUIVEL HURTADO', '7121335031', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50678', 'PPA', 7, 'Directa', 19.574722, -100.128333),
(97, 999, 'RODRIGO', 'GONZALEZ FONSECA', '7121340944', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 7, 'Directa', 19.524972, -100.107694),
(98, 261, 'JOSE LUIS', 'POSADAS CAMPOS', '7121366174', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PPA', 7, 'Directa', 19.727833, -99.574222),
(99, 879, 'J. TRINIDAD', 'VILLA CASAREZ', '7224592550', 'ejemplo@gmail.com', 'VILLA GUERRERO', '51760', 'DLS', 11, 'Directa', 18.966806, -99.643139),
(100, 766, 'RODRIGO', 'BARRANCO BARRANCO', '7121387168', 'rodrigobarranco@yahoo.com.mx', 'IXTLAHUACA', '50740', 'DLS', 9, 'Directa', 19.587389, -99.808083),
(101, 234, 'LEONEL', 'PLATA DE JESUS', '7121420263', 'ejemplo@gmail.com', 'ACULCO', '50374', 'DLS', 9, 'Directa', 20.037389, -99.720417),
(102, 301, 'JUAN', 'GARDUÑO HERNANDEZ', '7121431608', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 10, 'Directa', 19.577361, -100.138139),
(103, 577, 'CUAUHTEMOC', 'CRUZ CRUZ', '7121508309', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50668', 'PPA', 7, 'Directa', 19.588361, -100.174528),
(104, 490, 'GUILLERMINA', 'SANCHEZ NAVA', '7121592123', 'barrancosand@hotmail.com', 'IXTLAHUACA', '50740', 'DLS', 9, 'Directa', 19.677083, -99.84325),
(105, 647, 'JUAN', 'FONSECA', '7121592123', 'barrancosand@hotmail.com', 'IXTLAHUACA', '50755', 'DLS', 9, 'Directa', 19.677083, -99.843251),
(106, 1069, 'GERMAN RODOLFO', 'GARCIA RIVAS', '7121592211', 'ejemplo@gmail.com', 'TEMOAYA', '50894', 'DLS', 9, 'Directa', 19.556944, -99.609528),
(107, 471, 'ESTHER', 'SARMIENTO GONZALEZ', '7121601457', 'ejemplo@gmail.com', 'SAN FELIPE DEL PROGRESO', '50640', 'DLS', 9, 'Directa', 19.617722, -99.905694),
(108, 424, 'DESARROLLADORA', 'PROMOTORA AGROPECUARIA', '7121619600', 'facturacion@bionain.com', 'JOCOTITLAN', '50700', 'PRO', 7, 'Directa', 19.630505, -99.7799638),
(109, 422, 'BIONATUR INVERNADEROS', 'BIOLOGICOS DE MEXICO SA DE CV', '7121619600', 'facturacion@bionain.com', 'JOCOTITLAN', '50700', 'GRP', 7, 'Directa', 19.630505, -99.7799638),
(110, 128, 'FEDERICO', 'MIRANDA MIRANDA', '7121620587', 'facturacion@cecapmkg.edu.mx', 'TIMILPAN', '50524', 'DLS', 8, 'Directa', 19.883917, -99.722417),
(111, 875, 'HONGOS', 'DEL BOSQUE', '0000000000', 'rsalinas@monteblanco.com.mx', 'Miguel Hidalgo', '11700', 'PRO', 15, 'Directa', 19.2135773, -99.5574079),
(112, 937, 'ANTONIO', 'CRUZ CASTRO', '7121630378', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 7, 'Directa', 19.564096, -100.15115),
(113, 847, 'RENE', 'FLORES MORA', '7121680074', 'forrajera.str@gmail.com', 'Temascalcingo', '50444', 'DLS', 8, 'Directa', 20.013806, -100.070306),
(114, 159, 'SERAFIN', 'BECERRIL ALVAREZ', '7121781128', 'muzserafin@gmail.com', 'JIQUIPILCO', '50833', 'DLS', 9, 'Directa', 19.600889, -99.666528),
(115, 520, 'MARIA DOLORES', 'ROLDAN AYALA', '7121801896', 'ejemplo@gmail.com', 'Temascalcingo', '50443', 'DLS', 8, 'Directa', 19.996861, -100.045806),
(116, 632, 'HERNAN', 'SANCHEZ ONOFRE', '7121807747', 'ejemplo@gmail.com', 'JOCOTITLAN', '50724', 'DLS', 15, 'Directa', 19.746833, -99.927222),
(117, 140, 'HORACIO', ' VALDEZ', '7121873910', 'ejemplo@gmail.com', 'Temascalcingo', '50400', 'DLS', 9, 'Directa', 19.918694, -100.001972),
(118, 533, 'SALVADOR', 'VELASCO RAMIREZ', '7121879064', 'velasco610815@gmail.com', 'ATLACOMULCO', '50456', 'PRO', 8, 'Directa', 19.802083, -99.901167),
(119, 649, 'FRANCISCO', 'LOPEZ HERMENEGILDO', '7121882884', 'ejemplo@gmail.com', 'IXTLAHUACA', '50740', 'PRO', 8, 'Directa', 19.678778, -99.814472),
(120, 804, 'JAVIER', 'ALVAREZ CRUZ', '7122101287', 'ejemplo@gmail.com', 'TEMASCALCINGO', '50446', 'DLS', 8, 'Directa', 20.005972, -100.08975),
(121, 575, 'JESUS', 'DOMINGUEZ ESQUIVEL', '7122132229', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PPA', 12, 'Directa', 19.577139, -99.958333),
(122, 125, 'MARGARITA CLEOTILDE', 'PEREZ HENANDEZ', '7122311831', 'ejemplo@gmail.com', 'JOCOTITLAN', '50710', 'DLS', 9, 'Directa', 19.758306, -99.916056),
(123, 209, 'APOLINAR', 'DOMINGUEZ ESQUIVEL', '7122345766', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50678', 'PPA', 12, 'Directa', 19.577139, -99.958333),
(124, 504, 'AUCENCIO ESTEBAN', 'MORA GONZALEZ', '7122551738', 'ejemplo@gmail.com', 'TEMASCALCINGO', '50443', 'PRO', 8, 'Directa', 20.010194, -100.080028),
(125, 478, 'BENITO', 'VIEYRA QUIJADA', '7122831502', 'ejemplo@gmail.com', 'IXTLAHUACA', '50740', 'DLS', 9, 'Directa', 19.569505, -99.768222),
(126, 583, 'ISAAC', 'MEDINA ABONCE', '7151460999', 'elpionero.facturas@outlook.com', 'Zitácuaro', '61512', 'DLS', 9, 'Directa', 19.893361, -100.425306),
(127, 237, 'ABRAHAM', 'PIEDRA SALGADO', '7151737986', 'eltarascoabraham16@gmail.com', 'Zitácuaro', '61533', 'DLS', 9, 'Directa', 19.445556, -100.315361),
(128, 137, 'VICENTE', 'NUÑEZ DOMINGUEZ', '7181213238', 'ejemplo@gmail.com', 'TEMASCALCINGO', '50443', 'DLS', 8, 'Directa', 19.976005, -100.063083),
(129, 129, 'MA ALEJANDRA', 'ALCANTARA TORRES', '7181240126', 'ejemplo@gmail.com', 'ACULCO', '50360', 'DLS', 9, 'Directa', 20.099639, -99.829806),
(130, 675, 'AGROINSUMOS', 'EL FIELD', '7211410574', 'compras@elfield.com.mx', 'TONATICO', '51950', 'DGS', 15, 'Directa', 18.804333, -99.670333),
(131, 464, 'FRANCISCO', 'DIAZ BUSTOS', '7221117964', 'ejemplo@gmail.com', 'ZINACANTEPEC', '51370', 'DLS', 13, 'Directa', 19.2504722, -99.7569797),
(132, 953, 'PEDRO', 'MORENO ESQUIVEL', '7221200247', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 14, 'Directa', 19.572167, -100.140861),
(133, 434, 'AGRO', 'CIBELES', '7221481208', 'casaceres@yahoo.com.mx', 'TENANGO DEL VALLE', '52300', 'DGS', 9, 'Directa', 19.099194, -99.587917),
(134, 452, 'JUAN FERNANDO', 'ALCANTARA GONZALEZ', '7221600240', 'ejemplo@gmail.com', 'VILLA GUERRERO', '51760', 'DLS', 9, 'Directa', 18.950889, -99.678361),
(135, 861, 'CORTIJO', 'EL TORITO', '7221668986', 'mario.flores@krafir.mx', 'ALMOLOYA DE JUAREZ', '50908', 'PRO', 9, 'Directa', 19.3470909, -99.8028592),
(136, 608, 'JUAN CARLOS', ' VAZQUEZ ESQUIVEL', '7221733336', 'papasjuanbod86@outlook.com', 'VILLA VICTORIA ', '50987', 'PPA', 7, 'Directa', 19.518505, -100.112611),
(137, 963, 'PEDRO', 'CASTRO BOBADILLA', '7221819745', 'pedroc388@gmail.com', 'JOQUICINGO', '52371', 'DLS', 7, 'Directa', 19.112528, -99.530083),
(138, 368, 'CLUB DEPORTIVO', 'CAROLINA', '7222000501', 'compras@haciendacantalagua.com', 'CONTEPEC', '61051', 'PRO', 8, 'Directa', 19.898505, -100.155806),
(139, 183, '\"MUNDO', 'GRANJERO\"', '7222000501', 'giovaramirez1@gmail.com', 'CONTEPEC', '61051', 'PRO', 8, 'Directa', 19.902833, -100.137917),
(140, 432, '\"HACIENDA CANTALAGUA', 'COUNTRY CLUB\"', '7222000501', 'compras@haciendacantalagua.com.mx', 'CONTEPEC', '61051', 'PRO', 8, 'Directa', 19.894806, -100.141694),
(141, 659, 'ROSALBA', 'LOPEZ LUGO', '7222034203', 'ejemplo@gmail.com', 'IXTLAHUACA', '50780', 'DLS', 8, 'Directa', 50780, -99.62025),
(142, 1182, 'MARISOL', 'ADAME VAZQUEZ', '7222036961', 'transporte_adame@outlook.com', 'VILLA VICTORIA ', '50983', 'DLS', 15, 'Directa', 19.419028, -99.969778),
(143, 420, 'AGROQUIMICOS', 'EL TREBOL', '7222195156', 'admon@aeltrebol.com', 'Toluca', '50110', 'DGS', 15, 'Directa', 19.277694, -99.688056),
(144, 67, 'ALEXIS ISRAEL', 'MARTINEZ ARRIAGA', '7222399960', 'ejemplo@gmail.com', 'TONATICO', '52213', 'DLS', 11, 'Directa', 18.808583, -99.665278),
(145, 992, 'LETICIA', 'CHAPARRO VALDEZ', '7222403239', 'leti.chaparro@hotmail.com', 'Villa de Allende', '51015', 'DLS', 15, 'Directa', 19.41625, -100.011722),
(146, 494, 'RENACER', 'ORGANICO', '7222642860', 'renacerorganico@hotmail.com', 'ALMOLOYA DE JUAREZ', '50903', 'DGS', 9, 'Directa', 19.440556, -99.726111),
(147, 451, 'HUGO', 'MORALES VICTOR', '7222692420', 'ejemplo@gmail.com', 'VILLA VICTORIA ', '50984', 'DGS', 9, 'Directa', 20.086722, -99.627333),
(148, 55, 'SILVIA', 'ARIZMENDI SOTELO', '7222945343', 'factu.compra.sil89@gmail.com', 'IXTAPA DE LA SAL', '51933', 'DLS', 11, 'Directa', 18.837056, -99.728333),
(149, 296, 'MOISES', 'CASTRO TENORIO', '7222992289', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50678', 'PPA', 7, 'Directa', 19.56475, -100.124472),
(150, 484, 'GANADERIA', 'PASTEJE', '7222997679', 'mlalbin@iusa.com.mx', 'JOCOTITLAN', '50734', 'PRO', 8, 'Directa', 19.655333, -99.783222),
(151, 549, 'ISABEL', 'ARIAS ZEPEDA', '7223071126', 'isabel_ariaszepeda@yahoo.com.mx', 'TENANGO DEL VALLE', '52345', 'DLS', 9, 'Directa', 19.109255, -99.650528),
(152, 1260, 'LIZETT', 'ALFARO MEZA', '7223121417', 'grupolerdofacturas@gmail.com', 'Toluca', '50090', 'DLS', 9, 'Directa', 19.2771828, -99.6472651),
(153, 243, 'CRISTIAN', 'ALVAREZ SALVADOR', '7223235290', 'ejemplo@gmail.com', 'IXTLAHUACA', '50747', 'DLS', 9, 'Directa', 19.636917, -99.726778),
(154, 482, 'PRIMO', 'MARTINEZ', '7223504532', 'ejemplo@gmail.com', 'TEMASCALCINGO', '50447', 'PRO', 8, 'Directa', 20.016889, -100.122833),
(155, 517, 'AGRICULTORES Y GANADEROS', 'DE SAN JOSE IXTAPA SPR DE RL', '7223504536', 'ejemplo@gmail.com', 'TEMASCALCINGO', '50446', 'PRO', 8, 'Directa', 20.016889, -100.122833),
(156, 442, 'AGROQUIMICOS', 'PARA LA FLORICULTURA', '7223605315', 'facturacion@agroflor.com.mx', 'VILLA GUERRERO', '51765', 'PRO', 9, 'Directa', 18.937528, -99.654833),
(157, 154, 'SILVESTRE', 'ESCOBAR ESCOBAR', '7223692492', 'ejemplo@gmail.com', 'TEMASCALCINGO', '50445', 'DLS', 8, 'Directa', 19.941472, -100.076194),
(158, 316, 'EUSEBIO', 'BARRANCO', '7223792502', 'ejemplo@gmail.com', 'JOCOTITLAN', '50783', 'DLS', 9, 'Directa', 19.555111, -99.7445),
(159, 1089, 'CHAVEZ', 'AGROBUSINESS', '7223806875', 'pedrazzi-javier@hotmail.com', 'Toluca', '50100', 'PRO', 14, 'Directa', 19.548306, -100.119417),
(160, 1238, 'GUILLERMO', 'TARANGO LOPEZ', '7223951873', 'ejemplo@gmail.com', 'CALIMAYA', '52210', 'DLS', 9, 'Directa', 19.148111, -99.645583),
(161, 514, 'LIONEL', 'SOLORZANO MUÑOZ', '7224223818', 'lionelsolmuz@hotmail.com', 'San Martín Hidalgo', '46798', 'DLS', 8, 'Directa', 18.773944, -99.625861),
(162, 831, 'LEONARDO', 'GARCIA ARRIAGA', '7224239709', 'comercialagricolatoluca2@gmail.com', 'TOLUCA', '50130', 'DGS', 9, 'Directa', 18.940778, -99.64675),
(163, 970, 'GABRIEL ALEJANDRO', 'VELAZQUEZ SUAREZ', '7224390362', 'ejemplo@gmail.com', 'TENANGO DEL VALLE', '52345', 'DLS', 11, 'Directa', 19.110944, -99.648389),
(164, 377, 'ISSASI', 'FRANCISCO PIÑA', '7224434073', 'ejemplo@gmail.com', 'TENANGO DEL VALLE', '52300', 'PRO', 14, 'Directa', 19.119056, -99.573167),
(165, 285, 'GUADALUPE', 'QUEVEDO', '7224589656', 'ejemplo@gmail.com', 'TENANGO DEL VALLE', '52300', 'DLS', 9, 'Directa', 19.1218719, -99.6336339),
(166, 205, 'JUAN MANUEL', 'VILCHIS CHAVEZ', '7224616649', 'luis.g.18@hotmail.com', 'SAN FELIPE DEL PROGRESO ', '50694', 'PPA', 7, 'Directa', 19.617806, -100.069139),
(167, 802, 'JONATHAN', 'BARRERA', '7224618705', 'ejemplo@gmail.com', 'TENANGO DEL VALLE', '52345', 'DGS', 11, 'Directa', 19.1091389, -99.6490326),
(168, 690, 'GUSTAVO', 'ALLENDE TREJO', '7224801916', 'ejemplo@gmail.com', 'JOCOTITLAN', '50713', 'DLS', 9, 'Directa', 19.7818889, -99.9291582),
(169, 754, 'AGROCOLMEX', 'AGROCOLMEX', '7224936411', 'ejemplo@gmail.com', 'IXTLAHUACA', '50740', 'DLS', 9, 'Directa', 19.5798189, -99.7726962),
(170, 473, 'CARLOS', 'CHAVEZ', '7225114950', 'jorge_chavezm@hotmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 7, 'Directa', 19.5483611, -100.1225193),
(171, 170, 'JOSE', 'FELIX MEDINA', '7225556879', 'jfelixmedina@hotmail.com', 'TENANGO DEL VALLE', '52320', 'DLS', 9, 'Directa', 19.112, -99.5354916),
(172, 1099, 'REFACCIONES AGRICOLAS, INSUMOS Y', 'CAPACITACION ESPECIALIZADA PARA EL CAMPO', '7225558526', 'angel_mercadovilchis@yahoo.com.mx', 'TEMOAYA', '50896', 'DLS', 8, 'Directa', 19.4488056, -99.7095749),
(174, 558, 'CHAMPIMEX', 'MB', '0000000000', 'facturaschampimb@monteblanco.com.mx', 'AMEALCO', '76870', 'GRP', 15, 'Directa', 20.2015826, -100.1204822),
(175, 552, 'ANGEL CATARINO', 'MERCADO VILCHIS', '7225558566', 'ejemplo@gmail.com', 'TEMOAYA', '50896', 'GRP', 8, 'Directa', 19.4488056, -99.7095749),
(176, 554, 'ADAN', 'MARTINEZ DOMINGUEZ', '7226210207', 'adan.martinez.dominguez@outlook.com', 'SAN JOSE DEL RINCON ', '50660', 'PPA', 14, 'Directa', 19.5344444, -100.1193249),
(177, 919, 'JAVIER', 'FONSECA MENDOZA', '7226794783', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 7, 'Directa', 19.5249722, -100.1102693),
(178, 1133, 'NORMA', 'MARTINEZ RAMIREZ', '7226799002', 'ejemplo@gmail.com', 'VILLA VICTORIA ', '50960', 'DLS', 14, 'Directa', 19.4556944, -100.0502693),
(179, 303, 'ISABEL', 'PONCE OCAMPO', '7226799238', 'ejemplo@gmail.com', 'TEJUPILCO', '51400', 'DLS', 9, 'Directa', 18.8648333, -100.1401027),
(180, 1271, 'JOSE CARLOS', 'VILCHIS REYNA', '7226879615', 'cvilchis692@gmail.com', 'TENANGO DEL VALLE', '50736', 'DLS', 15, 'Directa', 19.6826389, -99.8033249),
(181, 974, 'GUILLERMO', 'GOMEZ CRUZ', '7226989768', 'fergomezanis@gmail.com', 'TENANGO DEL VALLE', '52336', 'DLS', 9, 'Directa', 19.1141944, -99.6418249),
(182, 593, 'GORA', 'INVERNADEROS', '7227151589', 'gorafacturacion@hotmail.com', 'TENANGO DEL VALLE', '52315', 'PPA', 8, 'Directa', 19.4365833, -99.7063805),
(183, 946, 'AZUCENA', 'BARRANCO NAVA', '7227580481', 'edsalasgarcia@gmail.com', 'TOLUCA', '50295', 'DLS', 9, 'Directa', 19.3983889, -99.7106582),
(184, 556, 'MAICEROS DE', 'TONATICO SPR DE RL', '7227619526', 'maicerosdetonatico@gmail.com', 'TONATICO', '51970', 'DLS', 8, 'Directa', 18.7739444, -99.628436),
(185, 372, 'JUAN FERNANDO', 'ARCINIEGA  ESTRADA', '7227645271', 'arme646@hotmail.com', 'JOCOTITLAN', '50700', 'DLS', 14, 'Directa', 19.7066944, -99.7933805),
(186, 145, 'FILIBERTO', 'HERNANDEZ ESQUIVEL', '7228024147', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50678', 'PPA', 7, 'Directa', 19.5771667, -100.140186),
(187, 585, 'ALFREDO', 'HERNANDEZ GARDUÑO', '7228024147', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PRO', 7, 'Directa', 19.5761667, -100.1397693),
(188, 405, 'JOSE CARMEN', 'CRUZ HERNANDEZ', '7228956950', 'ejemplo@gmail.com', 'ZINACANTEPEC', '51355', 'DLS', 14, 'Directa', 19.3217778, -99.7443249),
(189, 95, 'DELFINA', 'MEDINA NIETO', '7293102821', 'agrollano2@gmail.com', 'ZUMPAHUACAN', '51980', 'DLS', 11, 'Directa', 18.8584167, -99.6041582),
(190, 1011, 'SERVANDO', 'VAZQUEZ ARRIAGA', '7297563685', 'ejemplo@gmail.com', 'VILLA VICTORIA ', '50960', 'PPA', 7, 'Directa', 19.5177778, -100.1143249),
(191, 126, 'RUBEN', 'BARRANCO SANDOVAL', '7551447223', 'rubenbarrancosandoval@yahoo.com.mx', 'IXTLAHUACA', '50773', 'DLS', 9, 'Directa', 19.5944722, -99.8127138),
(192, 356, 'EFREN GUSTAVO', 'MARTINEZ HERRERA', '7712887731', 'efr.gus50@gmail.com', 'HIDALGO', '42642', 'DLS', 8, 'Directa', 20.2679722, -98.9987138),
(193, 1035, 'COMERCIALIZADORA', 'DE GRANOS REGIOCEL', '0000000000', 'acturas@regiocel.mx', 'CELAYA', '38024', 'DLS', 15, 'Directa', 20.5139444, -100.9206027),
(194, 418, 'AGROQUIMICOS', 'EL ROMANO', '7224213273', 'contabilidad@elromano.com.mx', 'MIGUEL HIDALGO', '11870', 'DGS', 15, 'Directa', 19.2955278, -99.7811582),
(195, 878, 'AGRO CULTIVOS', 'ECOLOGICOS', '0000000000', 'acturacionace@monteblanco.com.mx', 'MIGUEL HIDALGO', '11700', 'PRO', 15, 'Directa', 19.1686667, -99.560686),
(196, 531, 'JOSE JHOVANNI', 'VELAZQUEZ DE JESUS', '0000000000', 'jmacontadores@hotmail.com', 'VILLA VICTORIA ', '50960', 'PPA', 14, 'Directa', 19.4556944, -100.0502693),
(197, 901, 'NUEVA', 'ESTRELLA BERRIES', '4471100571', 'fredyfresas@hotmail.com', 'CONTEPEC', '61041', 'PRO', 14, 'Directa', 19.4583611, -100.0548249),
(198, 440, 'MUNICIPIO', 'DE ATLACOMULCO', '0000000000', 'cuentasporpagaratlacomulco@live.com.mx', 'ATLACOMULCO', '50450', 'PRO', 14, 'Directa', 19.7996389, -99.8766305),
(199, 921, 'MUNICIPIO', 'DE ATLACOMULCO', '0000000000', 'cuentasporpagaratlacomulco@live.com.mx', 'ATLACOMULCO', '50450', 'PRO', 14, 'Directa', 19.7996389, -99.8766305),
(200, 489, 'JOSE REMEDIOS', 'MORENO POSADAS', '7223377279', 'jgiadansp@hotmail.com', 'SAN JOSE DEL RINCON ', '50736', 'PPA', 14, 'Directa', 19.5736389, -100.1461305),
(201, 798, 'LAS PILAS', 'AGRICOLAS SPR DE RL', '0000000000', 'crafael141@gmail.com', 'TAMAZULA', '59650', 'DGS', 14, 'Directa', 19.6431111, -103.2505749),
(202, 884, 'IVETT', 'POSADAS ESQUIVEL', '7223377279', 'ivettposadas1@gmail.com', 'TOLUCA', '50100', 'PPA', 14, 'Directa', 19.5736389, -100.1461305),
(203, 710, 'FRESAS', 'FREDY', '4471100571', 'fredyfresas@hotmail.com', 'CONTEPEC', '61041', 'PRO', 14, 'Directa', 19.9418889, -100.1935749),
(204, 589, 'FENIX', 'BERRIES', ' 4471078666', 'fredyfresas@hotmail.com', 'CONTEPEC', '61041', 'PRO', 14, 'Directa', 19.4583611, -100.0548249),
(205, 574, 'OSCAR', 'CRUZ GARCIA', '0000000000', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50678', 'PPA', 14, 'Directa', 19.5690833, -100.1292971),
(206, 959, 'CARRIBERRIES', 'CARRIBERRIES', '4471100571', 'fredyfresas@hotmail.com', 'CONTEPEC', '61041', 'PRO', 14, 'Directa', 19.4583611, -100.0548249),
(207, 714, 'ALIMS', 'CARYA', '4471100571', 'fredyfresas@hotmail.com', 'CONTEPEC', '61041', 'PRO', 14, 'Directa', 19.4583611, -100.0548249),
(208, 350, 'CONSORCIO AGROINDUSTRIAL', 'DE QUERETARO S.A. DE C.V.', '0000000000', 'ejemplo@gmail.com', 'SAN JUAN DEL RIO', '76800', 'PRO', 8, 'Directa', 20.6946389, -100.0082693),
(209, 465, 'HECTOR', 'CHAVEZ BARRO', '0000000000', 'barro_luis61@outlook.com', 'IZTAPALAPA', '9040', 'PPA', 7, 'Directa', 19.5483611, -100.1225193),
(210, 631, 'JACINTO', 'HERNANDEZ EZQUIVEL', '0000000000', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 10, 'Directa', 19.5773611, -100.1407138),
(211, 785, 'PROMASORCA', 'PROMASORCA', '4611696506', 'facturas@regiocel.m', 'CELAYA', '38024', 'DLS', 15, 'Directa', 20.5141111, -100.9285193),
(212, 369, 'AGROCAMDEL', 'AGROCAMDEL', '4211063144', 'agro_camdel@outlook.com', 'Tarandacuao', '38790', 'DGS', 9, 'Directa', 20.0128658, -100.5401538),
(213, 178, 'ARTURO', 'GARCIA HERNANDEZ', '5543399821', 'ejemplo@gmail.com', 'VILLA DEL CARBON', '54300', 'DLS', 9, 'Directa', 19.723, -99.4807693),
(214, 112, 'ARMANDO', 'MARTINEZ RODRIGUEZ', '5545917526', 'ejemplo@gmail.com', 'SOYANIQUILPAN DE JUAREZ', '54297', 'DLS', 9, 'Directa', 20.0967222, -99.5292138),
(215, 1007, 'GABRIEL', 'POSADAS ESQUIVEL', '7121005915', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 10, 'Directa', 19.5648056, -100.1263249),
(216, 525, 'JUAN', 'GARCIA CRUZ', '7121554101', 'juan6gar9@gmail.com', 'SAN JOSE DEL RINCON ', '50678', 'PPA', 12, 'Directa', 19.5625833, -100.154436),
(217, 792, 'GABRIELA', 'NAVA TAPIA', '7121867345', 'junny_14@hotmail.com', 'CHAPA DE MOTA', '54350', 'PPA', 10, 'Directa', 19.7433889, -99.5753527),
(218, 774, 'JOSE', 'VIEYRA MONROY', '7122460553', 'ejemplo@gmail.com', 'JOCOTITLAN', '50728', 'DLS', 7, 'Directa', 19.66325, -99.7207693),
(219, 429, 'RAUL RODOLFO', 'LOPEZ MILLAN', '7171750421', 'agrodelcentro71@yahoo.com.mx', 'TENANGO DEL VALLE', '52320', 'DGS', 9, 'Directa', 19.1163056, -99.5445749),
(220, 427, 'PUNTO', 'VERDE AGRO', '7221334104', 'puntoverde_toluca@hotmail.com', 'TOLUCA', '50170', 'DGS', 15, 'Directa', 19.2569444, -99.670186),
(221, 1160, 'J. CARMEN', 'VAZQUEZ ESQUIVEL', '7223960294', 'ejemplo@gmail.com', 'VILLA VICTORIA ', '50987', 'PPA', 7, 'Directa', 19.5186111, -100.115436),
(222, 612, 'ALEJANDRO', 'LOPEZ GARCIA', '7222923044 ', 'alejandroloppez75@gmail.com', 'Temascaltepec', '51325', 'DLS', 7, 'Directa', 19.1280833, -99.933936),
(223, 837, 'FERNANDO', 'VAZQUEZ SALGADO', '7226764212', 'ejemplo@gmail.com', 'VILLA VICTORIA ', '50960', 'PPA', 7, 'Directa', 19.5185556, -100.1155193),
(224, 1301, 'JOSUE', 'MARTINEZ CORDERO', '7293751993', 'salo_mtzc@hotmail.com', 'Malinalco', '52440', 'DLS', 8, 'Directa', 18.9416111, -99.4994082),
(225, 61, 'MA. GUADALUPE DE LOS ANGELES', 'RUIZ RIVERA', '0000000000', 'mh2hm@hotmail.com', 'TUNGAREO', '61258', 'DLS', 9, 'Directa', 19.9130883, -100.3622693),
(226, 114, 'ORLANDO', 'MELQUIADES VELAZQUEZ', '7121085523', 'ejemplo@gmail.com', 'IXTLAHUACA', '50740', 'DLS', 9, 'Directa', 19.6668383, -99.8354638),
(227, 479, 'RAYMUNDO', 'CAMACHO LEON', '4471054699', 'ejemplo@gmail.com', 'EPITACIO HUERTA', '61000', 'DLS', 9, 'Directa', 20.133111, -100.293694),
(228, 1112, 'KAREN CONCEPCION', 'MOLINA CUEVAS', '7121620388', 'karensita_67@live.com', 'JOCOTITLAN', '50724', 'DLS', 9, 'Directa', 19.709694, -99.68325),
(229, 975, 'RUBEN', 'SANCHEZ URBINA ', '7122290255', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PPA', 10, 'Directa', 19.586031, -100.1523284),
(230, 1274, 'EFRAIN', 'SANCHEZ URBINA', '7124151748', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PPA', 10, 'Directa', 19.585968, -100.148079),
(231, 1241, 'JESUS', 'URBINA ESTEVEZ', '5548549674', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PPA', 10, 'Directa', 19.5868713, -100.1465087),
(232, 72, 'OSCAR', 'MARIN HUITRON ', '7222606862', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50661', 'PPA', 12, 'Directa', 19.693523, -100.137192),
(233, 622, 'J DOLORES', 'EDUARTE SANCHEZ', '5540846033', 'ejemplo@gmail.com', 'SAN FELIPE DEL PROGRESO ', '50690', 'PPA', 12, 'Directa', 19.607988, -100.04228),
(234, 996, 'JOSE', 'ESQUIVEL CHAVEZ ', '7225981711', 'ejemplo@gmail.com', 'ATLACOMULCO', '50450', 'PPA', 12, 'Directa', 19.7881798, -99.8785611),
(235, 662, 'DANIEL', 'ZEPEDA MARTINEZ ', '4471054699', 'ejemplo@gmail.com', 'HEPITACIO HUERTA', '61000', 'DLS', 12, 'Directa', 19.215576, -99.769089),
(236, 854, 'GILBERTO', 'CASTRO POSADAS', '7121640456', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 10, 'Directa', 19.568691, -100.122909),
(237, 576, 'DAMIAN', 'POSADAS DOMINGUEZ', '7121348426', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50670', 'PPA', 10, 'Directa', 19.569748, -100.131218),
(238, 581, 'JOSE MANUEL', 'GARDUÑO CRUZ', '4426083077', 'ejemplo@gmail.com', 'SAN JOSE DEL RINCON ', '50671', 'PPA', 10, 'Directa', 19.578518, -100.13913),
(239, 77, 'GERARDO', 'NIETO NIETO', '7293102821', 'ejemplo@gmail.com', 'ZAMPAHUACAN', '51980', 'DLS', 11, 'Directa', 18.858384, -99.601591),
(240, 77, 'GERARDO', 'NIETO NIETO', '7293102821', 'ejemplo@gmail.com', 'ZAMPAHUACAN', '51980', 'DLS', 11, 'Directa', 18.855016, -99.617273),
(241, 57, 'JUAN JAVIER', 'AYALA ARIZMENDI', '7222945343', 'ejemplo@gmail.com', 'IXTAPAN DE LA SAL ', '51900', 'DLS', 11, 'Directa', 18.8368816, -99.7285614),
(242, 170, 'JOSE', 'FELIZ MEDINA ', '7225556879', 'ejemplo@gmail.com', 'TENANGO DEL VALLE', '52320', 'DLS', 11, 'Directa', 19.1120026, -99.532926),
(243, 961, 'MIGUEL ANGEL', 'REYNA MARTINEZ', '7222540428', 'ejemplo@gmail.com', 'TEMASCALTEPEC', '51314', 'PRO', 11, 'Directa', 19.041605, -100.171127),
(244, 992, 'LETICIAA', 'CHAPARRO VALDEZ', '7222403239', 'leti.chaparro@hotmail.com', 'MARAVATIO ', '61250', 'DLS', 15, 'Directa', 19.916177, -100.4675425),
(245, 992, 'LETICIA', 'CHAPARRO VALDEZ', '7222403239', 'leti.chaparro@hotmail.com', 'VILLA VICTORIA ', '61250', 'DLS', 15, 'Directa', 19.415947, -100.011814),
(246, 444, 'INNOVAGRO', 'INNOVAGRO', '0000000000', 'eyna_innovagro@prodigy.net.mx', 'VILLA GUERRERO', '51760', 'DLS', 15, 'Directa', 18.9652623, -99.6415984);

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
  `tiempo` time(6) DEFAULT NULL,
  `total_costo` varchar(20) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `costos`
--

INSERT INTO `costos` (`id_costo`, `prec_gasolina`, `prec_caseta`, `lugar_salida`, `lugar_llegada`, `distancia`, `tiempo`, `total_costo`, `cliente_id`) VALUES
(1, '25', '62', 'Atlacomulco', 'Ixtlahuaca', '31', '23:35:00.000000', '636', NULL);

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
  `costo` int(255) NOT NULL,
  `tiempo_total` varchar(20) NOT NULL,
  `combustible` varchar(100) NOT NULL,
  `distancia` int(50) NOT NULL,
  `cajas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `fecha`, `hora_inicio`, `hora_fin`, `repartidor_id`, `vehiculo_id`, `costo`, `tiempo_total`, `combustible`, `distancia`, `cajas`) VALUES
(2, '2025-02-14', '11:20', '00:20', 15, 20, 4350, '60', 'gasolina', 50, 15),
(5, '2025-02-18', '10:00', '11:20', 19, 18, 526, '50', 'gasolina', 9, 20),
(6, '2025-02-17', '10:30', '12:00', 21, 26, 730, '60', 'gasolina', 47, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_clientes`
--

CREATE TABLE `pedido_clientes` (
  `id_pedido` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_clientes`
--

INSERT INTO `pedido_clientes` (`id_pedido`, `id_cliente`) VALUES
(2, 11),
(2, 10),
(5, 16),
(5, 23),
(5, 18),
(6, 33),
(6, 20);

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
(13, 'GUSTAVO', 'GONZALEZ TREJO', 'A6661521', '7122147579', 'GUSTAVO_20250121_095614.jpeg'),
(14, 'GABRIEL', 'DIAZ PRIMERO', 'LFD01175624', '7121595986', 'GABRIEL_20250121_095653.jpeg'),
(15, 'DAGOBERTO', 'CRESCENCIO CRESCENCIANO', 'LFD01142107', '7227642518', 'DAGOBERTO_20250121_095851.jpeg'),
(16, 'IGNACIO', 'AYALA OJO DE AGUA', '90000189540', '7224801906', 'IGNACIO_20250121_095927.jpeg'),
(17, 'GUSTAVO', 'ALLENDE TREJO', 'BH6554', '7224801916', 'GUSTAVO_20250121_100001.jpeg'),
(18, 'JUAN CARLOS', 'PICAZZO MARTINEZ', 'BF6421', '5510023937', 'JUAN_CARLOS_20250121_100033.jpeg'),
(19, 'CUAHUTEMOC', 'GARCIA MARTINEZ', 'DI6496', '7226850251', 'CUAHUTEMOC_20250121_100104.jpeg'),
(20, 'CARLOS ADRIAN', 'ARZALUZ REYES', '194573', '5561684553', 'CARLOS_ADRIAN_20250121_100153.jpeg'),
(21, 'JUAN PABLO', 'CONTRERAS MORALES', '277665', '7295270134', 'JUAN_PABLO_20250121_100228.jpeg');

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
(2, 'subadmin', 'sub', 'agro_sub');

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
  `ultima_tenencia` date DEFAULT NULL,
  `cpk` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `modelo`, `placas`, `ultimo_servicio`, `prox_verifi`, `ultima_tenencia`, `cpk`) VALUES
(18, 'FRONTIER NARANJA ', 'PAW-931-A', '2024-07-01', '2024-12-20', '2025-03-18', 0.11),
(20, 'TRANSPORTER ', 'JY-53-705', '2024-09-19', '2024-12-19', '2025-03-18', 0.1),
(21, 'HYUNDAI HD 120', '76-AJ-7B', '2024-03-20', '2024-11-22', '2025-03-18', 0.5),
(22, 'HYUNDAI CAMIONCITO', '75-AJ-7B', '2024-02-01', '2024-11-12', '2025-03-18', 0.5),
(23, 'NISSAN GRIS', 'LG-03-359', '2024-09-25', '2024-12-10', '2025-03-18', 0.16),
(24, 'HILUX ', 'LF-08-578', '2024-03-20', '2025-02-17', '2025-03-18', 0.11),
(25, 'NISSAN BLANCA', 'JY-64-160', '2025-01-10', '2025-07-10', '2025-09-10', 0.07),
(26, 'NISSAN ROJA', 'NB-D06-7D', '2025-02-04', '2025-05-30', '2025-07-25', 0.11),
(27, 'AMAROK', 'PCK-997-A', '2024-12-10', '2024-12-16', '2025-03-18', 0.1);

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
(7, 'IGNACIO', 'AYALA OJO DE AGUA', '7224801906', 'IGNACIO_20250121_100322.jpeg'),
(8, 'JUAN CARLOS', 'PICAZZO MARTINEZ', '5510023937', 'JUAN_CARLOS_20250121_100353.jpeg'),
(9, 'GUSTAVO', 'ALLENDE TREJO', '7224801916', 'GUSTAVO_20250121_100427.jpeg'),
(10, 'JUAN PABLO', 'CONTRERAS MORALES', '7295270134', 'JUAN_PABLO_20250121_100511.jpeg'),
(11, 'CARLOS ADRIAN', 'ARZALUZ REYES', '5561684553', 'CARLOS_ADRIAN_20250121_100540.jpeg'),
(12, 'CUAHUTEMOC', 'GARCIA MARTINEZ', '7226850251', 'CUAHUTEMOC_20250121_100622.jpeg'),
(13, 'JORGE ANTONIO', 'URBANO PLATA', '7122042950', 'JORGE_ANTONIO_20250121_103956.png'),
(14, 'RAFAEL', 'CHAVEZ CHAVEZ', '7226475851', 'RAFAEL_20250121_104045.png'),
(15, 'LILIA MARGARITA', 'CHAVEZ GUTIERREZ', '7121246426', 'LILIA_MARGARITA_20250121_104112.png');

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
  ADD KEY `vehiculo_id` (`vehiculo_id`);

--
-- Indices de la tabla `pedido_clientes`
--
ALTER TABLE `pedido_clientes`
  ADD KEY `fk_pedido` (`id_pedido`),
  ADD KEY `fk_cliente` (`id_cliente`);

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
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `costos`
--
ALTER TABLE `costos`
  MODIFY `id_costo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  MODIFY `id_repartidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id_vehiculo`);

--
-- Filtros para la tabla `pedido_clientes`
--
ALTER TABLE `pedido_clientes`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `pedido_clientes_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `pedido_clientes_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `rutas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
