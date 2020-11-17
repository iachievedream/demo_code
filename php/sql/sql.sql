/*
SQLyog Community Edition- MySQL GUI v8.2 
MySQL - 8.0.17 : Database - project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `project`;

/*Table structure for table `blocked_ip` */

DROP TABLE IF EXISTS `blocked_ip`;

CREATE TABLE `blocked_ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL,
  `login_limit` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blocked_ip` */

/*Table structure for table `check` */

DROP TABLE IF EXISTS `check`;

CREATE TABLE `check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(4) NOT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `in_status` int(11) DEFAULT '1',
  `out_time` time DEFAULT NULL,
  `out_status` int(11) DEFAULT '1',
  `memo` varchar(50) DEFAULT NULL,
  `timestamp` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `check` */

/*Table structure for table `check_status` */

DROP TABLE IF EXISTS `check_status`;

CREATE TABLE `check_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `check_status` */

insert  into `check_status`(`id`,`status_type`) values (1,'-'),(2,'正常'),(3,'異常');

/*Table structure for table `check_type` */

DROP TABLE IF EXISTS `check_type`;

CREATE TABLE `check_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `check_type` */

insert  into `check_type`(`id`,`type_name`) values (1,'上班'),(2,'下班');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime DEFAULT NULL,
  `controller_name` varchar(100) NOT NULL,
  `function_name` varchar(100) NOT NULL,
  `log_title` varchar(100) NOT NULL,
  `log_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `log` */

/*Table structure for table `message_board` */

DROP TABLE IF EXISTS `message_board`;

CREATE TABLE `message_board` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message_board` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_type_id` int(11) NOT NULL,
  `permission_value` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

/*Table structure for table `permission_type` */

DROP TABLE IF EXISTS `permission_type`;

CREATE TABLE `permission_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',
  `type_number` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `user_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `permission_type` */

insert  into `permission_type`(`id`,`type_name`,`sort`,`type_number`,`date_created`,`user_created`) values (1,'管理權限',1,'admin','0000-00-00 00:00:00',0),(2,'出勤系統',2,'check','0000-00-00 00:00:00',0),(3,'專案系統',3,'project','0000-00-00 00:00:00',0),(4,'薪資系統',4,'accounting','0000-00-00 00:00:00',0),(5,'訂單系統',5,'ordernum','0000-00-00 00:00:00',0);

/*Table structure for table `permission_value` */

DROP TABLE IF EXISTS `permission_value`;

CREATE TABLE `permission_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `permission_value` */

insert  into `permission_value`(`id`,`value_name`) values (1,'無'),(2,'唯讀'),(3,'讀寫');

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_type_id` int(11) NOT NULL,
  `project_value` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `project` */

/*Table structure for table `project_type` */

DROP TABLE IF EXISTS `project_type`;

CREATE TABLE `project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',
  `type_number` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `user_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `project_type` */

insert  into `project_type`(`id`,`type_name`,`sort`,`type_number`,`date_created`,`user_created`) values (1,'公司規章',1,'Company_regulations','0000-00-00 00:00:00',0),(2,'專案一',2,'project1','0000-00-00 00:00:00',0),(3,'專案二',3,'project2','0000-00-00 00:00:00',0);

/*Table structure for table `project_value` */

DROP TABLE IF EXISTS `project_value`;

CREATE TABLE `project_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `project_value` */

insert  into `project_value`(`id`,`value_name`) values (1,'待審核'),(2,'進行中'),(3,'已結案'),(4,'其他異動狀態');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(20) DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `work_am_start` time DEFAULT '09:00:00',
  `work_am_end` time DEFAULT '12:00:00',
  `work_pm_start` time DEFAULT '13:30:00',
  `work_pm_end` time DEFAULT '18:00:00',
  `date_created` datetime DEFAULT NULL,
  `date_last` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

/*Table structure for table `vacation` */

DROP TABLE IF EXISTS `vacation`;

CREATE TABLE `vacation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `off_date` date NOT NULL,
  `vacation_type_id` int(11) NOT NULL,
  `off_stime` time DEFAULT NULL,
  `off_etime` time DEFAULT NULL,
  `memo` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_created` datetime DEFAULT NULL,
  `user_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2084 DEFAULT CHARSET=utf8;

/*Data for the table `vacation` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
