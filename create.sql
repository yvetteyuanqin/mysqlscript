CREATE TABLE `creditcards` (
  `id` varchar(20) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `ccId` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ccid_idx` (`ccId`),
  CONSTRAINT `fk_ccid` FOREIGN KEY (`ccId`) REFERENCES `creditcards` (`id`)
);

CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`)
);

CREATE TABLE `genres_in_movies` (
  `genreId` int(11) DEFAULT NULL,
  `movieId` varchar(10) DEFAULT NULL
);

CREATE TABLE `movies` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT '',
  `year` int(11) DEFAULT NULL,
  `director` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
);

CREATE TABLE `ratings` (
  `movieId` varchar(10) NOT NULL,
  `rating` float DEFAULT NULL,
  `numVotes` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieId`),
  CONSTRAINT `movie_fk` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`)
);

CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `movieId` varchar(10) DEFAULT NULL,
  `saleDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CUS_idx` (`customerId`),
  KEY `fk_mov_idx` (`movieId`),
  CONSTRAINT `FK_CUS` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_mov` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`)
); 

CREATE TABLE `stars` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT '',
  `birthYear` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

CREATE TABLE `stars_in_movies` (
  `starId` varchar(10) DEFAULT NULL,
  `movieId` varchar(10) DEFAULT NULL,
  KEY `FK_star_idx` (`starId`),
  KEY `FK_movie_idx` (`movieId`),
  CONSTRAINT `FK_movie` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`),
  CONSTRAINT `FK_star` FOREIGN KEY (`starId`) REFERENCES `stars` (`id`)
) ;
