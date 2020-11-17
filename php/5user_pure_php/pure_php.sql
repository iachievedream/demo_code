CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(15) NOT NULL unique,
  `password` varchar(15) NOT NULL,
  `update_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO `user` (`id`, `username`, `password`, `update_time`) VALUES
(1, 'root', 'root', '2020-01-1 12:00:00'),
(2, 'fu', '12345678', '2020-01-1 15:00:00');

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

CREATE TABLE `message_board` (
  `id` int(10) NOT NULL PRIMARY KEY,
  `name` varchar(15) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `update_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO `message_board` (`id`, `name`, `msg`, `update_time`) VALUES
(1, 'root', 'hello', '2020-07-11 07:35:24');

ALTER TABLE `message_board`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2,
  ADD CONSTRAINT `fk_name` FOREIGN KEY (`name`) REFERENCES `user` (`username`);

-- 已解決
-- #1822 - Failed to add the foreign key constraint. Missing index for constraint 'fk_name' in the referenced table 'user'
-- user.username上面添加unique的唯一項目,

-- ALTER TABLE `message_board`
--   MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2,
--   -- ADD KEY `fk_name` (`name`),//多餘的
--   ADD CONSTRAINT `fk_name` FOREIGN KEY (`name`) REFERENCES `user` (`username`);
