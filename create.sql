-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- �������-�����, ������� �������� ���� �������� � ��������� ������ � �������. ������� ���������� � ������� ������������ ��������� ��������, � ������ ������ ������ � ����� �����, � ������� �������� ���� ���� ������������. �������-����� ���������� ����� ��� ����������� ������ ���� ��������. � �������� ���� ����������� ��������� ��������� ��������� ������������. �������� �������������� �� �������, � ������� ���� ���� ������������ � ���������� ���� � ������� ������� �����������, �� ��������� � ����� ������ ����� ����� ������. ��� ������ ������ ������������ ����������, ��� ������� ����� ������ �������, ����� ����� �������, ���� �������, ������������� � ����� ���������� �������, ����� � ����������� ������� ����� �������� ����� �� �������������� ����������. �������� ������ ���������� � ���� ���������, �������� ��� ����������. ��� ����������� �� ������� ������� ������ ������������ ���������� � ����, ���, ���� ��������, ���������� � ����� ���������� � ������������ ���� ��������. ���������, ��������� ������� � ��������, �������� �������, ��� ������� �������� ���� �������, ������ ���� �������� ����� ������������. � ������� ������� ���� �������, ���� ������ � ���� �����. ������� ������ ������� �������, ���� ������� ��� ����� ���������� ������ � ����� ��� ������ �� ������ ���������� �������

-- -----------------------------------------------------
-- Schema mydb
--
-- �������-�����, ������� �������� ���� �������� � ��������� ������ � �������. ������� ���������� � ������� ������������ ��������� ��������, � ������ ������ ������ � ����� �����, � ������� �������� ���� ���� ������������. �������-����� ���������� ����� ��� ����������� ������ ���� ��������. � �������� ���� ����������� ��������� ��������� ��������� ������������. �������� �������������� �� �������, � ������� ���� ���� ������������ � ���������� ���� � ������� ������� �����������, �� ��������� � ����� ������ ����� ����� ������. ��� ������ ������ ������������ ����������, ��� ������� ����� ������ �������, ����� ����� �������, ���� �������, ������������� � ����� ���������� �������, ����� � ����������� ������� ����� �������� ����� �� �������������� ����������. �������� ������ ���������� � ���� ���������, �������� ��� ����������. ��� ����������� �� ������� ������� ������ ������������ ���������� � ����, ���, ���� ��������, ���������� � ����� ���������� � ������������ ���� ��������. ���������, ��������� ������� � ��������, �������� �������, ��� ������� �������� ���� �������, ������ ���� �������� ����� ������������. � ������� ������� ���� �������, ���� ������ � ���� �����. ������� ������ ������� �������, ���� ������� ��� ����� ���������� ������ � ����� ��� ������ �� ������ ���������� �������
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Teachers` (
  `idTeachers` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '���������� ������������� ������������� ��� �������������� ��������',
  `f_name` VARCHAR(45) NULL COMMENT '��� ������������(�������������)',
  `s_name` VARCHAR(45) NULL COMMENT '������� ������������(�������������)',
  `m_name` VARCHAR(45) NULL COMMENT '�������� ������������(�������������)',
  `position` VARCHAR(45) NULL COMMENT '��������� ������������(�������������)',
  `department` VARCHAR(45) NULL COMMENT '����� ������������(�������������)',
  `company` VARCHAR(45) NULL COMMENT '��������, ��� �������� ������������ ��������(�������������)',
  `contact_number` VARCHAR(10) NULL COMMENT '���������� �����',
  PRIMARY KEY (`idTeachers`))
ENGINE = InnoDB
COMMENT = '�������������';


-- -----------------------------------------------------
-- Table `mydb`.`Trainings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trainings` (
  `idTrainings` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '���������� ������������� ��������',
  `name` VARCHAR(45) NULL COMMENT '�������� ��������',
  `date_start` DATE NULL COMMENT '���� ������',
  `date_end` DATE NULL COMMENT '���� ���������',
  `head` INT UNSIGNED NOT NULL COMMENT '������������ ��������',
  `country` VARCHAR(45) NULL COMMENT '������ ���������� ��������',
  `describe` MEDIUMTEXT NULL COMMENT '�������� ��������',
  PRIMARY KEY (`idTrainings`),
  INDEX `fk_Trainings_Teachers_idx` (`head` ASC),
  CONSTRAINT `fk_Trainings_Teachers`
    FOREIGN KEY (`head`)
    REFERENCES `mydb`.`Teachers` (`idTeachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '��������';


-- -----------------------------------------------------
-- Table `mydb`.`Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Groups` (
  `idGroups` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '���������� ������������� ��������',
  `name` VARCHAR(45) NULL COMMENT '�������� ������',
  `number_of_students` VARCHAR(45) NULL COMMENT '���������� ��������� � ������(��������������)',
  `chief` INT UNSIGNED NOT NULL COMMENT '������������ ������',
  `idTraining` INT UNSIGNED NOT NULL COMMENT '������� � ������ �������� ������ ������',
  PRIMARY KEY (`idGroups`),
  INDEX `fk_Groups_Teachers1_idx` (`chief` ASC),
  INDEX `fk_Groups_Trainings1_idx` (`idTraining` ASC),
  CONSTRAINT `fk_Groups_Teachers1`
    FOREIGN KEY (`chief`)
    REFERENCES `mydb`.`Teachers` (`idTeachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Groups_Trainings1`
    FOREIGN KEY (`idTraining`)
    REFERENCES `mydb`.`Trainings` (`idTrainings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '������ � ������� ������ ��������';


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `idStudents` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '���������� ������������� ��������',
  `f_name` VARCHAR(45) NULL COMMENT '��� ��������',
  `s_name` VARCHAR(45) NULL COMMENT '������� ��������',
  `m_name` VARCHAR(45) NULL COMMENT '�������� ��������',
  `group` INT UNSIGNED NOT NULL COMMENT '������ � ������� ������� �������',
  `date_in` DATE NULL COMMENT '���� ���������� �� �������',
  `date_out` DATE NULL COMMENT '���� ���������� � ��������',
  `status` TINYINT NULL COMMENT '������ ��������, ������� ���������� ������� �� � ������ �����������, ������� ������� ��� �� �������, ��� ���( 0 - �� �������, 1 - ������, ����� ����� ������ ��� ENUM � ������� ������ ���������� ��������� ������� ���������� ��������)',
  `birthday` DATE NULL,
  `education` VARCHAR(45) NULL,
  `contact_number` VARCHAR(10) NULL COMMENT '����������� �����',
  `additional_information` MEDIUMTEXT NULL COMMENT '�������������� ���������� � ��������',
  PRIMARY KEY (`idStudents`),
  INDEX `status` (`status` ASC),
  INDEX `fk_Students_Groups1_idx` (`group` ASC),
  CONSTRAINT `fk_Students_Groups1`
    FOREIGN KEY (`group`)
    REFERENCES `mydb`.`Groups` (`idGroups`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '��������';


-- -----------------------------------------------------
-- Table `mydb`.`Lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lessons` (
  `idLessons` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher` INT UNSIGNED NOT NULL COMMENT '�������������, ������� �������',
  `idTraining` INT UNSIGNED NOT NULL COMMENT '������� � ������� �������� �������� �������',
  `idGroup` INT UNSIGNED NOT NULL COMMENT '������ ��� ������� �������� �������',
  `start` DATETIME NULL COMMENT '���� � ����� ������ �������',
  `end` DATETIME NULL COMMENT '���� � ����� ��������� �������',
  `theme` VARCHAR(45) NULL COMMENT '���� �������',
  `city` VARCHAR(45) NULL COMMENT '����� ���������� �������',
  `street` VARCHAR(45) NULL COMMENT '����� �����, ��� ���������� �������',
  `room` INT NULL COMMENT '����� ���������, ��� ���������� �������',
  `describe` MEDIUMTEXT NULL COMMENT '�������� �������',
  PRIMARY KEY (`idLessons`),
  INDEX `fk_Lessons_Groups1_idx` (`idGroup` ASC),
  INDEX `fk_Lessons_Teachers1_idx` (`teacher` ASC),
  CONSTRAINT `fk_Lessons_Trainings1`
    FOREIGN KEY (`idTraining`)
    REFERENCES `mydb`.`Trainings` (`idTrainings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lessons_Groups1`
    FOREIGN KEY (`idGroup`)
    REFERENCES `mydb`.`Groups` (`idGroups`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lessons_Teachers1`
    FOREIGN KEY (`teacher`)
    REFERENCES `mydb`.`Teachers` (`idTeachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '�������';


-- -----------------------------------------------------
-- Table `mydb`.`Tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tasks` (
  `idTask` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idTraining` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL COMMENT '�������� �������( � ���������� � \"describe\"  ����� ��� ��������� ����, ��� ��� ������ ���������� ��������� �������������� �������� \"Tasks\" � �� �������� ������������� ������)',
  `describe` MEDIUMTEXT NOT NULL COMMENT '�������� �������',
  `start_date` DATETIME NULL COMMENT '���� ������ ',
  `deadline` DATETIME NULL COMMENT '���� �����',
  INDEX `fk_Tasks_Trainings1_idx` (`idTraining` ASC),
  PRIMARY KEY (`idTask`),
  CONSTRAINT `fk_Tasks_Trainings1`
    FOREIGN KEY (`idTraining`)
    REFERENCES `mydb`.`Trainings` (`idTrainings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '������� ��� ���������';


-- -----------------------------------------------------
-- Table `mydb`.`StudentResults`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StudentResults` (
  `Students_idStudents` INT UNSIGNED NOT NULL COMMENT '���������� ������������� ��������',
  `idTask` INT UNSIGNED NOT NULL,
  `mark` INT NULL COMMENT '������ �������� �� ����������� ������',
  `comments` TINYTEXT NULL COMMENT '����������� � ������������ ��������� �������',
  PRIMARY KEY (`Students_idStudents`, `idTask`),
  INDEX `fk_Tasks_has_Students_Students1_idx` (`Students_idStudents` ASC),
  INDEX `fk_StudentResults_Tasks1_idx` (`idTask` ASC),
  CONSTRAINT `fk_Tasks_has_Students_Students1`
    FOREIGN KEY (`Students_idStudents`)
    REFERENCES `mydb`.`Students` (`idStudents`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentResults_Tasks1`
    FOREIGN KEY (`idTask`)
    REFERENCES `mydb`.`Tasks` (`idTask`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '������ ������ ��������� �� ������������ ��������';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
