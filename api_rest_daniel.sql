-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 30-05-2023 a las 19:38:52
-- Versión del servidor: 5.7.34
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_rest_daniel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gotBoton` tinyint(1) DEFAULT NULL,
  `botonName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `url`, `target`, `image`, `gotBoton`, `botonName`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Soy un banner', '<p>soy un baner</p>', 'https://google.com', '_blank', '2023-05-24 17:21:22nav01jpg.jpg', 1, 'Mas info', 'PUBLISHED', '2023-05-24 21:21:26', '2023-05-24 21:21:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Angular14', '2023-05-05 00:16:19', '2023-05-05 01:32:17'),
(2, 'Laravel 8', '2023-05-05 00:16:26', '2023-05-05 01:32:35'),
(3, 'NodeJs', '2023-05-05 00:16:38', '2023-05-05 00:16:38'),
(4, 'nueva', '2023-05-05 01:46:56', '2023-05-05 01:46:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicions`
--

CREATE TABLE `condicions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `aceptaCondiciones` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `condicions`
--

INSERT INTO `condicions` (`id`, `user_id`, `aceptaCondiciones`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2023-05-28 21:38:24', '2023-05-28 21:38:24'),
(2, 6, 1, '2023-05-30 02:03:30', '2023-05-30 02:03:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USD', '2023-05-05 00:16:07', '2023-05-05 00:16:07', NULL),
(2, 'BSDVEsss', '2023-05-05 01:22:50', '2023-05-05 01:42:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `follows`
--

CREATE TABLE `follows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_id` bigint(20) UNSIGNED NOT NULL,
  `follow_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_25_205816_create_currencies_table', 1),
(6, '2022_11_25_205817_create_plans_table', 1),
(7, '2022_11_30_175428_create_jobs_table', 1),
(8, '2022_12_09_225550_create_payment_methods_table', 1),
(9, '2022_12_09_225551_create_payments_table', 1),
(10, '2022_12_18_035041_create_contacts_table', 1),
(11, '2023_04_30_145301_create_categories_table', 1),
(12, '2023_04_30_145714_create_posts_table', 1),
(13, '2023_04_30_150901_create_profile_table', 1),
(14, '2023_04_30_152655_create_follow_table', 1),
(15, '2023_05_24_032128_create_banners_table', 2),
(16, '2023_05_28_165656_create_condiciones_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metodo_id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `referencia`, `monto`, `metodo_id`, `currency_id`, `user_id`, `plan_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'dasad', '32,00', 1, 1, 1, 5, '2023-05-05 08:00:02', '2023-05-05 08:00:02', NULL),
(2, 'dasad', '32,00', 1, 1, 1, 5, '2023-05-05 08:00:53', '2023-05-05 08:00:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modoPaypal` tinyint(1) DEFAULT NULL,
  `clienteIdPaypal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `llaveSecretaPaypal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modoBinance` tinyint(1) DEFAULT NULL,
  `merchantIdBinance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountIdBinance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apiKeyBinance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `modoPaypal`, `clienteIdPaypal`, `llaveSecretaPaypal`, `modoBinance`, `merchantIdBinance`, `accountIdBinance`, `apiKeyBinance`, `currency_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 1, 'test', 'esto-es-una-prueba', 1, 'PENDING', 'PENDING', 'PENDING', 1, '2023-05-05 00:17:27', '2023-05-05 05:03:00', NULL),
(2, 'pagos', 1, 'AXlazeNsZ0CmjfJIronSzcqzw4hLHkcoVEM5fO5BY7AbD-_GhKoKezRcavq6-T4kQuRqaTXFB_VXmheG', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-05 04:03:49', '2023-05-05 04:14:15', '2023-05-05 04:14:15'),
(3, 'pagos', 1, 'AXlazeNsZ0CmjfJIronSzcqzw4hLHkcoVEM5fO5BY7AbD-_GhKoKezRcavq6-T4kQuRqaTXFB_VXmheG', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-05 04:03:50', '2023-05-05 04:14:11', '2023-05-05 04:14:11'),
(4, 'dsa', 1, 'das', 'das', 1, 'dasd', 'as', 'ads', 1, '2023-05-05 04:23:59', '2023-05-05 04:29:17', '2023-05-05 04:29:17'),
(5, 'dsa', 1, 'das', 'das', 1, 'dasd', 'as', 'ads', 1, '2023-05-05 04:24:17', '2023-05-05 04:29:11', '2023-05-05 04:29:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adicional` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tiempo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plans`
--

INSERT INTO `plans` (`id`, `name`, `price`, `description`, `adicional`, `color`, `tiempo`, `currency_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', '1', 'este es un plan', '', '#cfd5de', '1 semana', 1, 'PENDING', '2023-05-05 00:16:48', '2023-05-24 22:13:44', NULL),
(2, 'Miembro', '1', '<ul><li>test</li><li>test</li><li>test</li></ul>', '', '#9ca3ad', '1 mes', 1, 'PENDING', '2023-05-05 00:17:11', '2023-05-05 07:38:13', NULL),
(3, 'Miembro', '30', '<ol><li>dasdsa</li><li>dsadas</li><li>ads</li><li>dsa</li></ol>', '', '#cfd5de', 'Anual', 1, 'PENDING', '2023-05-05 07:43:37', '2023-05-11 04:37:44', NULL),
(4, 'Miembro', '30', '<ol><li>dasdsa</li><li>dsadas</li><li>ads</li><li>dsa</li></ol>', '', '#930b32', 'Anual', 1, 'PENDING', '2023-05-05 07:43:37', '2023-05-11 04:37:59', NULL),
(5, 'otro', '32', '<p>dassa</p>', '', '#cfd5de', 'adsdas', 1, 'PENDING', '2023-05-05 07:45:15', '2023-05-24 22:20:03', '2023-05-24 22:20:03'),
(6, 'otro', '32', '<p>dassa</p>', '', '#cfd5de', 'adsdas', 1, 'PENDING', '2023-05-05 07:45:15', '2023-05-24 22:14:06', '2023-05-24 22:14:06'),
(7, 'adicional', '123', 'adicional', '<p><span style=\"color:#ce9178;\">adicional</span></p>', '#930b32', 'adicional', 1, 'PENDING', '2023-05-24 22:23:17', '2023-05-24 22:23:17', NULL),
(8, 'Plan 2023', '230', 'esto es un plan de 1 año', '<p>esto es un plan de 1 año</p><p>Beneficion:&nbsp;</p><ol><li>cobertura</li><li>asesoramiento</li></ol><p>&nbsp;</p>', '#9ca3ad', '1 año', 1, 'PENDING', '2023-05-24 23:31:20', '2023-05-30 03:40:19', '2023-05-30 03:40:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `adicional` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isFeatured` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `description`, `adicional`, `price`, `slug`, `isFeatured`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Real Madrid: El Bernabeú se vuelca con Vinícius', '<h2 style=\"margin-left:0px;\"><strong>Jugadores y público del Santiago Bernabéu lo acompañaron con un aplausos a la vez que \'Vini\' salió del túnel de vestuarios</strong></h2><p style=\"margin-left:0px;\">Los prolegómenos del partido entre <a href=\"https://www.espn.com.ve/futbol/equipo/_/id/86/real-madrid\"><strong>Real Madrid</strong></a> y <strong>Rayo Vallecano</strong> se convirtieron en una muestra de apoyo al brasileño <a href=\"https://www.espn.com.mx/futbol/jugador/_/id/252107/vinicius-junior\"><strong>Vinicius Junior</strong></a> tras el último episodio de racismo el pasado domingo en Mestalla, con pancarta de apoyo y sus compañeros luciendo su camiseta para saltar al terreno de juego.</p><p style=\"margin-left:0px;\">\"<strong>Vinicius </strong>somos todos, basta ya\", fue el mensaje elegido por la Grada Fans situada en el fondo sur en una pancarta gigante que incluía también una camiseta con el dorsal \'20\' del brasileño.</p><figure class=\"image image_resized\" style=\"width:auto !important;\"><picture><source srcset=\"https://a1.espncdn.com/combiner/i?img=%2Fphoto%2F2023%2F0524%2Fr1177697_1296x729_16%2D9.jpg&amp;w=570&amp;format=jpg, https://a1.espncdn.com/combiner/i?img=%2Fphoto%2F2023%2F0524%2Fr1177697_1296x729_16%2D9.jpg&amp;w=1140&amp;cquality=40&amp;format=jpg 2x\" media=\"(min-width: 376px)\"><source srcset=\"https://a1.espncdn.com/combiner/i?img=%2Fphoto%2F2023%2F0524%2Fr1177697_1296x729_16%2D9.jpg&amp;w=375, https://a1.espncdn.com/combiner/i?img=%2Fphoto%2F2023%2F0524%2Fr1177697_1296x729_16%2D9.jpg&amp;w=750&amp;cquality=40&amp;format=jpg 2x\" media=\"(max-width: 375px)\"><img></picture></figure><p>El Bernabeú se vuelca con Vinícius&nbsp;EPA</p><p style=\"margin-left:0px;\">Además, todos sus compañeros, incluido el hispano-dominicano <strong>Mariano Díaz</strong>, quien se quedó fuera de la convocatoria, saltaron al terreno de juego con la camiseta de <strong>Vinícius Junior</strong> y se fotografiaron juntos, de espaldas.</p><p style=\"margin-left:0px;\">Jugadores y público del Santiago Bernabéu lo acompañaron con un aplausos a la vez que \'Vini\' salió del túnel de vestuarios, sin pisar el terreno de juego, vestido de calle para, con rostro serio, agradecer el apoyo elevando el pulgar de la mano derecha a la grada.</p><h2 style=\"margin-left:0px;\"><strong>RELACIONADO</strong></h2><ul><li><a href=\"https://www.espn.com.ve/futbol/espana/nota/_/id/12099881/javer-tebas-disculpa-vinicius-racismo-futbol-espanol\"><img src=\"https://a.espncdn.com/combiner/i?img=/photo/2023/0521/r1176194_1296x1296_1-1.jpg&amp;w=130&amp;h=130&amp;scale=crop&amp;location=center\"></a></li></ul><h2 style=\"margin-left:0px;\"><a href=\"https://www.espn.com.ve/futbol/espana/nota/_/id/12099881/javer-tebas-disculpa-vinicius-racismo-futbol-espanol\"><strong>Tebas se disculpa con Vinícius: \"No tenía la intención de atacar\"</strong></a></h2><p style=\"margin-left:0px;\"><strong>23mGustavo Hofman | ESPN</strong></p><p style=\"margin-left:0px;\">Tras esto, <a href=\"https://www.espn.com.mx/futbol/jugador/_/id/252107/vinicius-junior\"><strong>Vinicius </strong></a>se dirigió al palco para ver el partido junto al presidente del <a href=\"https://www.espn.com.ve/futbol/equipo/_/id/86/real-madrid\"><strong>Real Madrid</strong></a><strong>, Florentino Pérez</strong>, quien el lunes, tras los insultos racistas que sufrió en Mestalla en el partido entre <strong>Valencia </strong>y <strong>Real Madrid</strong>, se reunió con su futbolista para trasladarle su cariño y explicarle los pasos que iba a seguir el club para defenderle.</p><p style=\"margin-left:0px;\">Además, antes del inicio del encuentro, los jugadores titulares de ambos equipos posaron junto a una pancarta, promovida por <strong>LaLiga</strong>, la Real Federación Española de Fútbol y el Consejo Superior de Deportes junto al lema \"Racistas, fuera del fútbol\".</p><h2 style=\"margin-left:0px;\"><strong>Butragueño: \"La imagen del fútbol español está muy dañada\"</strong></h2><p style=\"margin-left:0px;\"><strong>Emilio Butragueño</strong>, director de Relaciones Institucionales del <strong>Real Madrid</strong>, declaró este miércoles que los cánticos racistas sufridos por <strong>Vinicius Júnior</strong> en el partido del pasado domingo contra el <strong>Valencia </strong>en Mestalla, y todo lo generado a su alrededor, está teniendo una \"dimensión internacional que provoca que la imagen del fútbol español esté muy dañada\".</p><p style=\"margin-left:0px;\">Los prolegómenos del partido entre <strong>Real Madrid</strong> y <strong>Rayo Vallecano</strong> se convirtieron en una muestra de apoyo al brasileño <strong>Vinícius Junior</strong> tras el último episodio de racismo sufrido el pasado domingo en Mestalla, con pancarta de apoyo y sus compañeros luciendo su camiseta para saltar al terreno de juego.</p><p style=\"margin-left:0px;\">\"Venimos avisando desde hace mucho tiempo y esto ha tomado una dimensión internacional que, sinceramente, provoca que la imagen del fútbol español esté muy dañada. En estas circunstancias, lo que tiene que suceder es que aquellos que tienen la responsabilidad de resolverlo, pues actúen\", dijo Butragueño, en declaraciones a <i>Real Madrid TV.</i></p><p style=\"margin-left:0px;\">\"Vinicius cuenta con todo el cariño, la solidaridad y el afecto del club, de sus compañeros y de todo el madridismo. Pero voy más allá, en los últimos días ha recibido muestras de todo el mundo y de todos los sectores. Hoy mismo la ONU se ha pronunciado mostrando una gran preocupación por lo que está sucediendo aquí en España\", confesó.</p>', 'Jugadores y publico del santiago bernabeu lo acompañaron con aplausos', '', 'real-madrid-el-bernabeu-se-vuelca-con-vinicius', 1, '2023-05-05 03:26:02161225png.png', 'PUBLISHED', '2023-05-05 00:17:39', '2023-05-25 02:34:27'),
(2, 1, 2, 'Inter y Fiorentina definen la Copa Italia', '<p style=\"margin-left:0px;\">El equipo de Milán, <a href=\"https://www.espn.com.ve/futbol/posiciones/_/league/ita.1/serie-a-de-italia\"><strong>tercero en la</strong> <strong>Serie A</strong></a> con 66 puntos en 36 partidos disputados, llega a la definición motivado por llegar a la final de la <a href=\"https://www.espn.com.ve/futbol/liga/_/nombre/uefa.champions\"><strong>UEFA Champions League</strong></a> tras <a href=\"https://www.espn.com.ve/futbol/reporte/_/juegoId/668476\"><strong>eliminar en semis a su archirrival AC Milan</strong></a>. La definición continental <a href=\"https://www.espn.com.ve/futbol/champions-league/nota/_/id/12067541/lautaro-martinez-y-julian-alvarez-a-un-paso-doblete-champions-mundial\"><strong>frente al poderoso Manchester City inglés será el próximo sábado 10 de junio</strong></a> en el Estadio Olímpico Atatürk de Estambul.</p><p style=\"margin-left:0px;\">El conjunto de Simone Inzaghi, con <a href=\"https://www.espn.com.ve/futbol/champions-league/nota/_/id/12060568/lautaro-martinez-mundial-final-champions-league-inter-milan\"><strong>Lautaro Martínez en plano estrella en sus filas</strong></a>, llega a la final de la Copa tras eliminar a <a href=\"https://www.espn.com.ve/futbol/equipo/_/id/111/juventus\"><strong>Juventus</strong></a>, luego de ganar la ida 1-0 y empatar en la vuelta 1-1.</p><p style=\"margin-left:0px;\">Por su parte, el equipo de Vincenzo Italiano, undécimo en Serie A con 50 puntos en la tabla de posiciones, dejó atrás al <a href=\"https://www.espn.com.ve/futbol/equipo/_/id/4050/cremonese\"><strong>Cremonese</strong></a> en semifinales tras cerrar la eliminatoria con un global de 2-0.</p>', '', '', 'inter-y-fiorentina-definen-la-copa-italia', 0, '2023-05-05 03:28:38firefox-logopng.png', 'PUBLISHED', '2023-05-05 00:17:55', '2023-05-24 23:00:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telhome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telmovil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortdescription` text COLLATE utf8mb4_unicode_ci,
  `emailPaypal` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombrePaypal` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailBinance` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userIdBinance` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('VERIFIED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `nombre`, `surname`, `direccion`, `pais`, `estado`, `ciudad`, `telhome`, `telmovil`, `facebook`, `instagram`, `twitter`, `linkedin`, `shortdescription`, `emailPaypal`, `nombrePaypal`, `emailBinance`, `userIdBinance`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super', 'description', NULL, 'venezuela', 'DF', 'Caracas', '+112345677', '+112345677', '@malcolm', '@malcolm', '@malcolm', '@malcolm', 'superadmin, web development, artist', NULL, NULL, NULL, NULL, NULL, 'PENDING', '2023-05-05 00:19:37', '2023-05-30 01:53:35'),
(2, 2, 'admin', 'nistrador', NULL, 'fdsafds', 'fsdfsd', 'fsdfsd', 'fsdfds', 'fdsfds', NULL, NULL, NULL, NULL, 'fdsfdfs', NULL, NULL, NULL, NULL, NULL, 'PENDING', '2023-05-28 22:28:29', '2023-05-30 01:55:28'),
(3, 3, 'Edorir', 'editor', NULL, 'venezuela', 'dc', 'caracas', '1234', '1234', NULL, NULL, NULL, NULL, 'editor', NULL, NULL, NULL, NULL, '2023-05-29 21:59:093jpg.jpg', 'PENDING', '2023-05-30 01:57:24', '2023-05-30 01:59:16'),
(4, 6, 'Test', 'testdas', NULL, 'venezuela', 'df', 'ads', '1233232', '123344', NULL, NULL, NULL, NULL, 'adssad', NULL, NULL, NULL, NULL, NULL, 'PENDING', '2023-05-30 02:04:59', '2023-05-30 02:24:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('SUPERADMIN','ADMIN','MEMBER','EDITOR','GUEST') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'GUEST',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `role`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadministrador', 'SUPERADMIN', 'superadmin@superadmin.com', '2023-05-05 00:15:19', '$2y$10$9S.PK9uGslpfFpwOPlYGIeYUy7NPoCfTybHXOuoILefx1V3tVyyk.', NULL, NULL, '2023-05-05 00:15:19', '2023-05-05 00:15:20', NULL),
(2, 'administrador', 'ADMIN', 'admin@admin.com', '2023-05-05 00:15:19', '$2y$10$vvgjJcFVl1uWsmFpCS5S4uEv//kzUdIdfpMEpJHFFjfL4KMCIeuGe', NULL, NULL, '2023-05-05 00:15:19', '2023-05-05 00:15:20', NULL),
(3, 'editor', 'EDITOR', 'editor@editor.com', '2023-05-05 00:15:19', '$2y$10$5yZoekexAueBBkfAKaChq.DF79qVNDWoRnZWzKHEMIEpuKUOBESNG', NULL, NULL, '2023-05-05 00:15:19', '2023-05-05 00:15:20', NULL),
(4, 'miembro', 'MEMBER', 'miembro@miembro.com', '2023-05-05 00:15:19', '$2y$10$fm/1tzBCw8/OF82lbtszXelqlpBT/8TpwBIn1iLekCJOeAROUXdau', NULL, NULL, '2023-05-05 00:15:19', '2023-05-05 00:15:20', NULL),
(5, 'invitado', 'GUEST', 'invitado@invitado.com', '2023-05-05 00:15:20', '$2y$10$sCocILm2gXrx3AZ6in8X8OMGsBk4TMl/V2K7T2PK47IyUT1AF2Bcy', NULL, NULL, '2023-05-05 00:15:20', '2023-05-05 00:15:20', NULL),
(6, 'test', 'MEMBER', 'test@test.com', NULL, '$2y$10$aRasv62nMfN/HADi3oZN..DoGo3Mo0nDEl.7SEy2LI1STveAXnsXG', NULL, NULL, '2023-05-12 03:03:52', '2023-05-12 05:20:05', NULL),
(7, 'test1', 'EDITOR', 'test1@test.com', NULL, '$2y$10$t28ihA9JsDVc8lUMFG3kHOYWn2MLiEBrm2JqSSAOM2.sEAuosNTJS', NULL, NULL, '2023-05-12 03:04:58', '2023-05-12 03:04:58', NULL),
(8, 'escritor', 'EDITOR', 'escrito@escritor.com', NULL, '$2y$10$Frvfxlgs3ZNGlFZJ8sOAl.ccxN3pKaqbcMk0NAh2NXWse4/WmhpXW', NULL, NULL, '2023-05-12 03:07:33', '2023-05-12 03:07:33', NULL),
(9, 'test', 'MEMBER', 'test@gmail.com', NULL, '$2y$10$fery9/77wtcWUx33SSZxzu.rDSflPspGiyTd3uK6JV443RNacr6vu', NULL, NULL, '2023-05-24 21:18:07', '2023-05-24 21:19:11', NULL),
(10, 'editorDaniel', 'EDITOR', 'dan@gmail.com', NULL, '$2y$10$DodBMtpSlaNrSVStzvlpWuRW2BBD4kunX2xepc9fD0O4Ny36B3EXa', NULL, NULL, '2023-05-24 21:20:09', '2023-05-24 21:20:09', NULL),
(12, 'daniel', 'EDITOR', 'dani@gmail.com', NULL, '$2y$10$O9FE/JIQcdmZ9m0gSLXK/etVs8kQmyZH1y7Nf2ev7NKKjMtwGjzyu', NULL, NULL, '2023-05-24 23:16:18', '2023-05-24 23:19:46', NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usuarios` (
`id` bigint(20) unsigned
,`username` varchar(255)
,`role` enum('SUPERADMIN','ADMIN','MEMBER','EDITOR','GUEST')
,`email` varchar(255)
,`email_verified_at` timestamp
,`password` varchar(255)
,`is_active` tinyint(1)
,`remember_token` varchar(100)
,`created_at` timestamp
,`updated_at` timestamp
,`deleted_at` timestamp
);

-- --------------------------------------------------------

--
-- Estructura para la vista `usuarios`
--
DROP TABLE IF EXISTS `usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuarios`  AS SELECT `users`.`id` AS `id`, `users`.`username` AS `username`, `users`.`role` AS `role`, `users`.`email` AS `email`, `users`.`email_verified_at` AS `email_verified_at`, `users`.`password` AS `password`, `users`.`is_active` AS `is_active`, `users`.`remember_token` AS `remember_token`, `users`.`created_at` AS `created_at`, `users`.`updated_at` AS `updated_at`, `users`.`deleted_at` AS `deleted_at` FROM `users` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `condicions`
--
ALTER TABLE `condicions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `condicions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follows_profile_id_foreign` (`profile_id`),
  ADD KEY `follows_follow_id_foreign` (`follow_id`),
  ADD KEY `follows_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_metodo_id_foreign` (`metodo_id`),
  ADD KEY `payments_currency_id_foreign` (`currency_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_plan_id_foreign` (`plan_id`);

--
-- Indices de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_currency_id_foreign` (`currency_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plans_currency_id_foreign` (`currency_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `condicions`
--
ALTER TABLE `condicions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `condicions`
--
ALTER TABLE `condicions`
  ADD CONSTRAINT `condicions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_follow_id_foreign` FOREIGN KEY (`follow_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_metodo_id_foreign` FOREIGN KEY (`metodo_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
