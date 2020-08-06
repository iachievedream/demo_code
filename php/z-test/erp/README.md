**
客戶(guest)
GID
firstname
lastname

**
sectors
SID(航班編號)
Sector(航點名稱)

China
Taiwan
Singapore

**
flights(航班資料)
FID(航班編號)
Fname(航班)
sourceSID(出發)
DestSID(目的)

itinerary
IID(訂票)
GID(客戶)
FID(航班編號)
SID(行程)

schedule(航班行程資料:單一時刻)
SID(行程)
GID(客戶)
FID(航班編號)
date(出發時間)

備註:建立資料表
----------------------------------------------------
CREATE TABLE `guest` (
  `id` int(1) NOT NULL,
  `name` varchar(25) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `update_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `guest`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

備註:插入資料表
----------------------------------------------------
INSERT INTO `message_board` (`id`, `name`, `msg`, `update_time`) VALUES
(1, 'fufu', 'hello fufu', '2020-03-25 04:00:42'),
(2, 'abab', 'hello abab', '2020-03-25 04:00:51'),
(3, 'cdcd', 'cdcdcd', '2020-07-11 07:35:24');
----------------------------------------------------

ALTER TABLE 資料表名稱 
ADD CONSTRAINT 關聯名稱 
FOREIGN KEY (關聯欄位) 
REFERENCES 外鍵表名稱 (外鍵欄位) 
ON DELETE 刪除類型 
ON UPDATE 更新類型;

ALTER TABLE 資料表名稱 DROP FOREIGN KEY 關聯名稱;

ALTER TABLE `Professional_Societies` ADD CONSTRAINT 
`Professional_Societies_Fk` FOREIGN KEY (`Professor_Id`) REFERENCES 
`Professional_History` (`Id`);

ALTER TABLE `表格名稱` ADD CONSTRAINT 
`關聯名稱` FOREIGN KEY 
(`foreignKeyName 欄位`) REFERENCES 
`關聯資料表名稱` (`關聯資料表欄位`);
通常後面會加上 
ON DELETE  +類型
ON UPDATE  +類型

ALTER TABLE `itinerary` ADD CONSTRAINT 
`itinerary_Fk` FOREIGN KEY 
(`GID`) REFERENCES 
`sectors` (`SID`);

ALTER TABLE `schedule` ADD INDEX(`GID`);