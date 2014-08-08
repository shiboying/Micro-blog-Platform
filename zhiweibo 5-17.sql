SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `Mystruts2DB` ;
CREATE SCHEMA IF NOT EXISTS `Mystruts2DB`  DEFAULT CHARACTER SET =utf8 ;
USE `Mystruts2DB` ;

-- -----------------------------------------------------
-- Table `Mystruts2DB`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Mystruts2DB`.`user` (
  `userid` INT NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(20) NOT NULL ,
  `password` VARCHAR(20) NOT NULL ,
  `regtime` DATETIME NOT NULL ,
  `usertype` TINYINT(1)  NOT NULL DEFAULT false ,
  `nickname` VARCHAR(30) NULL ,
  `gender` ENUM('female','male','secret') NULL DEFAULT 'secret' ,
  `email` VARCHAR(50) NULL ,
  `birth` DATE NULL ,
  `location` VARCHAR(50) NULL ,
  `image` VARCHAR(1000) NOT NULL DEFAULT '/img/defaultlogo.jpg' ,
  PRIMARY KEY (`userid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mystruts2DB`.`weibo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Mystruts2DB`.`weibo` (
  `wid` INT NOT NULL AUTO_INCREMENT ,
  `content` VARCHAR(280) NOT NULL ,
  `authorid` INT NOT NULL ,
  `time` DATETIME NOT NULL ,
  `refercounts` INT NOT NULL DEFAULT 0 ,
  `cmttconts` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`wid`) ,
  INDEX `fk_weibo_user1` (`authorid` ASC) ,
  CONSTRAINT `fk_weibo_user1`
    FOREIGN KEY (`authorid` )
    REFERENCES `Mystruts2DB`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mystruts2DB`.`comment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Mystruts2DB`.`comment` (
  `cid` INT NOT NULL AUTO_INCREMENT ,
  `cmtid` INT NOT NULL ,
  `cmtedid` INT NULL ,
  `content` VARCHAR(300) NULL ,
  `cmttime` DATETIME NOT NULL ,
  `weibo_wid` INT NOT NULL ,
  PRIMARY KEY (`cid`) ,
  INDEX `fk_comment_weibo1` (`weibo_wid` ASC) ,
  INDEX `fk_comment_user1` (`cmtid` ASC) ,
  INDEX `fk_comment_user2` (`cmtedid` ASC) ,
  CONSTRAINT `fk_comment_weibo1`
    FOREIGN KEY (`weibo_wid` )
    REFERENCES `Mystruts2DB`.`weibo` (`wid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`cmtid` )
    REFERENCES `Mystruts2DB`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user2`
    FOREIGN KEY (`cmtedid` )
    REFERENCES `Mystruts2DB`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mystruts2DB`.`fans`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Mystruts2DB`.`fans` (
  `flwid` INT NOT NULL ,
  `flwedid` INT NOT NULL ,
  PRIMARY KEY (`flwedid`, `flwid`) ,
  INDEX `fk_fans_user1` (`flwid` ASC) ,
  INDEX `fk_fans_user2` (`flwedid` ASC) ,
  CONSTRAINT `fk_fans_user1`
    FOREIGN KEY (`flwid` )
    REFERENCES `Mystruts2DB`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fans_user2`
    FOREIGN KEY (`flwedid` )
    REFERENCES `Mystruts2DB`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
