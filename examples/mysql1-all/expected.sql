ALTER TABLE `User` CHANGE `role` `role` ENUM('ADMIN', 'CUSTOMER') NOT NULL;
ALTER TABLE `User` CHANGE `role` `role` ENUM('ADMIN', 'CUSTOMER') NOT NULL DEFAULT 'CUSTOMER';
ALTER TABLE `User` CHANGE `jsonData` `jsonData` JSON ;
ALTER TABLE `Post` CHANGE `createdAt` `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `Post` CHANGE `published` `published` TINYINT(1) NOT NULL DEFAULT 0;
ALTER TABLE `Post` ADD COLUMN `authorId` char(25) CHARACTER SET utf8;
UPDATE `Post`, `_UserPost` SET `Post`.`authorId` = `_UserPost`.A where `_UserPost`.B = `Post`.`id`;
ALTER TABLE `Post` ADD CONSTRAINT author FOREIGN KEY (`authorId`) REFERENCES `User`(`id`);
DROP TABLE `_UserPost`;
ALTER TABLE `Profile` ADD COLUMN `userId` char(25) CHARACTER SET UTF8 NOT NULL UNIQUE;
ALTER TABLE `Profile` ADD FOREIGN KEY (`userId`) REFERENCES `User` (`id`);
DROP TABLE `_UserProfile`;