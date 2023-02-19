drop database if exists `adventure_time`;
create database `adventure_time`;
use `adventure_time`;


CREATE TABLE `app_role` (
  `app_role_id` INT PRIMARY KEY NOT NULL auto_increment,
  `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `app_user` (
  `app_user_id` INT PRIMARY KEY NOT NULL auto_increment,
  `username` VARCHAR(50) NULL,
  `password_hash` VARCHAR(2048) NULL,
  `disabled` TINYINT NOT NULL
);


CREATE TABLE `app_user_role` (
  `app_user_id` INT NOT NULL,
  `app_role_id` INT NOT NULL,
  CONSTRAINT `fk_app_user_id`
    FOREIGN KEY (`app_user_id`)
    REFERENCES `app_user` (`app_user_id`),
  CONSTRAINT `fk_app_role_id`
    FOREIGN KEY (`app_role_id`)
    REFERENCES `app_role` (`app_role_id`)
);

CREATE TABLE `trip` (
  `trip_id` INT PRIMARY KEY NOT NULL auto_increment,
  `start_time` DATE NULL,
  `end_time` DATE NULL,
  `review` INT NULL,
  `total_distance` INT NULL,
  `name` VARCHAR(45) NOT NULL,
  `disabled` TINYINT NOT NULL
);

CREATE TABLE `profile` (
  `profile_id` INT PRIMARY KEY NOT NULL auto_increment,
  `profile_photo` TEXT NULL,
  `about_me` VARCHAR(100) NULL,
  `name` VARCHAR(100) NOT NULL,
  `app_user_id` INT NOT NULL,
  UNIQUE INDEX `profile_id_UNIQUE` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_profile_app_user_id`
    FOREIGN KEY (`app_user_id`)
    REFERENCES `app_user` (`app_user_id`)
);
  
CREATE TABLE `profile_trip` (
  `profile_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  CONSTRAINT `fk_profile_trip_profile_id`
    FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`profile_id`),
  CONSTRAINT `fk_profile_trip_id`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`trip_id`)
);


CREATE TABLE `location` (
  `location_id` INT PRIMARY KEY NOT NULL auto_increment,
  `latitude` VARCHAR(45) NOT NULL,
  `longitude` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `photo_url` TEXT NULL,
  `disabled` TINYINT NOT NULL
);


CREATE TABLE `trip_location` (
  `trip_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `trip_location_id` INT PRIMARY KEY NOT NULL auto_increment,
  `sort_order` INT NOT NULL,
  CONSTRAINT `fk_trip_location_trip_id`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`trip_id`),
  CONSTRAINT `fk_trip_location_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`location_id`)
);

CREATE TABLE `comment` (
  `comment_id` INT PRIMARY KEY NOT NULL auto_increment,
  `trip_id` INT NOT NULL,
  `comment_body` TEXT NOT NULL,
  `profile_id` INT NOT NULL,
  CONSTRAINT `fk_comment_trip_id`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`trip_id`),
  CONSTRAINT `fk_comment_profile_id`
	FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`profile_id`)
);

CREATE TABLE `item` (
  `item_id` INT PRIMARY KEY NOT NULL auto_increment,
  `name` VARCHAR(45) NOT NULL,
  `trip_id` INT NOT NULL,
  `profile_id` INT NULL,
  `description` TEXT NULL,
  `quantity` INT NOT NULL,
  `is_packed` TINYINT NOT NULL,
  CONSTRAINT `fk_item_trip_id`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`trip_id`),
  CONSTRAINT `fk_item_profile_id`
	FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`profile_id`)
);

CREATE TABLE `photo` (
	`photo_id` INT PRIMARY KEY NOT NULL auto_increment,
    `photo` TEXT NOT NULL,
    `trip_location_id` INT NOT NULL,
    `caption` VARCHAR(45) NULL,
    CONSTRAINT `fk_photo_trip_location_id`
		FOREIGN KEY (`trip_location_id`)
        REFERENCES `trip_location` (`trip_location_id`)
);