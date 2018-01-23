-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `idMutation` INT NOT NULL,
  `chromosome_start` INT NULL,
  `chromosome_end` INT NULL,
  PRIMARY KEY (`idMutation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `idpatient` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `patient_gender` VARCHAR(45) NULL,
  `idMutation` INT NULL,
  PRIMARY KEY (`idpatient`),
  INDEX `fk_patient_1_idx` (`idMutation` ASC),
  CONSTRAINT `fk_patient_1`
    FOREIGN KEY (`idMutation`)
    REFERENCES `mydb`.`Mutation` (`idMutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `idsyndrome` INT NOT NULL,
  `syndrome` VARCHAR(45) NULL,
  `Syndrome_description` VARCHAR(45) NULL,
  `idMutation` INT NULL,
  PRIMARY KEY (`idsyndrome`),
  INDEX `fk_syndrome_1_idx` (`idMutation` ASC),
  CONSTRAINT `fk_syndrome_1`
    FOREIGN KEY (`idMutation`)
    REFERENCES `mydb`.`Mutation` (`idMutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `idgene` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `gene_description` VARCHAR(45) NULL,
  `chromosome` VARCHAR(45) NULL,
  `idMutation` INT NULL,
  PRIMARY KEY (`idgene`),
  INDEX `fk_gene_1_idx` (`idMutation` ASC),
  CONSTRAINT `fk_gene_1`
    FOREIGN KEY (`idMutation`)
    REFERENCES `mydb`.`Mutation` (`idMutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
