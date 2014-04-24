SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `aerolinea` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `aerolinea`;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`aerolinea` (
  `cod` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL ,
  PRIMARY KEY (`cod`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`categoria` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`pais` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`ciudad` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `idpais` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_PAIS_ID_idx` (`idpais` ASC) ,
  CONSTRAINT `FK_CIUDAD_PAIS_ID`
    FOREIGN KEY (`idpais` )
    REFERENCES `aerolinea`.`pais` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`vuelo` (
  `cod` INT(11) NOT NULL AUTO_INCREMENT ,
  `idciudadpartida` INT(11) NOT NULL ,
  `idciudadllegada` INT(11) NOT NULL ,
  `fecha` DATE NOT NULL ,
  `hora` TIME NOT NULL ,
  `codaerolinea` INT(11) NOT NULL ,
  `estado` CHAR(1) NOT NULL ,
  `informacion` VARCHAR(200) NULL DEFAULT NULL ,
  `tipo` CHAR(1) NOT NULL ,
  PRIMARY KEY (`cod`) ,
  INDEX `FK_CIUDAD_PARTIDA_ID_idx` (`idciudadpartida` ASC) ,
  INDEX `FK_CIUDAD_LLEGADA_ID_idx` (`idciudadllegada` ASC) ,
  INDEX `FK_AEROLINEA_ID_idx` (`codaerolinea` ASC) ,
  CONSTRAINT `FK_CIUDAD_PARTIDA_ID`
    FOREIGN KEY (`idciudadpartida` )
    REFERENCES `aerolinea`.`ciudad` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CIUDAD_LLEGADA_ID`
    FOREIGN KEY (`idciudadllegada` )
    REFERENCES `aerolinea`.`ciudad` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_AEROLINEA_VUELO_ID`
    FOREIGN KEY (`codaerolinea` )
    REFERENCES `aerolinea`.`aerolinea` (`cod` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`vuelocategoria` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `codvuelo` INT(11) NOT NULL ,
  `idcategoria` INT(11) NOT NULL ,
  `PRECIO` DOUBLE NOT NULL ,
  `capacidad` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_VUELO_ID_idx` (`codvuelo` ASC) ,
  INDEX `FK_CATEGORIA_ID_idx` (`idcategoria` ASC) ,
  CONSTRAINT `FK_VUELO_CATEGORIA_ID`
    FOREIGN KEY (`codvuelo` )
    REFERENCES `aerolinea`.`vuelo` (`cod` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CATEGORIA_VUELOCATEGORIA_ID`
    FOREIGN KEY (`idcategoria` )
    REFERENCES `aerolinea`.`categoria` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`escalavuelo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `codvuelo` INT(11) NOT NULL ,
  `idciudad` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_VUELO_ESCALA_ID_idx` (`codvuelo` ASC) ,
  INDEX `FK_CIUDAD_ESCALA_ID_idx` (`idciudad` ASC) ,
  CONSTRAINT `FK_VUELO_ESCALA_ID`
    FOREIGN KEY (`codvuelo` )
    REFERENCES `aerolinea`.`vuelo` (`cod` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CIUDAD_ESCALA_ID`
    FOREIGN KEY (`idciudad` )
    REFERENCES `aerolinea`.`ciudad` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`tipodocumento` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`pasajero` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `idtipodocumento` INT(11) NOT NULL ,
  `numerodocumento` VARCHAR(45) NOT NULL ,
  `telefono` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_PASAJERO_TIPODOC_ID_idx` (`idtipodocumento` ASC) ,
  CONSTRAINT `FK_PASAJERO_TIPODOC_ID`
    FOREIGN KEY (`idtipodocumento` )
    REFERENCES `aerolinea`.`tipodocumento` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`usuario` (
  `cod` INT(11) NOT NULL AUTO_INCREMENT ,
  `idpasajero` INT(11) NOT NULL ,
  `numerotarjeta` CHAR(16) NOT NULL ,
  `email` VARCHAR(60) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`cod`) ,
  INDEX `FK_COMPRADOR_PASAJERO_ID_idx` (`idpasajero` ASC) ,
  UNIQUE INDEX `idpasajero_UNIQUE` (`idpasajero` ASC) ,
  CONSTRAINT `FK_COMPRADOR_PASAJERO_ID`
    FOREIGN KEY (`idpasajero` )
    REFERENCES `aerolinea`.`pasajero` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`reservacab` (
  `idreserva` INT(11) NOT NULL AUTO_INCREMENT ,
  `codcomprador` INT(11) NOT NULL ,
  `fecha` DATE NOT NULL ,
  PRIMARY KEY (`idreserva`) ,
  INDEX `FK_USUARIO_RESERVA_ID_idx` (`codcomprador` ASC) ,
  CONSTRAINT `FK_USUARIO_RESERVA_ID`
    FOREIGN KEY (`codcomprador` )
    REFERENCES `aerolinea`.`usuario` (`cod` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `aerolinea`.`reservadet` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `idreserva` INT(11) NOT NULL ,
  `idpasajero` INT(11) NOT NULL ,
  `codvuelo` INT(11) NOT NULL ,
  `idcategoria` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_RESERVACAB_RESERVADET_ID_idx` (`idreserva` ASC) ,
  INDEX `FK_PASAJERO_RESERVADET_idx` (`idpasajero` ASC) ,
  INDEX `FK_VUELO_RESERVADET_ID_idx` (`codvuelo` ASC) ,
  INDEX `FK_CATEGORIA_RESERVADET_ID_idx` (`idcategoria` ASC) ,
  CONSTRAINT `FK_RESERVACAB_RESERVADET_ID`
    FOREIGN KEY (`idreserva` )
    REFERENCES `aerolinea`.`reservacab` (`idreserva` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PASAJERO_RESERVADET`
    FOREIGN KEY (`idpasajero` )
    REFERENCES `aerolinea`.`pasajero` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_VUELO_RESERVADET_ID`
    FOREIGN KEY (`codvuelo` )
    REFERENCES `aerolinea`.`vuelo` (`cod` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CATEGORIA_RESERVADET_ID`
    FOREIGN KEY (`idcategoria` )
    REFERENCES `aerolinea`.`categoria` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
