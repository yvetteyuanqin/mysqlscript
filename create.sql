CREATE TABLE `moviedb`.`stars` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(100) NULL,
  `birthYear` INT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `moviedb`.`stars_in_movie` (
  `starId` VARCHAR(10) NULL,
  `movieId` VARCHAR(10) NULL,
  INDEX `FK_star_idx` (`starId` ASC) VISIBLE,
  INDEX `FK_movie_idx` (`movieId` ASC) VISIBLE,
  CONSTRAINT `FK_star`
    FOREIGN KEY (`starId`)
    REFERENCES `moviedb`.`stars` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_movie`
    FOREIGN KEY (`movieId`)
    REFERENCES `moviedb`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE `moviedb`.`genres` (
  `id` INT NOT NULL,
  `name` VARCHAR(32) NULL DEFAULT '',
  PRIMARY KEY (`id`));

CREATE TABLE `moviedb`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NULL,
  `lastName` VARCHAR(50) NULL,
  `ccId` VARCHAR(20) NULL,
  `address` VARCHAR(200) NULL,
  `email` VARCHAR(50) NULL,
  `password` VARCHAR(20) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `moviedb`.`sales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customerId` INT NULL,
  `movieId` VARCHAR(10) NULL,
  `saleDate` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_CUS_idx` (`customerId` ASC) VISIBLE,
  INDEX `fk_mov_idx` (`movieId` ASC) VISIBLE,
  CONSTRAINT `FK_CUS`
    FOREIGN KEY (`customerId`)
    REFERENCES `moviedb`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mov`
    FOREIGN KEY (`movieId`)
    REFERENCES `moviedb`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `moviedb`.`creditcards` (
  `id` VARCHAR(20) NOT NULL,
  `firstName` VARCHAR(50) NULL,
  `lastName` VARCHAR(50) NULL,
  `expiration` DATE NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `moviedb`.`ratings` (
  `movieId` VARCHAR(10) NOT NULL,
  `rating` FLOAT NULL,
  `numVotes` INT NULL,
  PRIMARY KEY (`movieId`),
  CONSTRAINT `movie_fk`
    FOREIGN KEY (`movieId`)
    REFERENCES `moviedb`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
