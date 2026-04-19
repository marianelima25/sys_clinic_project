-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           9.6.0 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.16.0.7229
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para db_sys_clinic
DROP DATABASE IF EXISTS `db_sys_clinic`;
CREATE DATABASE IF NOT EXISTS `db_sys_clinic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_sys_clinic`;

-- Copiando estrutura para tabela db_sys_clinic.tb_agendamentos
DROP TABLE IF EXISTS `tb_agendamentos`;
CREATE TABLE IF NOT EXISTS `tb_agendamentos` (
  `id_agendamento` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_medico` int NOT NULL,
  `data_agendamento` date NOT NULL,
  `hora_agendamento` time NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `status_agendamento` varchar(20) NOT NULL DEFAULT 'Agendado',
  PRIMARY KEY (`id_agendamento`),
  KEY `FK_tb_agendamentos_tb_clientes` (`id_cliente`),
  KEY `FK_tb_agendamentos_tb_medicos` (`id_medico`),
  CONSTRAINT `FK_tb_agendamentos_tb_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`),
  CONSTRAINT `FK_tb_agendamentos_tb_medicos` FOREIGN KEY (`id_medico`) REFERENCES `tb_medicos` (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela db_sys_clinic.tb_agendamentos: ~6 rows (aproximadamente)
DELETE FROM `tb_agendamentos`;
INSERT INTO `tb_agendamentos` (`id_agendamento`, `id_cliente`, `id_medico`, `data_agendamento`, `hora_agendamento`, `observacao`, `status_agendamento`) VALUES
	(1, 10, 3, '2026-04-20', '16:00:00', 'Preferencial', 'Agendado'),
	(3, 5, 6, '2026-04-14', '09:00:00', '(NULL)', 'Agendado'),
	(4, 6, 3, '2026-04-16', '10:00:00', '(NULL)', 'Agendado'),
	(5, 11, 7, '2026-04-18', '09:30:00', 'Retorno', 'Agendado'),
	(6, 1, 1, '2026-04-21', '15:30:00', 'Retorno', 'Agendado'),
	(7, 6, 5, '2026-04-23', '12:30:00', NULL, 'Agendado');

-- Copiando estrutura para tabela db_sys_clinic.tb_clientes
DROP TABLE IF EXISTS `tb_clientes`;
CREATE TABLE IF NOT EXISTS `tb_clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `inativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela db_sys_clinic.tb_clientes: ~5 rows (aproximadamente)
DELETE FROM `tb_clientes`;
INSERT INTO `tb_clientes` (`id_cliente`, `nome`, `telefone`, `email`, `inativo`) VALUES
	(1, 'Cristiano Bahia de Lima', '1192-0039', 'cristianobahia23@gmail.com', 1),
	(5, 'Bianca Lima de Moraes', '7554-3344', 'biancaalima8@gmail.com', 1),
	(6, 'Mariane de Moraes Lima', '9131-8645', 'marianelima@gmail.com', 1),
	(10, 'Gabriela Santos', '8844-3344', 'gabrielasantos@gmail.com', 1),
	(11, 'Amélia dos Santos Lima', '2288-3382', 'ameliasantos47@gmail.com', 1);

-- Copiando estrutura para tabela db_sys_clinic.tb_medicos
DROP TABLE IF EXISTS `tb_medicos`;
CREATE TABLE IF NOT EXISTS `tb_medicos` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `crm` varchar(20) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `crm` (`crm`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela db_sys_clinic.tb_medicos: ~7 rows (aproximadamente)
DELETE FROM `tb_medicos`;
INSERT INTO `tb_medicos` (`id_medico`, `nome`, `telefone`, `crm`, `especialidade`) VALUES
	(1, 'Dr. Flávio Lopes', '2231-5564', 'CRM/PB 000001', 'Clínico Geral'),
	(2, 'Dra. Gabriela Cardoso', '8844-3384', 'CRM/RJ 9400300', 'Gastroenterologista'),
	(3, 'Dra. Ingrid Vallen', '6675-9078', 'CRM/PB 000845', 'Ginecologista'),
	(5, 'Dra. Lívia Santiago', '5544-8443', 'CRM/PB 003454', 'Psiquiatra'),
	(6, 'Dra. Millena Cristiane', '9944-3344', 'CRM/PB 002233', 'Endocrinologista'),
	(7, 'Dra. Anne Caroline', '8465-8364', 'CRM/PE 938475', 'Infectologista'),
	(8, 'Dr. Ricardo Junior', '7465-2237', 'CRM/PE 003312', 'Geriatra');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
