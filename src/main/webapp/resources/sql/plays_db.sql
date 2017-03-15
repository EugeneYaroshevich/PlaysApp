-- -----------------------------------------------------
-- Schema plays
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `plays` DEFAULT CHARACTER SET utf8 ;
USE `plays` ;

-- -----------------------------------------------------
-- Table `plays`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plays`.`authors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `info` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plays`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plays`.`genres` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plays`.`plays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plays`.`plays` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `authorId` INT(11) NOT NULL,
  `genreId` INT(11) NOT NULL,
  `info` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `genreId_idx` (`genreId` ASC),
  INDEX `authorId_idx` (`authorId` ASC),
  CONSTRAINT `authorId`
    FOREIGN KEY (`authorId`)
    REFERENCES `plays`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `genreId`
    FOREIGN KEY (`genreId`)
    REFERENCES `plays`.`genres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plays`.`dates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plays`.`dates` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `playId` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `playId_idx` (`playId` ASC),
  CONSTRAINT `playId`
    FOREIGN KEY (`playId`)
    REFERENCES `plays`.`plays` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plays`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plays`.`orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `dateId` INT(11) NOT NULL,
  `place` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `dateId_idx` (`dateId` ASC),
  CONSTRAINT `dateId`
    FOREIGN KEY (`dateId`)
    REFERENCES `plays`.`dates` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;