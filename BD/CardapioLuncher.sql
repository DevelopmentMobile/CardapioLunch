-- MySQL Script generated by MySQL Workbench
-- 05/27/15 20:44:05
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema CardapioLuncher
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CardapioLuncher
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CardapioLuncher` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `CardapioLuncher` ;

-- -----------------------------------------------------
-- Table `CardapioLuncher`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CardapioLuncher`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `login` TEXT NOT NULL,
  `senha` TEXT NOT NULL,
  `nome` TEXT NOT NULL,
  `fone` TEXT NOT NULL,
  `tipo` TEXT NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CardapioLuncher`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CardapioLuncher`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `tipo` TEXT NOT NULL,
  `preco` DOUBLE NOT NULL,
  `calorias` INT NOT NULL,
  `descricao` TEXT NOT NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CardapioLuncher`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CardapioLuncher`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `mesa` INT NOT NULL,
  `status` TEXT NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CardapioLuncher`.`pedido_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CardapioLuncher`.`pedido_produto` (
  `cliente_idcliente` INT NOT NULL,
  `produto_idproduto` INT NOT NULL,
  `status` TEXT NOT NULL,
  PRIMARY KEY (`cliente_idcliente`, `produto_idproduto`),
  INDEX `fk_cliente_has_produto_produto1_idx` (`produto_idproduto` ASC),
  INDEX `fk_cliente_has_produto_cliente_idx` (`cliente_idcliente` ASC),
  CONSTRAINT `fk_cliente_has_produto_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `CardapioLuncher`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_produto_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `CardapioLuncher`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CardapioLuncher`.`pacote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CardapioLuncher`.`pacote` (
  `idpacote` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `tipo` TEXT NOT NULL,
  PRIMARY KEY (`idpacote`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CardapioLuncher`.`produto_has_pacote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CardapioLuncher`.`produto_has_pacote` (
  `produto_idproduto` INT NOT NULL,
  `pacote_idpacote` INT NOT NULL,
  PRIMARY KEY (`produto_idproduto`, `pacote_idpacote`),
  INDEX `fk_produto_has_pacote_pacote1_idx` (`pacote_idpacote` ASC),
  INDEX `fk_produto_has_pacote_produto1_idx` (`produto_idproduto` ASC),
  CONSTRAINT `fk_produto_has_pacote_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `CardapioLuncher`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_pacote_pacote1`
    FOREIGN KEY (`pacote_idpacote`)
    REFERENCES `CardapioLuncher`.`pacote` (`idpacote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CardapioLuncher`.`pedido_pacote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CardapioLuncher`.`pedido_pacote` (
  `cliente_idcliente` INT NOT NULL,
  `pacote_idpacote` INT NOT NULL,
  `status` TEXT NOT NULL,
  PRIMARY KEY (`cliente_idcliente`, `pacote_idpacote`),
  INDEX `fk_cliente_has_pacote_pacote1_idx` (`pacote_idpacote` ASC),
  INDEX `fk_cliente_has_pacote_cliente1_idx` (`cliente_idcliente` ASC),
  CONSTRAINT `fk_cliente_has_pacote_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `CardapioLuncher`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_pacote_pacote1`
    FOREIGN KEY (`pacote_idpacote`)
    REFERENCES `CardapioLuncher`.`pacote` (`idpacote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
