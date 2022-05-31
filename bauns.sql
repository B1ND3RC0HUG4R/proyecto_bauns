/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.18-MariaDB : Database - proyecto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `proyecto`;

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `departamento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id`,`departamento`,`descripcion`,`activo`,`created_at`,`updated_at`) values (1,'Sociales','Información relevante sobre redes sociales',1,'2022-05-27 23:48:49','2022-05-27 23:48:49'),(3,'Innovacion','Información relevante sobre innovacion y tecnología',0,'2022-05-27 23:50:43','2022-05-27 23:53:08'),(4,'Política','Noticias relevantes de política y sociales',1,'2022-05-30 19:45:29','2022-05-30 19:45:29');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
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

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_05_27_033947_create_noticias_table',1),(6,'2022_05_27_230746_create_roles_table',1),(7,'2022_05_27_232401_create_departamentos_table',1);

/*Table structure for table `noticias` */

DROP TABLE IF EXISTS `noticias`;

CREATE TABLE `noticias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `departamento_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `noticias` */

insert  into `noticias`(`id`,`titulo`,`src`,`descripcion`,`activo`,`departamento_id`,`user_id`,`created_at`,`updated_at`) values (3,'Starlink','assets/img/colonizing_the_moon-wallpaper-1920x1080.jpg','Se lanzan 10 satelites para conexion de internet',0,'3',2,'2022-05-27 23:41:24','2022-05-30 00:07:36'),(4,'Compra Twitter','assets/img/aurora_background_2-wallpaper-1920x1080.jpg','Se hace los preparativos finales para la compra de Twitter',1,'1',1,'2022-05-29 18:12:20','2022-05-30 00:01:51'),(5,'Compra Twitter','assets/img/winding_river_sunset_city_aerial_view-wallpaper-1920x1080.jpg','Se hace los preparativos finales para la compra de Twitter',0,'1',1,'2022-05-29 18:16:10','2022-05-30 00:28:20'),(7,'Prueba de innovación','assets/img/magic_3-wallpaper-1920x1080.jpg','Prueba de formulario',1,'3',3,'2022-05-30 06:09:10','2022-05-30 06:53:39'),(8,'Prueba front 2','assets/img/full-screen-image-3.jpg','Prueba de guardado de información dos',0,'4',3,'2022-05-30 10:14:35','2022-05-30 10:14:35'),(9,'Prueba front 2','assets/img/opt_lbd_angular_thumbnail.jpg','Prueba de guardado de información dos',0,'3',3,'2022-05-30 10:27:20','2022-05-30 10:27:20'),(10,'Prueba front 2','assets/img/sidebar-4.jpg','Prueba de guardado de información dos',0,'3',3,'2022-05-30 10:29:28','2022-05-30 10:29:28'),(11,'Prueba front dos','assets/img/sidebar-1.jpg','Prueba de descripcion de datos',0,'3',3,'2022-05-30 10:43:11','2022-05-30 10:43:11'),(12,'Prueba front dos','assets/img/sidebar-2.jpg','Prueba de descripcion de datos',0,'3',3,'2022-05-30 10:44:44','2022-05-30 10:44:44'),(13,'Prueba front dos','assets/img/sidebar-5.jpg','Prueba de datos pagina inicio',0,'3',0,'2022-05-30 10:55:06','2022-05-30 10:55:06');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`rol`,`descripcion`,`activo`,`created_at`,`updated_at`) values (1,'Dirección','Administrar los roles',1,'2022-05-27 23:54:26','2022-05-27 23:55:56'),(3,'Videojuegos','Agregar noticias acerca de videojuegos',1,'2022-05-27 23:54:52','2022-05-27 23:54:52'),(4,'Automotriz','Creación de noticias de autos',1,'2022-05-30 02:05:15','2022-05-30 02:05:15'),(6,'Tendencias','Agregar noticias de tendencias',1,'2022-05-27 23:54:26','2022-05-27 23:55:56');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`departamento_id`,`rol_id`,`remember_token`,`created_at`,`updated_at`) values (1,'Juan perez','juan@prueba.com',NULL,'$2y$10$nx/8nYRfXhhHbG/9W8lWruARFB9mymrUlaPZo0HgAyA9IxCQy5P9O',1,2,NULL,'2022-05-27 23:42:47','2022-05-27 23:42:47'),(2,'Edgar Jimenez','edgar@prueba.com',NULL,'$2y$10$O3CF0L3MOPebjYIhThRz3.jcJwqcK3ojlDR1/kREcTtZjWUy1VXC2',3,1,NULL,'2022-05-29 09:07:00','2022-05-29 09:07:00'),(3,'Jorge Diaz','jorgeda602@hotmail.com',NULL,'$2y$10$Exv2e.3tzFVvjDqD.Ldv6.ktQHpc2nEVhlj/L7i8vQt6d98Tphbja',3,1,NULL,'2022-05-30 04:36:23','2022-05-30 04:36:23');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
