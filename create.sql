-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- Тренинг-центр, который проводит свои тренинги в различных местах и странах. Тренинг проводится с помощью специалистов различных компаний, с разным опытом работы в своей сфере, у каждого тренинга есть свой руководитель. Тренинг-центр приглашает людей для прохождения какого либо тренинга. У студента есть возможность проходить несколько тренингов одновременно. Студенты распределяются по группам, у которой есть свой руководитель и количество мест в которой заранее определенно, но студентов в любой момент может стать меньше. Для каждой группы составляется расписание, где указано время начала занятия, время конца занятия, тема занятия, преподаватель и место проведения занятия, также в расписаниие занятия может вносится какая то дополнительная информация. Компания хранит информацию о всех студентах, активных или неактивных. Для поступления на тренинг студент должен предоставить информацию о себе, ФИО, дату рождения, информацию о своем образоание и предоставить свои контакты. Студентам, принявшим участие в тренинге, выдаются задания, для каждого тренинга свои задания, однако темы тренинга могут пересекаться. У каждого задания есть условие, дата выдачи и дата сдачи. Студент должен сдавать задания, сдав вовремя ему будет выставлена оценка и будет дан фидбек по поводу выполнения задания

-- -----------------------------------------------------
-- Schema mydb
--
-- Тренинг-центр, который проводит свои тренинги в различных местах и странах. Тренинг проводится с помощью специалистов различных компаний, с разным опытом работы в своей сфере, у каждого тренинга есть свой руководитель. Тренинг-центр приглашает людей для прохождения какого либо тренинга. У студента есть возможность проходить несколько тренингов одновременно. Студенты распределяются по группам, у которой есть свой руководитель и количество мест в которой заранее определенно, но студентов в любой момент может стать меньше. Для каждой группы составляется расписание, где указано время начала занятия, время конца занятия, тема занятия, преподаватель и место проведения занятия, также в расписаниие занятия может вносится какая то дополнительная информация. Компания хранит информацию о всех студентах, активных или неактивных. Для поступления на тренинг студент должен предоставить информацию о себе, ФИО, дату рождения, информацию о своем образоание и предоставить свои контакты. Студентам, принявшим участие в тренинге, выдаются задания, для каждого тренинга свои задания, однако темы тренинга могут пересекаться. У каждого задания есть условие, дата выдачи и дата сдачи. Студент должен сдавать задания, сдав вовремя ему будет выставлена оценка и будет дан фидбек по поводу выполнения задания
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Teachers` (
  `idTeachers` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор руководителей или преподавателей тренинга',
  `f_name` VARCHAR(45) NULL COMMENT 'Имя руководителя(преподавателя)',
  `s_name` VARCHAR(45) NULL COMMENT 'Фамилия руководителя(преподавателя)',
  `m_name` VARCHAR(45) NULL COMMENT 'Отчество руководителя(преподавателя)',
  `position` VARCHAR(45) NULL COMMENT 'Должность руководителя(преподавателя)',
  `department` VARCHAR(45) NULL COMMENT 'Отдел руководителя(преподавателя)',
  `company` VARCHAR(45) NULL COMMENT 'Компания, где работает руководитель тренинга(преподаватель)',
  `contact_number` VARCHAR(10) NULL COMMENT 'Контактный номер',
  PRIMARY KEY (`idTeachers`))
ENGINE = InnoDB
COMMENT = 'Преподаватели';


-- -----------------------------------------------------
-- Table `mydb`.`Trainings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trainings` (
  `idTrainings` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор тренинга',
  `name` VARCHAR(45) NULL COMMENT 'Название тренинга',
  `date_start` DATE NULL COMMENT 'Дата начала',
  `date_end` DATE NULL COMMENT 'Дата окончания',
  `head` INT UNSIGNED NOT NULL COMMENT 'Руководитель тренинга',
  `country` VARCHAR(45) NULL COMMENT 'Страна проведения тренинга',
  `describe` MEDIUMTEXT NULL COMMENT 'Описание тренинга',
  PRIMARY KEY (`idTrainings`),
  INDEX `fk_Trainings_Teachers_idx` (`head` ASC),
  CONSTRAINT `fk_Trainings_Teachers`
    FOREIGN KEY (`head`)
    REFERENCES `mydb`.`Teachers` (`idTeachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Тренинги';


-- -----------------------------------------------------
-- Table `mydb`.`Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Groups` (
  `idGroups` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор тренинга',
  `name` VARCHAR(45) NULL COMMENT 'Название группы',
  `number_of_students` VARCHAR(45) NULL COMMENT 'количество студентов в группе(предполагаемое)',
  `chief` INT UNSIGNED NOT NULL COMMENT 'Руководитель группы',
  `idTraining` INT UNSIGNED NOT NULL COMMENT 'Тренинг в состав которого входит группа',
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
COMMENT = 'Группы в которые входят студенты';


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `idStudents` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор студента',
  `f_name` VARCHAR(45) NULL COMMENT 'Имя студента',
  `s_name` VARCHAR(45) NULL COMMENT 'Фамилия студента',
  `m_name` VARCHAR(45) NULL COMMENT 'Отчество студента',
  `group` INT UNSIGNED NOT NULL COMMENT 'Группа в которой состоит студент',
  `date_in` DATE NULL COMMENT 'Дата зачисления на тренинг',
  `date_out` DATE NULL COMMENT 'Дата исключения с тренинга',
  `status` TINYINT NULL COMMENT 'Статус студента, который показывает активен он в рамках организации, которая приняла его на тренинг, или нет( 0 - не активен, 1 - актиен, также можно задать тип ENUM в которым буцдут задаваться различные статусы активности студента)',
  `birthday` DATE NULL,
  `education` VARCHAR(45) NULL,
  `contact_number` VARCHAR(10) NULL COMMENT 'Констактный номер',
  `additional_information` MEDIUMTEXT NULL COMMENT 'Дополнительная информация о студенте',
  PRIMARY KEY (`idStudents`),
  INDEX `status` (`status` ASC),
  INDEX `fk_Students_Groups1_idx` (`group` ASC),
  CONSTRAINT `fk_Students_Groups1`
    FOREIGN KEY (`group`)
    REFERENCES `mydb`.`Groups` (`idGroups`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Студенты';


-- -----------------------------------------------------
-- Table `mydb`.`Lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lessons` (
  `idLessons` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher` INT UNSIGNED NOT NULL COMMENT 'Преподаватель, ведущий занятие',
  `idTraining` INT UNSIGNED NOT NULL COMMENT 'Тренинг в составе которого проходит занятие',
  `idGroup` INT UNSIGNED NOT NULL COMMENT 'Группа для которой проходит занятие',
  `start` DATETIME NULL COMMENT 'Дата и время начала занятия',
  `end` DATETIME NULL COMMENT 'Дата и время окончания занятия',
  `theme` VARCHAR(45) NULL COMMENT 'Тема занятия',
  `city` VARCHAR(45) NULL COMMENT 'Город проведения занятия',
  `street` VARCHAR(45) NULL COMMENT 'Адрес улицы, где проводится занятие',
  `room` INT NULL COMMENT 'Номер аудитории, где проводится занятие',
  `describe` MEDIUMTEXT NULL COMMENT 'Описание занятия',
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
COMMENT = 'Занятия';


-- -----------------------------------------------------
-- Table `mydb`.`Tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tasks` (
  `idTask` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idTraining` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL COMMENT 'Название задания( в комбинации с \"describe\"  взято как первичный ключ, так как данная комбинация уникально идентифицирует сущность \"Tasks\" и не является синтетическим ключом)',
  `describe` MEDIUMTEXT NOT NULL COMMENT 'Описание задания',
  `start_date` DATETIME NULL COMMENT 'Дата выдачи ',
  `deadline` DATETIME NULL COMMENT 'Дата сдачи',
  INDEX `fk_Tasks_Trainings1_idx` (`idTraining` ASC),
  PRIMARY KEY (`idTask`),
  CONSTRAINT `fk_Tasks_Trainings1`
    FOREIGN KEY (`idTraining`)
    REFERENCES `mydb`.`Trainings` (`idTrainings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Задания для студентов';


-- -----------------------------------------------------
-- Table `mydb`.`StudentResults`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StudentResults` (
  `Students_idStudents` INT UNSIGNED NOT NULL COMMENT 'Уникальный идентификатор студента',
  `idTask` INT UNSIGNED NOT NULL,
  `mark` INT NULL COMMENT 'Оценка студента за выполненную работу',
  `comments` TINYTEXT NULL COMMENT 'Комментарии к выполненному студентом заданию',
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
COMMENT = 'Табель оценок студентов по определенным заданиям';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
