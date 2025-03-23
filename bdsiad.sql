-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para siad
CREATE DATABASE IF NOT EXISTS `siad` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `siad`;

-- Volcando estructura para tabla siad.caja_bancos
CREATE TABLE IF NOT EXISTS `caja_bancos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.caja_bancos: ~2 rows (aproximadamente)
INSERT INTO `caja_bancos` (`id`, `nombre`, `tipo`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'BANCO INTERBANK', '2', '1', 'admin', NULL, NULL, NULL),
	(2, 'BANCO CREDITO DEL PERU (BCP)', '2', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.canal_comunicacions
CREATE TABLE IF NOT EXISTS `canal_comunicacions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_referencia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_canal_comunicacions_id` bigint(20) unsigned NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `canal_comunicacions_tipo_canal_comunicacions_id_foreign` (`tipo_canal_comunicacions_id`),
  CONSTRAINT `canal_comunicacions_tipo_canal_comunicacions_id_foreign` FOREIGN KEY (`tipo_canal_comunicacions_id`) REFERENCES `tipo_canal_comunicacions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.canal_comunicacions: ~3 rows (aproximadamente)
INSERT INTO `canal_comunicacions` (`id`, `nombre`, `url_referencia`, `tipo_canal_comunicacions_id`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'WHATSAPP LIMA', 'https://wa.me/51999999999', 1, '1', 'admin', NULL, NULL, NULL),
	(2, 'TELEGRAM OFICIAL', 'https://t.me/siad', 2, '1', 'admin', NULL, NULL, NULL),
	(3, 'FACEBOOK OFICIAL', 'https://m.me/siad', 3, '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.cargos
CREATE TABLE IF NOT EXISTS `cargos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.cargos: ~2 rows (aproximadamente)
INSERT INTO `cargos` (`id`, `nombre`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'ASESOR DE VENTAS', '1', 'admin', NULL, NULL, NULL),
	(2, 'JEFE DE ZONA', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `caja_bancos_id` bigint(20) unsigned NOT NULL,
  `numero_cuenta_bancaria` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cci_cuenta_bancaria` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clientes_player_id_unique` (`player_id`),
  KEY `clientes_caja_bancos_id_foreign` (`caja_bancos_id`),
  CONSTRAINT `clientes_caja_bancos_id_foreign` FOREIGN KEY (`caja_bancos_id`) REFERENCES `caja_bancos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.clientes: ~1 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `player_id`, `dni`, `nombres`, `apellidos`, `email`, `whatsapp`, `direccion`, `celular`, `genero`, `fecha_nacimiento`, `caja_bancos_id`, `numero_cuenta_bancaria`, `cci_cuenta_bancaria`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'NET609', '43206060', 'NICKY SALOMON', 'ENRIQUEZ TORRES', 'enriquez.net@gmail.com', '980148718', 'CALLE LOS SAUCES 123', '980148718', '1', '1985-04-04', 1, '0011-0000-1234567890', '0011-0000-1234567890', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.cuenta_bancarias
CREATE TABLE IF NOT EXISTS `cuenta_bancarias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `caja_bancos_id` bigint(20) unsigned NOT NULL,
  `numero_cuenta` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cci` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuenta_bancarias_caja_bancos_id_foreign` (`caja_bancos_id`),
  CONSTRAINT `cuenta_bancarias_caja_bancos_id_foreign` FOREIGN KEY (`caja_bancos_id`) REFERENCES `caja_bancos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.cuenta_bancarias: ~2 rows (aproximadamente)
INSERT INTO `cuenta_bancarias` (`id`, `caja_bancos_id`, `numero_cuenta`, `cci`, `tipo`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 1, '011-1269121-01', '011-12315-0151-01', '1', '1', 'admin', NULL, NULL, NULL),
	(2, 2, '0803-1269121-01', '0803-12315-0151-01', '2', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.cuenta_clientes
CREATE TABLE IF NOT EXISTS `cuenta_clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint(20) unsigned NOT NULL,
  `denominacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `fecha_caducidad` datetime NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuenta_clientes_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `cuenta_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.cuenta_clientes: ~1 rows (aproximadamente)
INSERT INTO `cuenta_clientes` (`id`, `cliente_id`, `denominacion`, `tipo`, `saldo`, `fecha_caducidad`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 1, 'CUENTA ORDINARIA', '1', 1030.00, '2099-12-01 00:00:00', '1', 'admin', NULL, NULL, '2025-03-23 19:32:45');

-- Volcando estructura para tabla siad.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo_id` bigint(20) unsigned NOT NULL,
  `sueldo` decimal(10,2) NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empleados_cargo_id_foreign` (`cargo_id`),
  CONSTRAINT `empleados_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.empleados: ~1 rows (aproximadamente)
INSERT INTO `empleados` (`id`, `dni`, `nombres`, `apellidos`, `cargo_id`, `sueldo`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, '45678912', 'MARIO', 'MARTINEZ', 1, 1500.00, '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla siad.locals
CREATE TABLE IF NOT EXISTS `locals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.locals: ~1 rows (aproximadamente)
INSERT INTO `locals` (`id`, `nombre`, `direccion`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'LOCAL MIRAFLORES II', 'Av. Larco 1234', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.local_caja_bancos
CREATE TABLE IF NOT EXISTS `local_caja_bancos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `local_id` bigint(20) unsigned NOT NULL,
  `caja_bancos_id` bigint(20) unsigned NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `local_caja_bancos_local_id_foreign` (`local_id`),
  KEY `local_caja_bancos_caja_bancos_id_foreign` (`caja_bancos_id`),
  CONSTRAINT `local_caja_bancos_caja_bancos_id_foreign` FOREIGN KEY (`caja_bancos_id`) REFERENCES `caja_bancos` (`id`),
  CONSTRAINT `local_caja_bancos_local_id_foreign` FOREIGN KEY (`local_id`) REFERENCES `locals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.local_caja_bancos: ~2 rows (aproximadamente)
INSERT INTO `local_caja_bancos` (`id`, `local_id`, `caja_bancos_id`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '1', 'admin', NULL, NULL, NULL),
	(2, 1, 2, '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.local_canals
CREATE TABLE IF NOT EXISTS `local_canals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `local_id` bigint(20) unsigned NOT NULL,
  `canal_comunicacions_id` bigint(20) unsigned NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `local_canals_local_id_foreign` (`local_id`),
  KEY `local_canals_canal_comunicacions_id_foreign` (`canal_comunicacions_id`),
  CONSTRAINT `local_canals_canal_comunicacions_id_foreign` FOREIGN KEY (`canal_comunicacions_id`) REFERENCES `canal_comunicacions` (`id`),
  CONSTRAINT `local_canals_local_id_foreign` FOREIGN KEY (`local_id`) REFERENCES `locals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.local_canals: ~3 rows (aproximadamente)
INSERT INTO `local_canals` (`id`, `local_id`, `canal_comunicacions_id`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '1', 'admin', NULL, NULL, NULL),
	(2, 1, 2, '1', 'admin', NULL, NULL, NULL),
	(3, 1, 3, '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.medio_pagos
CREATE TABLE IF NOT EXISTS `medio_pagos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto_minimo` decimal(10,2) NOT NULL,
  `monto_maximo` decimal(10,2) NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.medio_pagos: ~3 rows (aproximadamente)
INSERT INTO `medio_pagos` (`id`, `nombre`, `alias`, `monto_minimo`, `monto_maximo`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'DEPOSITO BANCARIO', 'DEPOSITO', 0.00, 9999.00, '1', 'admin', NULL, NULL, NULL),
	(2, 'TRANSFERENCIA BANCARIA', 'TRANSFERENCIA', 0.00, 10000.00, '1', 'admin', NULL, NULL, NULL),
	(3, 'AGENTE KASNET', 'AGENTE KASNET', 0.00, 500.00, '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.migrations: ~22 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(107, '2014_10_12_000000_create_users_table', 1),
	(108, '2014_10_12_100000_create_password_resets_table', 1),
	(109, '2019_08_19_000000_create_failed_jobs_table', 1),
	(110, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(111, '2025_03_22_201903_create_caja_bancos_table', 1),
	(112, '2025_03_22_201904_create_clientes_table', 1),
	(113, '2025_03_22_201905_create_locals_table', 1),
	(114, '2025_03_22_201906_create_tipo_documentos_table', 1),
	(115, '2025_03_22_201907_create_tipo_canal_comunicacions_table', 1),
	(116, '2025_03_22_201908_create_series_table', 1),
	(117, '2025_03_22_201909_create_tipo_transaccions_table', 1),
	(118, '2025_03_22_201910_create_medio_pagos_table', 1),
	(119, '2025_03_22_201911_create_cargos_table', 1),
	(120, '2025_03_22_201912_create_monedas_table', 1),
	(121, '2025_03_22_201913_create_empleados_table', 1),
	(122, '2025_03_22_201925_create_cuenta_clientes_table', 1),
	(123, '2025_03_22_201926_create_cuenta_bancarias_table', 1),
	(124, '2025_03_22_201928_create_canal_comunicacions_table', 1),
	(125, '2025_03_22_201929_create_local_canals_table', 1),
	(126, '2025_03_22_201930_create_local_caja_bancos_table', 1),
	(127, '2025_03_22_202051_create_transaccions_table', 1),
	(128, '2025_03_22_202055_create_transaccion_cuenta_bancarias_table', 1);

-- Volcando estructura para tabla siad.monedas
CREATE TABLE IF NOT EXISTS `monedas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `simbolo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.monedas: ~1 rows (aproximadamente)
INSERT INTO `monedas` (`id`, `nombre`, `simbolo`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'NUEVOS SOLES', 'S/', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla siad.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla siad.series
CREATE TABLE IF NOT EXISTS `series` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_documentos_id` bigint(20) unsigned NOT NULL,
  `serie_documento` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_numero` int(11) NOT NULL,
  `locals_id` bigint(20) unsigned NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `series_tipo_documentos_id_foreign` (`tipo_documentos_id`),
  KEY `series_locals_id_foreign` (`locals_id`),
  CONSTRAINT `series_locals_id_foreign` FOREIGN KEY (`locals_id`) REFERENCES `locals` (`id`),
  CONSTRAINT `series_tipo_documentos_id_foreign` FOREIGN KEY (`tipo_documentos_id`) REFERENCES `tipo_documentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.series: ~1 rows (aproximadamente)
INSERT INTO `series` (`id`, `tipo_documentos_id`, `serie_documento`, `ultimo_numero`, `locals_id`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 1, 'V001', 9, 1, '1', 'admin', NULL, NULL, '2025-03-23 19:32:45');

-- Volcando estructura para tabla siad.tipo_canal_comunicacions
CREATE TABLE IF NOT EXISTS `tipo_canal_comunicacions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.tipo_canal_comunicacions: ~3 rows (aproximadamente)
INSERT INTO `tipo_canal_comunicacions` (`id`, `nombre`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'WHATSAPP', '1', 'admin', NULL, NULL, NULL),
	(2, 'TELEGRAM', '1', 'admin', NULL, NULL, NULL),
	(3, 'FACEBOOK MESSENGER', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.tipo_documentos
CREATE TABLE IF NOT EXISTS `tipo_documentos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.tipo_documentos: ~1 rows (aproximadamente)
INSERT INTO `tipo_documentos` (`id`, `nombre`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'VOUCHER INGRESO', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.tipo_transaccions
CREATE TABLE IF NOT EXISTS `tipo_transaccions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.tipo_transaccions: ~2 rows (aproximadamente)
INSERT INTO `tipo_transaccions` (`id`, `nombre`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 'RECARGA DE SALDO', '1', 'admin', NULL, NULL, NULL),
	(2, 'RETIRO DE SALDO', '1', 'admin', NULL, NULL, NULL);

-- Volcando estructura para tabla siad.transaccions
CREATE TABLE IF NOT EXISTS `transaccions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_transaccions_id` bigint(20) unsigned NOT NULL,
  `cuenta_clientes_id` bigint(20) unsigned NOT NULL,
  `clientes_id` bigint(20) unsigned NOT NULL,
  `caja_bancos_id` bigint(20) unsigned NOT NULL,
  `empleados_id` bigint(20) unsigned NOT NULL,
  `locals_id` bigint(20) unsigned NOT NULL,
  `canal_comunicacions_id` bigint(20) unsigned NOT NULL,
  `tipo_documentos_id` bigint(20) unsigned NOT NULL,
  `serie_documento` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_documento` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `hora_emision` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medio_pagos_id` bigint(20) unsigned NOT NULL,
  `monedas_id` bigint(20) unsigned NOT NULL,
  `tipo_cambio` decimal(10,3) NOT NULL,
  `monto_ingreso` decimal(10,2) NOT NULL,
  `monto_egreso` decimal(10,2) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaccions_tipo_transaccions_id_foreign` (`tipo_transaccions_id`),
  KEY `transaccions_cuenta_clientes_id_foreign` (`cuenta_clientes_id`),
  KEY `transaccions_clientes_id_foreign` (`clientes_id`),
  KEY `transaccions_caja_bancos_id_foreign` (`caja_bancos_id`),
  KEY `transaccions_empleados_id_foreign` (`empleados_id`),
  KEY `transaccions_locals_id_foreign` (`locals_id`),
  KEY `transaccions_canal_comunicacions_id_foreign` (`canal_comunicacions_id`),
  KEY `transaccions_tipo_documentos_id_foreign` (`tipo_documentos_id`),
  KEY `transaccions_medio_pagos_id_foreign` (`medio_pagos_id`),
  KEY `transaccions_monedas_id_foreign` (`monedas_id`),
  CONSTRAINT `transaccions_caja_bancos_id_foreign` FOREIGN KEY (`caja_bancos_id`) REFERENCES `caja_bancos` (`id`),
  CONSTRAINT `transaccions_canal_comunicacions_id_foreign` FOREIGN KEY (`canal_comunicacions_id`) REFERENCES `canal_comunicacions` (`id`),
  CONSTRAINT `transaccions_clientes_id_foreign` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `transaccions_cuenta_clientes_id_foreign` FOREIGN KEY (`cuenta_clientes_id`) REFERENCES `cuenta_clientes` (`id`),
  CONSTRAINT `transaccions_empleados_id_foreign` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `transaccions_locals_id_foreign` FOREIGN KEY (`locals_id`) REFERENCES `locals` (`id`),
  CONSTRAINT `transaccions_medio_pagos_id_foreign` FOREIGN KEY (`medio_pagos_id`) REFERENCES `medio_pagos` (`id`),
  CONSTRAINT `transaccions_monedas_id_foreign` FOREIGN KEY (`monedas_id`) REFERENCES `monedas` (`id`),
  CONSTRAINT `transaccions_tipo_documentos_id_foreign` FOREIGN KEY (`tipo_documentos_id`) REFERENCES `tipo_documentos` (`id`),
  CONSTRAINT `transaccions_tipo_transaccions_id_foreign` FOREIGN KEY (`tipo_transaccions_id`) REFERENCES `tipo_transaccions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.transaccions: ~2 rows (aproximadamente)
INSERT INTO `transaccions` (`id`, `tipo_transaccions_id`, `cuenta_clientes_id`, `clientes_id`, `caja_bancos_id`, `empleados_id`, `locals_id`, `canal_comunicacions_id`, `tipo_documentos_id`, `serie_documento`, `numero_documento`, `fecha_emision`, `hora_emision`, `medio_pagos_id`, `monedas_id`, `tipo_cambio`, `monto_ingreso`, `monto_egreso`, `monto`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(2, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 123456, '2025-03-22', '14:30:00', 1, 1, 3.750, 500.00, 0.00, 500.00, '1', 'admin', NULL, '2025-03-23 15:10:03', '2025-03-23 15:10:03'),
	(6, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 1, '2025-03-23', '12:51:05', 1, 1, 1.000, 200.00, 0.00, 200.00, '1', 'admin', '', '2025-03-23 17:51:05', '2025-03-23 17:51:05'),
	(7, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 2, '2025-03-23', '14:01:01', 1, 1, 1.000, 100.00, 0.00, 100.00, '1', 'admin', '', '2025-03-23 19:01:01', '2025-03-23 19:01:01'),
	(8, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 3, '2025-03-23', '14:06:49', 1, 1, 1.000, 50.00, 0.00, 50.00, '1', 'admin', '', '2025-03-23 19:06:49', '2025-03-23 19:06:49'),
	(9, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 4, '2025-03-23', '14:15:16', 1, 1, 1.000, 70.00, 0.00, 70.00, '1', 'admin', '', '2025-03-23 19:15:16', '2025-03-23 19:15:16'),
	(10, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 5, '2025-03-23', '14:20:06', 1, 1, 1.000, 20.00, 0.00, 20.00, '1', 'admin', '', '2025-03-23 19:20:06', '2025-03-23 19:20:06'),
	(11, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 6, '2025-03-23', '14:27:22', 1, 1, 1.000, 25.00, 0.00, 25.00, '1', 'admin', '', '2025-03-23 19:27:22', '2025-03-23 19:27:22'),
	(12, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 7, '2025-03-23', '14:31:38', 1, 1, 1.000, 25.00, 0.00, 25.00, '1', 'admin', '', '2025-03-23 19:31:38', '2025-03-23 19:31:38'),
	(13, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 8, '2025-03-23', '14:32:15', 1, 1, 1.000, 25.00, 0.00, 25.00, '1', 'admin', '', '2025-03-23 19:32:15', '2025-03-23 19:32:15'),
	(14, 1, 1, 1, 1, 1, 1, 2, 1, 'V001', 9, '2025-03-23', '14:32:44', 1, 1, 1.000, 15.00, 0.00, 15.00, '1', 'admin', '', '2025-03-23 19:32:44', '2025-03-23 19:32:44');

-- Volcando estructura para tabla siad.transaccion_cuenta_bancarias
CREATE TABLE IF NOT EXISTS `transaccion_cuenta_bancarias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaccions_id` bigint(20) unsigned NOT NULL,
  `cuenta_bancarias_id` bigint(20) unsigned NOT NULL,
  `numero_voucher` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_voucher_pago` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_registro` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaccion_cuenta_bancarias_transaccions_id_foreign` (`transaccions_id`),
  KEY `transaccion_cuenta_bancarias_cuenta_bancarias_id_foreign` (`cuenta_bancarias_id`),
  CONSTRAINT `transaccion_cuenta_bancarias_cuenta_bancarias_id_foreign` FOREIGN KEY (`cuenta_bancarias_id`) REFERENCES `cuenta_bancarias` (`id`),
  CONSTRAINT `transaccion_cuenta_bancarias_transaccions_id_foreign` FOREIGN KEY (`transaccions_id`) REFERENCES `transaccions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.transaccion_cuenta_bancarias: ~1 rows (aproximadamente)
INSERT INTO `transaccion_cuenta_bancarias` (`id`, `transaccions_id`, `cuenta_bancarias_id`, `numero_voucher`, `foto_voucher_pago`, `estado`, `usuario_registro`, `usuario_modificacion`, `created_at`, `updated_at`) VALUES
	(1, 6, 1, '', 'http://localhost:8000/storage/uploads/3JWCC6pGV1WuKCXVdPL6q5MmmURnhxmCaeRFZWZL.png', '1', 'admin', '', '2025-03-23 17:51:05', '2025-03-23 17:51:05'),
	(2, 7, 1, '', 'http://localhost:8000/storage/uploads/aiCwvsLI9BMptYvOkVPcZD0cPD93FcsRojPima9l.png', '1', 'admin', '', '2025-03-23 19:01:01', '2025-03-23 19:01:01'),
	(3, 8, 1, '', 'http://localhost:8000/storage/uploads/pOrfdVp21VwxUOuNcdQUwHtZR9RRS67E3xsD1g6t.png', '1', 'admin', '', '2025-03-23 19:06:49', '2025-03-23 19:06:49'),
	(4, 9, 1, '', 'http://localhost:8000/storage/uploads/qfaRuYJxV1YIwxxjLsP88yhsgl4ZcZkkFcONMvFz.png', '1', 'admin', '', '2025-03-23 19:15:16', '2025-03-23 19:15:16'),
	(5, 10, 1, '', 'http://localhost:8000/storage/uploads/GZNvqRcF2yFVqzf4Idch0TQ37IW0Bp7jDVYBaMoh.png', '1', 'admin', '', '2025-03-23 19:20:06', '2025-03-23 19:20:06'),
	(6, 11, 1, '', 'http://localhost:8000/storage/uploads/lVEeEansSDT2qRENlli3ocNI1JIWGFBe0vYrzXtG.png', '1', 'admin', '', '2025-03-23 19:27:22', '2025-03-23 19:27:22'),
	(7, 12, 1, '', 'http://localhost:8000/storage/uploads/zdgORs0vkvH4KTtsENg5FvPGofnz3GtyflXb363a.png', '1', 'admin', '', '2025-03-23 19:31:39', '2025-03-23 19:31:39'),
	(8, 13, 1, '', 'http://localhost:8000/storage/uploads/0kqr62uwSSbptl22K4aA5nBU5WWfcl44zVtcVfAp.png', '1', 'admin', '', '2025-03-23 19:32:15', '2025-03-23 19:32:15'),
	(9, 14, 1, '', 'http://localhost:8000/storage/uploads/yvoaTZbv2RGNB4xD9Z6dsf2zs5Gl2TAUl8QjUppG.png', '1', 'admin', '', '2025-03-23 19:32:45', '2025-03-23 19:32:45');

-- Volcando estructura para tabla siad.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla siad.users: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
