/*
SQLyog Community Edition- MySQL GUI v8.2 
MySQL - 8.0.17 : Database - crud
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `crud`;

/*Table structure for table `messageboard` */

DROP TABLE IF EXISTS `messageboard`;

CREATE TABLE `messageboard` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `iname` varchar(20) NOT NULL,
  `msg` varchar(150) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `messageboard` */

insert  into `messageboard`(`id`,`iname`,`msg`,`create_time`,`update_time`) values 
(1,'1','123abc','2020-08-21 15:48:30','2020-08-21 16:35:53'),
(2,'2','abc123','2020-08-21 15:48:30','2020-08-21 16:41:19'),
(3,'5','qaz','2020-08-21 16:43:36','2020-08-21 16:43:36'),
(4,'3','wsx','2020-08-21 16:43:57','2020-08-21 16:43:57');

/* Table structure for table `zuser` */

DROP TABLE IF EXISTS `zuser`;

CREATE TABLE `zuser` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zuser` */

insert  into `zuser`(`id`,`username`,`password`,`create_time`,`update_time`) values 
(1,'ab','','2020-08-21 15:43:41','2020-08-21 15:52:55'),
(2,'abc','','2020-08-21 15:43:43','2020-08-21 15:46:19'),
(3,'fu','','2020-08-21 15:59:12','2020-08-21 15:59:12'),
(4,'fu1','','2020-08-21 15:59:19','2020-08-21 15:59:19'),
(5,'charley','','2020-08-21 15:59:21','2020-08-21 15:59:30'),
(6,'charley1','','2020-08-21 16:43:44','2020-08-21 16:43:44');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
