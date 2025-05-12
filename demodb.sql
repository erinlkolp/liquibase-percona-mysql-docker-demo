-- Create the actual database
CREATE DATABASE IF NOT EXISTS demodb;

USE demodb;

DROP TABLE IF EXISTS `example`;

CREATE TABLE `example` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;