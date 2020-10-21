CREATE DATABASE project;
USE `project`;

-- 使用者以及留言板SQL
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(20) DEFAULT NULL,
  -- `empno` varchar(20) DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_last` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8

CREATE TABLE `message_board` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
--------------------------------------------------------------------------------------------------
-- 系統整體架構SQL
-- 使用者權限
CREATE TABLE `permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_type_id` int(11) NOT NULL,
  `permission_value` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8

-- 權限種類
CREATE TABLE `permission_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',--排列順序
  `type_number` varchar(50) DEFAULT NULL,--部門需求
  `date_created` datetime NOT NULL,
  `user_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

insert  into `permission_type`(`id`,`sort`,`type_name`,`type_number`,`dateCreated`,`userCreated`) values 
(1,1,'管理權限','admin','0000-00-00 00:00:00','original'),
(2,2,'出勤系統','check','0000-00-00 00:00:00','original'),
(3,3,'專案系統','project','0000-00-00 00:00:00','original'),
(4,4,'薪資系統','accounting','0000-00-00 00:00:00','original'),
(5,5,'訂單系統','ordernum','0000-00-00 00:00:00','original');

-- 權限類型
CREATE TABLE `permission_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

insert  into `permission_value`(`id`,`value_name`) values (1,'無'),(2,'唯讀'),(3,'讀寫');

--------------------------------------------------------------------------------------------------
-- 出勤系統
CREATE TABLE `check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(4) NOT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `in_status` int(11) DEFAULT '1',
  `out_time` time DEFAULT NULL,
  `out_status` int(11) DEFAULT '1',
  `memo` varchar(50) DEFAULT NULL,
  -- `in_desc` varchar(50) DEFAULT NULL,
  `timestamp` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8

CREATE TABLE `vacation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `off_date` date NOT NULL,
  `vacation_type_id` int(11) NOT NULL,
  `off_stime` time DEFAULT NULL,
  `off_etime` time DEFAULT NULL,
  -- `off_hours` float NOT NULL,
  `memo` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_created` datetime DEFAULT NULL,
  `user_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2084 DEFAULT CHARSET=utf8


CREATE TABLE `check_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

insert  into `check_status`(`id`,`status_type`) values (1,'-'),(2,'正常'),(3,'異常');


CREATE TABLE `check_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

insert  into `check_type`(`id`,`type_name`) values (1,'上班'),(2,'下班');



--------------------------------------------------------------------------------------------------
-- 專案系統
-- 使用者權限
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_type_id` int(11) NOT NULL,
  `project_value` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8

-- 權限種類
CREATE TABLE `project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',--排列順序
  `type_number` varchar(50) DEFAULT NULL,--部門需求
  `date_created` datetime NOT NULL,
  `user_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

insert  into `project_type`(`id`,`sort`,`type_name`,`type_number`,`dateCreated`,`userCreated`) values 
(1,1,'公司規章','Company_regulations','0000-00-00 00:00:00','original'),
(2,2,'專案一','project1','0000-00-00 00:00:00','original'),
(3,3,'專案二','project2','0000-00-00 00:00:00','original');


-- 權限類型
CREATE TABLE `project_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

insert  into `project_value`(`id`,`value_name`) values (1,'待審核'),(2,'進行中'),(3,'已結案'),(4,'其他異動狀態');
--------------------------------------------------------------------------------------------------
-- 其他功能SQL
-- 登入錯誤封鎖IP
CREATE TABLE `blocked_ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL,
  `login_limit` varchar(32) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- 使用者操作紀錄
CREATE TABLE `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime DEFAULT NULL,
  `controller_name` varchar(100) NOT NULL,
  `function_name` varchar(100) NOT NULL,
  `log_title` varchar(100) NOT NULL,
  `log_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8



-- 已解決
-- #1822 - Failed to add the foreign key constraint. Missing index for constraint 'fk_name' in the referenced table 'user'
-- user.username上面添加unique的唯一項目,

-- ALTER TABLE `message_board`
--   MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2,
--   -- ADD KEY `fk_name` (`name`),//多餘的
--   ADD CONSTRAINT `fk_name` FOREIGN KEY (`name`) REFERENCES `user` (`username`);