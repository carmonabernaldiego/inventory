-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_inventory
CREATE DATABASE IF NOT EXISTS `db_inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_inventory`;

-- Volcando estructura para tabla db_inventory.branches
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.branches: ~0 rows (aproximadamente)
DELETE FROM `branches`;

-- Volcando estructura para tabla db_inventory.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.categories: ~20 rows (aproximadamente)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(34, 'Alimentos secos', 1, '2023-04-16 03:14:24', '2023-04-16 03:14:24'),
	(35, 'Productos enlatados', 1, '2023-04-16 03:14:31', '2023-04-16 03:14:31'),
	(36, 'Bebidas no alcohólicas', 1, '2023-04-16 03:14:38', '2023-04-16 03:14:38'),
	(37, 'Bebidas alcohólicas', 1, '2023-04-16 03:14:44', '2023-04-16 03:14:44'),
	(38, 'Dulces y botanas', 1, '2023-04-16 03:14:50', '2023-04-16 03:14:50'),
	(39, 'Productos de panadería', 1, '2023-04-16 03:14:58', '2023-04-16 03:14:58'),
	(40, 'Lácteos y huevos', 1, '2023-04-16 03:15:04', '2023-04-16 03:15:04'),
	(41, 'Carnes y mariscos', 1, '2023-04-16 03:15:13', '2023-04-16 03:15:13'),
	(42, 'Frutas y verduras', 1, '2023-04-16 03:15:22', '2023-04-16 03:15:22'),
	(43, 'Productos de limpieza', 1, '2023-04-16 03:15:36', '2023-04-16 03:15:36'),
	(44, 'Cuidado personal', 1, '2023-04-16 03:15:43', '2023-04-16 03:15:43'),
	(45, 'Electrodomésticos', 1, '2023-04-16 03:15:49', '2023-04-16 03:15:49'),
	(46, 'Tecnología y electrónica', 1, '2023-04-16 03:15:57', '2023-04-16 03:15:57'),
	(47, 'Deportes y aire libre', 1, '2023-04-16 03:16:05', '2023-04-16 03:16:05'),
	(48, 'Juguetes y juegos', 1, '2023-04-16 03:16:11', '2023-04-16 03:16:11'),
	(49, 'Moda y accesorios', 1, '2023-04-16 03:16:17', '2023-04-16 03:16:17'),
	(50, 'Automotriz', 1, '2023-04-16 03:16:23', '2023-04-16 03:16:23'),
	(51, 'Mascotas', 1, '2023-04-16 03:16:29', '2023-04-16 03:16:29'),
	(52, 'Artículos para el hogar y jardín', 1, '2023-04-16 03:16:35', '2023-04-16 03:16:35'),
	(53, 'Productos de conveniencia', 1, '2023-04-16 03:16:41', '2023-04-16 03:16:41');

-- Volcando estructura para tabla db_inventory.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.companies: ~0 rows (aproximadamente)
DELETE FROM `companies`;
INSERT INTO `companies` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
	(1, 'StockInventarios', '9611702915', 'Calle 10 #123, Colonia San Pedro, Ciudad de México, Código Postal 01230.', NULL, '2023-04-17 05:35:09');

-- Volcando estructura para tabla db_inventory.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.customers: ~16 rows (aproximadamente)
DELETE FROM `customers`;
INSERT INTO `customers` (`id`, `customer_name`, `email`, `phone`, `address`, `status`, `created_at`, `updated_at`) VALUES
	(37, 'Juan Pérez', 'juan.perez@example.com', '555-1234', 'Calle 1, Colonia Centro, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(38, 'María Rodríguez', 'maria.rodriguez@example.com', '555-5678', 'Calle 2, Colonia Condesa, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(39, 'Pedro García', 'pedro.garcia@example.com', '555-9876', 'Calle 3, Colonia Roma, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(40, 'Ana Hernández', 'ana.hernandez@example.com', '5552468', 'Calle 4, Colonia Narvarte, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 04:36:26'),
	(41, 'Jorge Martínez', 'jorge.martinez@example.com', '555-3691', 'Calle 5, Colonia Santa Fe, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(42, 'Laura González', 'laura.gonzalez@example.com', '555-5555', 'Calle 6, Colonia Polanco, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(43, 'Miguel Álvarez', 'miguel.alvarez@example.com', '555-7777', 'Calle 7, Colonia Juárez, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(44, 'Carmen Flores', 'carmen.flores@example.com', '555-1212', 'Calle 8, Colonia Coyoacán, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(45, 'José García', 'jose.garcia@example.com', '555-7777', 'Calle 9, Colonia Del Valle, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(46, 'Fernanda González', 'fernanda.gonzalez@example.com', '555-2345', 'Calle 10, Colonia San Ángel, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(47, 'Diego Torres', 'diego.torres@example.com', '555-4567', 'Calle 11, Colonia Santa María la Ribera, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(48, 'Carla Hernández', 'carla.hernandez@example.com', '555-1111', 'Calle 12, Colonia Tabacalera, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(49, 'Raúl Díaz', 'raul.diaz@example.com', '555-2222', 'Calle 13, Colonia Doctores, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(50, 'Sofía García', 'sofia.garcia@example.com', '555-3333', 'Calle 14, Colonia Lindavista, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(51, 'Héctor Jiménez', 'hector.jimenez@example.com', '555-4444', 'Calle 15, Colonia Vallejo, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05'),
	(52, 'Diana Martínez', 'diana.martinez@example.com', '555-5555', 'Calle 16, Colonia Industrial, Ciudad de México', 1, '2023-04-17 02:08:05', '2023-04-17 02:08:05');

-- Volcando estructura para tabla db_inventory.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.menus: ~15 rows (aproximadamente)
DELETE FROM `menus`;
INSERT INTO `menus` (`id`, `parent_id`, `name`, `icon`, `menu_url`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Clientes', 'contacts', 'customer.index', 0, '2020-07-29 13:17:51', '2020-07-29 13:17:56'),
	(2, 0, 'Gestión de Productos', 'category', NULL, 0, '2020-07-29 13:17:53', '2020-07-29 13:17:54'),
	(3, 0, 'Gestión de Existencias', 'assignment', NULL, 0, '2020-07-29 13:17:52', '2020-07-29 13:17:54'),
	(4, 0, 'Gestión de usuarios', 'supervised_user_circle', NULL, 0, '2020-07-29 13:17:51', '2020-07-29 13:17:56'),
	(5, 0, 'Reportes', 'receipt_long', 'report.index', 0, '2020-07-29 13:17:52', '2020-07-29 13:17:55'),
	(6, 0, 'Configuración', 'settings', NULL, 0, '2020-07-29 13:17:58', '2020-07-29 13:17:57'),
	(7, 2, 'Categorias', NULL, 'category.index', 0, '2020-07-29 13:17:50', '2020-07-29 13:17:57'),
	(8, 2, 'Productos', NULL, 'product.index', 0, '2020-07-29 13:17:49', '2020-07-29 13:17:59'),
	(9, 2, 'Proveedores', NULL, 'supplier.index', 0, '2020-07-29 13:17:49', '2020-07-29 13:18:00'),
	(10, 3, 'Entradas', NULL, 'stock.index', 0, '2020-07-29 13:17:48', '2020-07-29 13:18:00'),
	(11, 3, 'Salidas / Facturación', NULL, 'invoice.index', 0, '2020-07-29 13:17:47', '2020-07-29 13:18:01'),
	(12, 4, 'Gestión de roles', NULL, 'role.index', 0, '2020-07-29 13:17:46', '2020-07-29 13:17:46'),
	(13, 4, 'Usuarios', NULL, 'user.index', 0, '2020-07-29 13:17:44', '2020-07-29 13:17:44'),
	(14, 6, 'Información de la empresa', NULL, 'company.index', 0, '2020-07-29 13:17:43', '2020-07-29 13:17:45'),
	(15, 6, 'Cambiar la contraseña', NULL, 'password.index', 0, '2020-07-29 13:17:42', '2020-07-29 13:16:37');

-- Volcando estructura para tabla db_inventory.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.migrations: ~16 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2018_12_10_051212_create_products_table', 2),
	(4, '2018_12_10_052440_create_vendors_table', 2),
	(5, '2018_12_10_052501_create_customers_table', 2),
	(6, '2018_12_10_052521_create_stocks_table', 2),
	(7, '2018_12_10_052610_create_sells_table', 2),
	(8, '2018_12_10_052631_create_sell_details_table', 2),
	(9, '2018_12_10_075236_create_branches_table', 2),
	(10, '2018_12_31_160432_create_categories_table', 3),
	(11, '2019_01_12_163604_create_payments_table', 4),
	(12, '2019_01_19_152250_biye--tabl', 5),
	(13, '2019_02_10_113651_create_roles_table', 6),
	(14, '2019_02_10_114632_create_permissions_table', 6),
	(15, '2019_02_10_114735_create_menus_table', 6),
	(16, '2019_02_14_130126_create_companies_table', 7);

-- Volcando estructura para tabla db_inventory.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;

-- Volcando estructura para tabla db_inventory.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sell_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_in` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sell_id` (`sell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.payments: ~2 rows (aproximadamente)
DELETE FROM `payments`;
INSERT INTO `payments` (`id`, `sell_id`, `customer_id`, `user_id`, `date`, `paid_in`, `bank_information`, `amount`, `created_at`, `updated_at`) VALUES
	(56, 51, 40, 12, '2023-04-19', 'efectivo', NULL, 412, '2023-04-17 05:34:02', '2023-04-17 05:34:02'),
	(57, 51, 40, 12, '2023-04-20', 'efectivo', NULL, 0.5, '2023-04-17 05:34:22', '2023-04-17 05:34:22');

-- Volcando estructura para tabla db_inventory.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.permissions: ~45 rows (aproximadamente)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
	(124, 5, 1, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(125, 5, 2, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(126, 5, 3, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(127, 5, 4, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(128, 5, 5, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(129, 5, 6, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(130, 5, 9, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(131, 5, 8, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(132, 5, 7, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(133, 5, 10, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(134, 5, 11, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(135, 5, 12, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(136, 5, 15, '2019-02-23 00:54:16', '2019-02-23 00:54:16'),
	(137, 6, 1, '2019-02-23 03:25:01', '2019-02-23 03:25:01'),
	(138, 6, 3, '2019-02-23 03:25:01', '2019-02-23 03:25:01'),
	(139, 6, 6, '2019-02-23 03:25:01', '2019-02-23 03:25:01'),
	(140, 6, 15, '2019-02-23 03:25:01', '2019-02-23 03:25:01'),
	(706, 4, 11, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(707, 4, 2, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(708, 4, 4, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(709, 4, 15, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(710, 4, 6, '2020-07-31 17:30:54', '2020-07-31 17:30:54'),
	(721, 3, 1, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(722, 3, 9, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(723, 3, 8, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(724, 3, 7, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(725, 3, 2, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(726, 3, 10, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(727, 3, 11, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(728, 3, 3, '2020-11-17 17:03:42', '2020-11-17 17:03:42'),
	(729, 2, 1, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(730, 2, 9, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(731, 2, 8, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(732, 2, 7, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(733, 2, 2, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(734, 2, 10, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(735, 2, 11, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(736, 2, 3, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(737, 2, 12, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(738, 2, 13, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(739, 2, 4, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(740, 2, 5, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(741, 2, 14, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(742, 2, 15, '2021-07-05 20:00:38', '2021-07-05 20:00:38'),
	(743, 2, 6, '2021-07-05 20:00:38', '2021-07-05 20:00:38');

-- Volcando estructura para tabla db_inventory.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.products: ~185 rows (aproximadamente)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `category_id`, `product_name`, `details`, `status`, `created_at`, `updated_at`) VALUES
	(30, 34, 'Arroz blanco de grano largo', 'Este arroz es conocido por su textura suave y delicada, y es ideal para preparar una gran variedad de platos, desde arroz con frijoles hasta sushi. El arroz blanco de grano largo es una excelente fuente de carbohidratos y se puede cocinar fácilmente en una olla de arroz o en una cacerola.', 1, '2023-04-16 03:18:28', '2023-04-16 05:54:34'),
	(31, 34, 'Frijoles negros envasados al vacío', 'Estos frijoles son una excelente fuente de proteínas y fibra, y son un ingrediente popular en muchos platos tradicionales de la cocina latinoamericana, como los frijoles refritos y el chili con carne. Los frijoles negros envasados al vacío son fáciles de almacenar y se pueden preparar en pocos minutos.', 1, '2023-04-16 03:18:43', '2023-04-16 05:54:52'),
	(32, 34, 'Espagueti de trigo', 'El espagueti es un tipo de pasta larga y delgada que se puede combinar con una gran variedad de salsas y acompañamientos. El espagueti de trigo es una opción saludable y nutritiva, ya que es bajo en grasa y alto en carbohidratos complejos. Además, es fácil de cocinar y se puede preparar en pocos minutos.', 1, '2023-04-16 03:18:59', '2023-04-16 05:55:07'),
	(33, 34, 'Avena instantánea', 'La avena es una excelente fuente de fibra y proteína, y es un desayuno saludable y reconfortante para comenzar el día. La avena instantánea es una versión rápida y fácil de preparar de la avena tradicional, ya que se cocina en pocos minutos y se puede personalizar con una gran variedad de ingredientes, como frutas frescas, nueces y miel.', 1, '2023-04-16 03:28:19', '2023-04-16 05:55:31'),
	(49, 34, 'Cereal de maíz en hojuelas', 'El cereal de maíz en hojuelas es un desayuno clásico que se puede disfrutar en cualquier momento del día. Es un alimento bajo en grasas y azúcares, y una buena fuente de carbohidratos y fibra. Además, es fácil de almacenar y se puede combinar con leche, yogur o frutas para un desayuno completo y saludable.', 1, '2023-04-16 04:07:59', '2023-04-16 05:55:43'),
	(50, 52, 'Mesa de jardín de madera', 'Mesa de jardín de alta calidad con acabado resistente a la intemperie', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(51, 52, 'Set de utensilios de cocina de acero inoxidable', 'Set de utensilios de cocina duradero con mangos ergonómicos', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(52, 52, 'Juego de sábanas de algodón', 'Juego de sábanas de algodón suave y cómodo para un descanso reparador', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(54, 52, 'Aspiradora sin cable', 'Aspiradora inalámbrica con batería recargable y accesorios para limpiar la casa', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(58, 52, 'Macetas de cerámica para plantas', 'Macetas de cerámica elegantes y modernas para plantas de interior y exterior', 1, '2023-04-16 03:18:28', '2023-04-16 03:18:28'),
	(60, 50, 'Llantas deportivas', 'Llantas deportivas diseñadas para brindar un mejor rendimiento y agarre en la carretera', 1, '2023-04-16 15:00:00', '2023-04-16 15:00:00'),
	(61, 50, 'Asiento para automóvil infantil', 'Asiento para automóvil infantil diseñado para brindar seguridad y comodidad a los niños pequeños', 1, '2023-04-16 15:00:00', '2023-04-16 15:00:00'),
	(62, 50, 'Lubricante para motor de alto rendimiento', 'Lubricante para motor de alto rendimiento diseñado para reducir la fricción y el desgaste del motor', 1, '2023-04-16 15:00:00', '2023-04-16 15:00:00'),
	(63, 50, 'Sistema de sonido para automóvil', 'Sistema de sonido para automóvil con altavoces de alta calidad y amplificador potente', 1, '2023-04-16 15:00:00', '2023-04-16 15:00:00'),
	(64, 50, 'Kit de frenos de disco', 'Kit de frenos de disco con discos de freno de alta calidad, pastillas y otros componentes', 1, '2023-04-16 15:00:00', '2023-04-16 15:00:00'),
	(65, 37, 'Cerveza IPA', 'Cerveza de estilo India Pale Ale con un sabor amargo y afrutado', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(66, 37, 'Vino tinto Cabernet Sauvignon', 'Vino tinto seco y afrutado elaborado con uvas de la variedad Cabernet Sauvignon', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(67, 37, 'Whisky escocés', 'Whisky escocés de malta envejecido en barricas de roble para un sabor suave y ahumado', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(68, 37, 'Tequila Reposado', 'Tequila reposado de sabor suave y ahumado, envejecido en barricas de roble para un sabor distintivo', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(69, 37, 'Ginebra London Dry', 'Ginebra destilada con una mezcla de botánicos que le dan un sabor seco y aromático', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(70, 37, 'Ron Añejo', 'Ron añejo de sabor dulce y suave, envejecido en barricas de roble para un sabor único', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(71, 37, 'Vodka Premium', 'Vodka destilado con ingredientes de alta calidad para un sabor suave y refinado', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(72, 37, 'Brandy de Jerez', 'Brandy de Jerez envejecido en barricas de roble para un sabor profundo y complejo', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(73, 37, 'Cognac VSOP', 'Cognac de alta calidad envejecido en barricas de roble para un sabor refinado y elegante', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(74, 37, 'Licor de hierbas', 'Licor de hierbas elaborado con una mezcla de hierbas y especias para un sabor único y complejo', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(75, 36, 'Agua mineral natural', 'Agua mineral natural de manantial con bajo contenido de sales y minerales', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(76, 36, 'Jugo de naranja', 'Jugo de naranja 100% natural sin conservantes ni aditivos', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(77, 36, 'Té verde', 'Té verde de alta calidad con propiedades antioxidantes y beneficios para la salud', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(78, 36, 'Refresco de cola', 'Refresco de cola clásico y refrescante con sabor a caramelo', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(79, 36, 'Refresco de limón', 'Refresco de limón con sabor agridulce y refrescante', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(80, 36, 'Refresco de naranja', 'Refresco de naranja con sabor fresco y natural', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(81, 36, 'Jugo de manzana', 'Jugo de manzana 100% natural sin conservantes ni aditivos', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(82, 36, 'Agua de coco', 'Agua de coco natural y refrescante con propiedades hidratantes y nutritivas', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(83, 36, 'Refresco de toronja', 'Refresco de toronja con sabor fresco y cítrico', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(84, 36, 'Té helado', 'Té helado de sabor refrescante y natural para disfrutar en cualquier momento', 1, '2023-04-17 16:00:00', '2023-04-17 16:00:00'),
	(85, 41, 'Filete de res', 'Filete de res de alta calidad, cortado a mano y sin grasa visible', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(86, 41, 'Salchicha de cerdo', 'Salchicha de cerdo fresca y sabrosa, perfecta para la parrilla o la sartén', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(87, 41, 'Langosta', 'Langosta fresca y de alta calidad, lista para cocinar en casa', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(88, 41, 'Pollo entero', 'Pollo entero fresco y de granja, perfecto para asar o cocinar a la parrilla', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(89, 41, 'Salmón fresco', 'Salmón fresco de alta calidad, perfecto para asar o cocinar a la parrilla', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(90, 41, 'Chuletón de cerdo', 'Chuletón de cerdo fresco y sabroso, cortado a mano y sin grasa visible', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(91, 41, 'Camarones grandes', 'Camarones grandes y frescos, perfectos para cocinar a la parrilla o en la sartén', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(92, 41, 'Costillas de res', 'Costillas de res frescas y sabrosas, perfectas para asar o cocinar a la parrilla', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(93, 41, 'Pescado blanco', 'Pescado blanco fresco y sabroso, perfecto para cocinar a la parrilla o en la sartén', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(94, 41, 'Cordero', 'Carne de cordero fresca y sabrosa, perfecta para asar o cocinar a la parrilla', 1, '2023-04-18 16:00:00', '2023-04-18 16:00:00'),
	(95, 44, 'Champú anticaspa', 'Champú anticaspa con ingredientes naturales para un cabello saludable', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(96, 44, 'Cepillo de dientes eléctrico', 'Cepillo de dientes eléctrico con tecnología de limpieza avanzada para una limpieza profunda', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(97, 44, 'Desodorante en aerosol', 'Desodorante en aerosol con fragancia fresca y duradera para todo el día', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(98, 44, 'Crema hidratante facial', 'Crema hidratante facial con ingredientes naturales para una piel suave y saludable', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(99, 44, 'Gel de ducha', 'Gel de ducha con fragancia refrescante y suave para una piel limpia y suave', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(100, 44, 'Jabón líquido para manos', 'Jabón líquido para manos con ingredientes naturales y fragancia suave', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(101, 44, 'Crema para el cuerpo', 'Crema para el cuerpo con ingredientes naturales y fragancia suave para una piel suave e hidratada', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(102, 44, 'Cepillo de pelo', 'Cepillo de pelo con cerdas suaves para un peinado suave y sin enredos', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(103, 44, 'Crema para manos', 'Crema para manos con ingredientes naturales y fragancia suave para una piel suave e hidratada', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(104, 44, 'Enjuague bucal', 'Enjuague bucal con ingredientes naturales para un aliento fresco y saludable', 1, '2023-04-19 16:00:00', '2023-04-19 16:00:00'),
	(105, 47, 'Raqueta de tenis', 'Raqueta de tenis de alta calidad para un mejor rendimiento en la cancha', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(106, 47, 'Balón de fútbol', 'Balón de fútbol de alta calidad para partidos y entrenamiento', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(107, 47, 'Bicicleta de montaña', 'Bicicleta de montaña de alta calidad para paseos y aventuras al aire libre', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(108, 47, 'Pistola de aire comprimido', 'Pistola de aire comprimido de alta precisión para práctica de tiro deportivo', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(109, 47, 'Bolsa de golf', 'Bolsa de golf de alta calidad para llevar los palos y accesorios', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(110, 47, 'Patines en línea', 'Patines en línea de alta calidad para patinaje recreativo o deportivo', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(111, 47, 'Casco de ciclismo', 'Casco de ciclismo de alta calidad para mayor seguridad y comodidad al andar en bicicleta', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(112, 47, 'Canasta de baloncesto', 'Canasta de baloncesto de alta calidad para jugar en casa o en la cancha', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(113, 47, 'Gafas de sol deportivas', 'Gafas de sol deportivas de alta calidad para protección y comodidad en actividades al aire libre', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(114, 47, 'Bolsa de deporte', 'Bolsa de deporte de alta calidad para llevar tus accesorios y equipo', 1, '2023-04-20 16:00:00', '2023-04-20 16:00:00'),
	(115, 38, 'Papas fritas sabor barbacoa', 'Deliciosas papas fritas con sabor a barbacoa para disfrutar en cualquier momento', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(116, 38, 'Cacahuates salados', 'Cacahuates tostados y salados para picar en cualquier momento', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(117, 38, 'Galletas de chocolate', 'Galletas de chocolate suaves y deliciosas para disfrutar con un vaso de leche', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(118, 38, 'Chocolates surtidos', 'Chocolates de diferentes sabores y texturas para satisfacer cualquier antojo', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(119, 38, 'Paletas de caramelo', 'Paletas de caramelo con diferentes sabores para disfrutar en cualquier momento', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(120, 38, 'Chicles sabor menta', 'Chicles sabor menta para refrescar el aliento y disfrutar de un sabor agradable', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(121, 38, 'Palomitas de maíz', 'Palomitas de maíz para disfrutar en casa mientras ves una película', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(122, 38, 'Caramelos de goma', 'Caramelos de goma con diferentes formas y sabores para disfrutar en cualquier momento', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(123, 38, 'Nachos con queso', 'Nachos crujientes con queso fundido para disfrutar con amigos y familia', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(124, 38, 'Churros rellenos', 'Churros rellenos de crema para disfrutar como postre o antojo', 1, '2023-04-21 16:00:00', '2023-04-21 16:00:00'),
	(125, 45, 'Licuadora de alta velocidad', 'Licuadora con motor de alta velocidad para preparar batidos y smoothies en pocos minutos', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(126, 45, 'Aspiradora robot', 'Aspiradora inteligente y autónoma para mantener la casa limpia con poco esfuerzo', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(127, 45, 'Cafetera de goteo', 'Cafetera de goteo programable para disfrutar de un café recién hecho en cualquier momento', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(128, 45, 'Horno tostador', 'Horno tostador para cocinar o calentar alimentos de manera rápida y eficiente', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(129, 45, 'Lavadora de carga frontal', 'Lavadora de carga frontal de alta eficiencia para limpiar la ropa con menos agua y energía', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(130, 45, 'Microondas de acero inoxidable', 'Microondas de alta calidad con acabado en acero inoxidable para cocinar y calentar alimentos en pocos minutos', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(131, 45, 'Plancha de vapor', 'Plancha de vapor con tecnología de alta eficiencia para planchar la ropa sin arrugas', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(132, 45, 'Refrigerador de doble puerta', 'Refrigerador de alta calidad con doble puerta y múltiples compartimentos para mantener los alimentos frescos y organizados', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(133, 45, 'Secadora de ropa', 'Secadora de ropa de alta eficiencia para secar la ropa de manera rápida y fácil', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(134, 45, 'Televisor inteligente', 'Televisor inteligente de alta definición con múltiples funciones y aplicaciones para disfrutar de tus programas y películas favoritas', 1, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
	(135, 42, 'Manzanas Gala', 'Manzanas frescas y dulces de la variedad Gala, ideales para comer solas o cocinar', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(136, 42, 'Plátanos', 'Plátanos frescos y maduros para disfrutar como snack o para cocinar', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(137, 42, 'Pimientos verdes', 'Pimientos verdes frescos y crujientes para agregar sabor y color a tus platillos', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(138, 42, 'Lechuga romana', 'Lechuga fresca y crujiente de la variedad romana, ideal para ensaladas y sándwiches', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(139, 42, 'Zanahorias', 'Zanahorias frescas y crocantes para cocinar o comer como snack', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(140, 42, 'Fresas', 'Fresas frescas y dulces para disfrutar solas o en postres', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(141, 42, 'Espinacas', 'Espinacas frescas y saludables para preparar ensaladas, sopas o como guarnición', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(142, 42, 'Cebollas', 'Cebollas frescas y aromáticas para cocinar y agregar sabor a tus platillos', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(143, 42, 'Tomates', 'Tomates frescos y jugosos para preparar ensaladas, salsas o como guarnición', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(144, 42, 'Aguacates', 'Aguacates frescos y maduros para preparar guacamole o disfrutar como snack', 1, '2023-04-23 16:00:00', '2023-04-23 16:00:00'),
	(145, 48, 'Rompecabezas de 1000 piezas', 'Rompecabezas de alta calidad con 1000 piezas para horas de diversión y desafío', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(146, 48, 'Set de bloques de construcción', 'Set de bloques de construcción para niños, con múltiples piezas y colores', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(147, 48, 'Muñeca Barbie', 'Muñeca Barbie clásica con accesorios y vestuario para jugar y crear historias', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(148, 48, 'Juego de mesa Monopoly', 'Juego de mesa clásico Monopoly para divertirse en familia o con amigos', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(149, 48, 'Peluche de unicornio', 'Peluche de unicornio suave y adorable para abrazar y jugar', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(150, 48, 'Carro de control remoto', 'Carro de control remoto con múltiples funciones para correr y saltar en terrenos difíciles', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(151, 48, 'Juego de mesa Jenga', 'Juego de mesa clásico Jenga para poner a prueba la habilidad y la paciencia', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(152, 48, 'Puzzle de cubo Rubik', 'Puzzle de cubo Rubik para desafiar el ingenio y la destreza manual', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(153, 48, 'Muñeco de peluche de Mickey Mouse', 'Muñeco de peluche de Mickey Mouse con detalles y calidad excepcionales', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(154, 48, 'Kit de ciencia para niños', 'Kit de ciencia para niños con experimentos divertidos y educativos', 1, '2023-04-23 18:00:00', '2023-04-23 18:00:00'),
	(155, 40, 'Leche entera', 'Leche entera fresca y natural, ideal para beber o para usar en recetas', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(156, 40, 'Queso cheddar', 'Queso cheddar fresco y delicioso, ideal para sándwiches y hamburguesas', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(157, 40, 'Huevo blanco', 'Huevo blanco fresco y saludable, ideal para cocinar y hacer huevos estrellados', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(158, 40, 'Mantequilla sin sal', 'Mantequilla fresca y cremosa sin sal, ideal para cocinar y para untar en pan', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(159, 40, 'Yogurt griego', 'Yogurt griego natural y cremoso, ideal para comer solo o para usar en recetas', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(160, 40, 'Leche sin lactosa', 'Leche sin lactosa fresca y natural, ideal para personas con intolerancia a la lactosa', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(161, 40, 'Crema batida', 'Crema batida fresca y suave, ideal para postres y para decorar pasteles', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(162, 40, 'Queso parmesano', 'Queso parmesano rallado y fresco, ideal para agregar sabor y textura a tus platillos', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(163, 40, 'Huevo orgánico', 'Huevo orgánico fresco y saludable, ideal para personas que prefieren alimentos orgánicos', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(164, 40, 'Queso cottage', 'Queso cottage fresco y suave, ideal para ensaladas y como sustituto de la crema', 1, '2023-04-23 20:00:00', '2023-04-23 20:00:00'),
	(165, 51, 'Comida para perros', 'Comida para perros de alta calidad y nutritiva, enriquecida con vitaminas y minerales', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(166, 51, 'Collar para gatos', 'Collar para gatos con campana y ajuste cómodo, ideal para identificar a tu mascota', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(167, 51, 'Juguete para perros', 'Juguete resistente para perros, con diferentes texturas y sonidos para mantenerlo entretenido', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(168, 51, 'Cama para gatos', 'Cama suave y cómoda para gatos, con diseños divertidos y colores llamativos', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(169, 51, 'Arena para gatos', 'Arena para gatos de alta calidad, con absorción rápida y control de olores efectivo', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(170, 51, 'Correa para perros', 'Correa para perros resistente y ajustable, ideal para pasear a tu mascota con seguridad', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(171, 51, 'Juguete para gatos', 'Juguete para gatos con plumas y sonidos, ideal para estimular su instinto de caza', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(172, 51, 'Comida para gatos', 'Comida para gatos de alta calidad y nutritiva, enriquecida con vitaminas y minerales', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(173, 51, 'Casa para perros', 'Casa para perros resistente y duradera, con techo impermeable y ventilación adecuada', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(174, 51, 'Shampoo para perros', 'Shampoo para perros de diferentes razas y pelajes, con fórmulas suaves y fragancias agradables', 1, '2023-04-24 16:00:00', '2023-04-24 16:00:00'),
	(175, 49, 'Camisa de algodón', 'Camisa de algodón cómoda y elegante, ideal para ocasiones formales e informales', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(176, 49, 'Cinturón de cuero', 'Cinturón de cuero de alta calidad, con hebilla resistente y diseño elegante', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(177, 49, 'Bolso de mano', 'Bolso de mano elegante y espacioso, con compartimentos y bolsillos internos', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(178, 49, 'Pantalón de mezclilla', 'Pantalón de mezclilla clásico y cómodo, ideal para un look casual y relajado', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(179, 49, 'Reloj de pulsera', 'Reloj de pulsera elegante y funcional, con correa ajustable y cronómetro', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(180, 49, 'Zapatos de vestir', 'Zapatos de vestir elegantes y cómodos, con suela antideslizante y diseño clásico', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(181, 49, 'Pañuelo de seda', 'Pañuelo de seda suave y elegante, ideal para complementar un look formal', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(182, 49, 'Blusa de encaje', 'Blusa de encaje delicada y femenina, ideal para un look romántico y elegante', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(183, 49, 'Bufanda de lana', 'Bufanda de lana suave y abrigadora, ideal para protegerse del frío en invierno', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(184, 49, 'Gafas de sol', 'Gafas de sol elegantes y funcionales, con protección UV y diseño moderno', 1, '2023-04-25 22:00:00', '2023-04-25 22:00:00'),
	(185, 53, 'Baterías AA', 'Baterías AA de larga duración para todo tipo de dispositivos electrónicos', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(186, 53, 'Cargador portátil para celular', 'Cargador portátil con batería recargable y puerto USB para cargar cualquier dispositivo móvil', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(187, 53, 'Linterna LED', 'Linterna LED resistente y duradera, ideal para actividades al aire libre y emergencias', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(188, 53, 'Pilas AAA', 'Pilas AAA de alta calidad y larga duración, para todo tipo de dispositivos electrónicos', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(189, 53, 'Adaptador de corriente universal', 'Adaptador de corriente universal con múltiples enchufes para usar en cualquier país del mundo', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(190, 53, 'Paraguas plegable', 'Paraguas plegable ligero y resistente, ideal para llevar en la bolsa o el bolso', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(191, 53, 'Candado de combinación', 'Candado de combinación resistente y fácil de usar, ideal para asegurar maletas y equipaje', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(192, 53, 'Cinta adhesiva transparente', 'Cinta adhesiva transparente resistente y duradera, ideal para todo tipo de tareas en el hogar y la oficina', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(193, 53, 'Tapones para los oídos', 'Tapones para los oídos de espuma suave y cómoda, ideales para reducir el ruido y proteger los oídos', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(194, 53, 'Repelente de insectos', 'Repelente de insectos efectivo y duradero, ideal para actividades al aire libre', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(195, 43, 'Limpiador multiusos', 'Limpiador multiusos de alta calidad para todo tipo de superficies, con aroma fresco y duradero', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(196, 43, 'Detergente para ropa', 'Detergente para ropa de alta eficacia y suavidad, ideal para prendas delicadas y sensibles', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(197, 43, 'Desinfectante para superficies', 'Desinfectante para superficies de alto rendimiento, que elimina el 99.9% de los gérmenes y bacterias', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(198, 43, 'Limpiador de vidrios', 'Limpiador de vidrios de alta calidad y durabilidad, que deja las superficies limpias y brillantes', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(199, 43, 'Limpiador de alfombras', 'Limpiador de alfombras profesional de alta eficacia, que elimina manchas y olores de mascotas', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(200, 43, 'Limpiador de baños', 'Limpiador de baños de alto rendimiento, que elimina el sarro y la suciedad de las superficies', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(201, 43, 'Jabón líquido para manos', 'Jabón líquido para manos de alta calidad y fragancia, que deja las manos suaves y limpias', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(202, 43, 'Esponjas de limpieza', 'Esponjas de limpieza de alta calidad y durabilidad, para todo tipo de tareas de limpieza en el hogar', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(203, 43, 'Desodorante para ambientes', 'Desodorante para ambientes de larga duración, que neutraliza los malos olores y deja un aroma fresco', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(204, 43, 'Cepillo de limpieza', 'Cepillo de limpieza de alta calidad y durabilidad, para todo tipo de superficies y tareas de limpieza', 1, '2023-05-01 16:00:00', '2023-05-01 16:00:00'),
	(205, 39, 'Pan francés', 'Pan francés fresco y crujiente, elaborado con ingredientes de alta calidad', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(206, 39, 'Croissant de mantequilla', 'Croissant de mantequilla tierno y delicado, perfecto para un desayuno o merienda especial', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(207, 39, 'Donas de chocolate', 'Donas de chocolate suaves y esponjosas, con un glaseado de chocolate intenso', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(208, 39, 'Pastel de zanahoria', 'Pastel de zanahoria húmedo y esponjoso, con una capa de frosting de queso crema', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(209, 39, 'Tarta de manzana', 'Tarta de manzana fresca y dulce, con una masa crujiente y una capa de manzanas caramelizadas', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(210, 39, 'Pan de plátano', 'Pan de plátano húmedo y suave, con trozos de plátano fresco y nueces', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(211, 39, 'Galletas de avena', 'Galletas de avena suaves y crujientes, con trozos de chocolate y pasas', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(212, 39, 'Baguette', 'Baguette fresca y crujiente, con una corteza dorada y una miga suave', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(213, 39, 'Conchas', 'Conchas dulces y suaves, con un glaseado de vainilla y un patrón de concha en la parte superior', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(214, 39, 'Pan de queso', 'Pan de queso suave y esponjoso, con trozos de queso cheddar derretido', 1, '2023-05-02 15:00:00', '2023-05-02 15:00:00'),
	(215, 35, 'Atún en agua', 'Atún enlatado en agua, rico en proteínas y bajo en grasas', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(216, 35, 'Frijoles negros', 'Frijoles negros enlatados, listos para usar en cualquier receta', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(217, 35, 'Maíz dulce', 'Maíz dulce enlatado, perfecto para ensaladas o como acompañamiento', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(218, 35, 'Sopa de tomate', 'Sopa de tomate enlatada, rica y reconfortante, lista en minutos', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(219, 35, 'Champiñones enlatados', 'Champiñones enlatados, listos para usar en cualquier receta de cocina', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(220, 35, 'Pimientos enlatados', 'Pimientos enlatados, perfectos para añadir a pizzas, salsas y ensaladas', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(221, 35, 'Sardinas en aceite', 'Sardinas enlatadas en aceite, ricas en ácidos grasos omega-3', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(222, 35, 'Chícharos enlatados', 'Chícharos enlatados, perfectos para añadir a guisos y arroces', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(223, 35, 'Pasta de tomate', 'Pasta de tomate enlatada, concentrado de tomate ideal para salsas y guisos', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(224, 35, 'Frijoles refritos', 'Frijoles refritos enlatados, ideales para preparar tacos y burritos', 1, '2023-05-02 15:15:00', '2023-05-02 15:15:00'),
	(225, 46, 'Smartphone Samsung Galaxy S21', 'Smartphone Samsung Galaxy S21 con pantalla de alta resolución, cámara de alta calidad y procesador rápido', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(226, 46, 'Laptop HP Pavilion', 'Laptop HP Pavilion con procesador potente, pantalla de alta resolución y capacidad de almacenamiento ampliable', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(227, 46, 'Televisor LG OLED 4K', 'Televisor LG OLED 4K con pantalla grande, colores vivos y brillantes, y tecnología de sonido envolvente', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(228, 46, 'Tablet Apple iPad Pro', 'Tablet Apple iPad Pro con pantalla retina, procesador rápido y batería de larga duración', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(229, 46, 'Cámara Canon EOS Rebel T7', 'Cámara Canon EOS Rebel T7 con sensor de alta resolución, modo de disparo continuo y capacidad de grabación de video en HD', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(230, 46, 'Consola de juegos Xbox Series X', 'Consola de juegos Xbox Series X con procesador rápido, gráficos de alta calidad y capacidad de jugar en línea', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(231, 46, 'Smartwatch Samsung Galaxy Watch 4', 'Smartwatch Samsung Galaxy Watch 4 con pantalla de alta resolución, seguimiento de la actividad física y capacidad de hacer llamadas y enviar mensajes', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(232, 46, 'Altavoz inteligente Amazon Echo Dot', 'Altavoz inteligente Amazon Echo Dot con asistente virtual Alexa integrado, control por voz y conexión inalámbrica', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(233, 46, 'Impresora HP Envy 6055', 'Impresora HP Envy 6055 con capacidad de imprimir en color, escanear y copiar, y conexión inalámbrica', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00'),
	(234, 46, 'Audífonos inalámbricos Apple AirPods Pro', 'Audífonos inalámbricos Apple AirPods Pro con cancelación de ruido activa, sonido de alta calidad y resistencia al agua y al sudor', 1, '2023-05-02 15:30:00', '2023-05-02 15:30:00');

-- Volcando estructura para tabla db_inventory.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.roles: ~4 rows (aproximadamente)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
	(2, 'Superadministrador', '2019-02-12 03:59:54', '2023-04-17 04:53:28'),
	(3, 'Gerente', '2019-02-13 00:07:41', '2023-04-17 04:35:56'),
	(4, 'Vendedor', '2019-02-13 01:34:11', '2023-04-17 04:36:08'),
	(5, 'Controlador', '2019-02-13 05:53:15', '2023-04-17 04:41:36');

-- Volcando estructura para tabla db_inventory.sells
CREATE TABLE IF NOT EXISTS `sells` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `branch_id` int NOT NULL DEFAULT '1',
  `total_amount` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT '0',
  `sell_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT '0',
  `payment_method` tinyint NOT NULL DEFAULT '0',
  `payment_status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.sells: ~0 rows (aproximadamente)
DELETE FROM `sells`;
INSERT INTO `sells` (`id`, `user_id`, `customer_id`, `branch_id`, `total_amount`, `paid_amount`, `sell_date`, `discount_amount`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
	(51, 12, 40, 1, 412.5, 412.5, '2023-04-17', 0, 2, 1, '2023-04-17 05:33:31', '2023-04-17 05:34:22');

-- Volcando estructura para tabla db_inventory.sell_details
CREATE TABLE IF NOT EXISTS `sell_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int NOT NULL,
  `sell_id` int NOT NULL,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `chalan_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold_quantity` int NOT NULL,
  `buy_price` double NOT NULL,
  `sold_price` double NOT NULL,
  `total_buy_price` double NOT NULL,
  `total_sold_price` double NOT NULL,
  `discount` double NOT NULL,
  `discount_type` tinyint NOT NULL,
  `discount_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_id` (`stock_id`),
  KEY `selling_date` (`selling_date`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `user_id` (`user_id`),
  KEY `sell_id` (`sell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.sell_details: ~0 rows (aproximadamente)
DELETE FROM `sell_details`;
INSERT INTO `sell_details` (`id`, `stock_id`, `sell_id`, `product_id`, `category_id`, `vendor_id`, `user_id`, `chalan_no`, `selling_date`, `customer_id`, `sold_quantity`, `buy_price`, `sold_price`, `total_buy_price`, `total_sold_price`, `discount`, `discount_type`, `discount_amount`, `created_at`, `updated_at`) VALUES
	(70, 55, 51, 30, 34, 81, 12, '2023-04-16', '2023-04-17', '40', 33, 9.8, 12.5, 323.40000000000003, 412.5, 0, 1, 0, '2023-04-17 05:33:31', '2023-04-17 05:33:31');

-- Volcando estructura para tabla db_inventory.stocks
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `chalan_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `buying_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `stock_quantity` int NOT NULL,
  `current_quantity` int NOT NULL DEFAULT '0',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `stock_quantity` (`stock_quantity`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.stocks: ~2 rows (aproximadamente)
DELETE FROM `stocks`;
INSERT INTO `stocks` (`id`, `category_id`, `product_code`, `product_id`, `vendor_id`, `user_id`, `chalan_no`, `buying_price`, `selling_price`, `discount`, `stock_quantity`, `current_quantity`, `note`, `status`, `created_at`, `updated_at`) VALUES
	(55, 34, '1681681567', 30, 81, 12, '2023-04-16', 9.8, 12.5, 0, 100, 67, NULL, 1, '2023-04-16 22:46:07', '2023-04-17 05:33:31'),
	(56, 37, '1681705778', 67, 81, 12, '2023-04-16', 189.99, 249.99, 0, 48, 48, NULL, 1, '2023-04-17 05:29:38', '2023-04-17 05:29:38');

-- Volcando estructura para tabla db_inventory.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int NOT NULL DEFAULT '1',
  `role_id` int NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.users: ~1 rows (aproximadamente)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `branch_id`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(12, 'Diego Carmona Bernal', 'carmonabernaldiego@gmail.com', '$2y$10$W/nqTuN0X.JaGtGBkpw01OTSL0I3aShYL9QusP8Q5kIZ2AviqQHKC', 1, 2, '6zd4CxMA9RCTnuJaxtyhByrBYJsPfV9GtAB4pJE3Ht6YTsIvQ7ETjUVO1jlv', '2020-07-31 17:27:25', '2023-04-17 05:20:18');

-- Volcando estructura para tabla db_inventory.vendors
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_inventory.vendors: ~11 rows (aproximadamente)
DELETE FROM `vendors`;
INSERT INTO `vendors` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
	(76, 'La Michoacana', '55-1234-5678', 'contacto@lamichoacana.com.mx', 'Av. Insurgentes Sur 1647, Col. San José Insurgentes, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(77, 'El Paraiso del Helado', '55-8765-4321', 'info@elparaisodelhelado.com.mx', 'Calle Gral. Emiliano Zapata 54, Col. San Francisco Chilpan, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(78, 'La Flor de Michoacán', '33-3333-3333', 'ventas@laflordemichoacan.com.mx', 'Calle Sinaloa 1437, Col. Providencia, Guadalajara, Jalisco', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(79, 'Paletería la Victoria', '81-1111-1111', 'contacto@paleterialavictoria.com.mx', 'Av. Chapultepec Sur 177, Col. Americana, Monterrey, Nuevo León', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(80, 'Helados Santa Clara', '55-5555-5555', 'contacto@santaclara.com.mx', 'Av. de los Insurgentes Sur 1395, Col. Insurgentes Mixcoac, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(81, 'La Imperial', '33-2222-2222', 'info@laimperial.com.mx', 'Av. México 2500, Col. Ladrón de Guevara, Guadalajara, Jalisco', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(82, 'Helados Holanda', '55-9876-5432', 'contacto@heladosholanda.com.mx', 'Av. Revolución 1928, Col. San Ángel, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(83, 'Nieve Garrafa', '55-1111-2222', 'ventas@nievegarrafa.com.mx', 'Av. Toluca 124, Col. Olivar de los Padres, CDMX', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(84, 'La Tapatía Helados', '33-4444-4444', 'contacto@latapatiahelados.com.mx', 'Calle Francisco Javier Mina 20, Col. Centro, Guadalajara, Jalisco', '2023-04-16 21:44:30', '2023-04-16 21:44:30'),
	(85, 'La Tradicional', '81-2222-2222', 'info@latradicional.com.mx', 'Calle Padre Mier 1241, Col. Centro, Monterrey, Nuevo León', '2023-04-16 21:44:30', '2023-04-16 21:44:30');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
