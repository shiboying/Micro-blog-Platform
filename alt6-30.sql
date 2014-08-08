SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';



ALTER TABLE `Mystruts2DB`.`comment`
ADD COLUMN `cmtedcid` INT(11) NULL DEFAULT NULL  AFTER `weibo_wid` ,

  ADD CONSTRAINT `fk_comment_comment1`

  FOREIGN KEY (`cmtedcid` )

  REFERENCES `Mystruts2DB`.`comment` (`cid` )

  ON DELETE NO ACTION

  ON UPDATE NO ACTION

, ADD INDEX `fk_comment_comment1` (`cmtedcid` ASC) ;

ALTER TABLE `mystruts2db`.`fans` ADD COLUMN `fid` INT NOT NULL  FIRST  , DROP PRIMARY KEY  , ADD PRIMARY KEY (`fid`) ;
ALTER TABLE `mystruts2db`.`fans` CHANGE COLUMN `fid` `fid` INT(11) NOT NULL AUTO_INCREMENT  ;
ALTER TABLE `mystruts2db`.`weibo` ADD COLUMN `refid` INT NOT NULL DEFAULT -1  AFTER `cmttconts` ;

ALTER TABLE `mystruts2db`.`user` CHANGE COLUMN `image` `image` VARCHAR(1000) NOT NULL DEFAULT './webpages/images/touxiang.jpg'  ;
ALTER TABLE `mystruts2db`.`user` ADD COLUMN `ccount` INT NULL DEFAULT 0  AFTER `image` , ADD COLUMN `fcount` INT NULL DEFAULT 0  AFTER `ccount` , ADD COLUMN `wcount` INT NULL DEFAULT 0  AFTER `image` ;


SET SQL_MODE=@OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;