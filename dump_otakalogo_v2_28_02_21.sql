-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.4.17-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura para tabela otakalogo.animes
CREATE TABLE IF NOT EXISTS `animes` (
  `ani_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK - animes',
  `ani_nm_original` varchar(80) NOT NULL,
  `ani_nm_ocidental` varchar(80) NOT NULL,
  `ani_dt_lanc` date NOT NULL,
  `ani_qtde_epi` varchar(300) NOT NULL,
  `est_id` int(11) NOT NULL COMMENT 'FK - estudios',
  `gen_id` int(11) NOT NULL COMMENT 'FK - generos',
  `ver_id` int(11) NOT NULL COMMENT 'FK - versoes',
  `aut_id` int(11) NOT NULL COMMENT 'FK - autores',
  `login` varchar(190) NOT NULL COMMENT 'FK - usuarios',
  `ani_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ani_id`),
  UNIQUE KEY `ani_nm_original` (`ani_nm_original`),
  UNIQUE KEY `ani_nm_ocidental` (`ani_nm_ocidental`),
  KEY `est_id` (`est_id`),
  KEY `gen_id` (`gen_id`) USING BTREE,
  KEY `fk_anime_autor` (`aut_id`),
  KEY `vers_id` (`ver_id`) USING BTREE,
  KEY `login` (`login`),
  CONSTRAINT `fk_anime_autor` FOREIGN KEY (`aut_id`) REFERENCES `autores` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anime_estudio` FOREIGN KEY (`est_id`) REFERENCES `estudios` (`est_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anime_genero` FOREIGN KEY (`gen_id`) REFERENCES `generos` (`gen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anime_usuario` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anime_versao` FOREIGN KEY (`ver_id`) REFERENCES `versoes` (`ver_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.autores
CREATE TABLE IF NOT EXISTS `autores` (
  `aut_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK - autores',
  `aut_nm` varchar(80) NOT NULL,
  `aut_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`aut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.estudios
CREATE TABLE IF NOT EXISTS `estudios` (
  `est_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK - estudios',
  `est_nm` varchar(80) NOT NULL,
  `est_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`est_id`),
  UNIQUE KEY `est_nm` (`est_nm`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.generos
CREATE TABLE IF NOT EXISTS `generos` (
  `gen_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK - generos',
  `gen_nm` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `gen_desc` text CHARACTER SET utf8mb4 NOT NULL,
  `mid_id` int(11) NOT NULL COMMENT 'FK - midias',
  `gen_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`gen_id`),
  KEY `mid_id` (`mid_id`),
  CONSTRAINT `fk_midia` FOREIGN KEY (`mid_id`) REFERENCES `midias` (`mid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.mangas
CREATE TABLE IF NOT EXISTS `mangas` (
  `man_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK - mangas',
  `man_nm_original` varchar(80) NOT NULL,
  `man_nm_ocidental` varchar(80) NOT NULL,
  `man_dt_lanc` date NOT NULL,
  `man_qtde_cap` varchar(1000) NOT NULL,
  `aut_id` int(11) NOT NULL COMMENT 'FK - autores',
  `gen_id` int(11) NOT NULL COMMENT 'FK - generos',
  `ver_id` int(11) NOT NULL COMMENT 'FK - versoes',
  `login` varchar(190) NOT NULL COMMENT 'FK - usuarios',
  `man_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`man_id`),
  KEY `aut_id` (`aut_id`),
  KEY `gen_id` (`gen_id`),
  KEY `vers_id` (`ver_id`) USING BTREE,
  KEY `login` (`login`),
  CONSTRAINT `fk_manga_autor` FOREIGN KEY (`aut_id`) REFERENCES `autores` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_manga_genero` FOREIGN KEY (`gen_id`) REFERENCES `generos` (`gen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_manga_usuario` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_manga_versao` FOREIGN KEY (`ver_id`) REFERENCES `versoes` (`ver_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.midias
CREATE TABLE IF NOT EXISTS `midias` (
  `mid_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK - midias',
  `mid_nm` varchar(50) NOT NULL,
  `mid_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`mid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.sec_apps
CREATE TABLE IF NOT EXISTS `sec_apps` (
  `app_name` varchar(128) NOT NULL,
  `app_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`app_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.sec_groups
CREATE TABLE IF NOT EXISTS `sec_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.sec_groups_apps
CREATE TABLE IF NOT EXISTS `sec_groups_apps` (
  `group_id` int(11) NOT NULL,
  `app_name` varchar(128) NOT NULL,
  `priv_access` varchar(1) DEFAULT NULL,
  `priv_insert` varchar(1) DEFAULT NULL,
  `priv_delete` varchar(1) DEFAULT NULL,
  `priv_update` varchar(1) DEFAULT NULL,
  `priv_export` varchar(1) DEFAULT NULL,
  `priv_print` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`group_id`,`app_name`),
  KEY `sec_groups_apps_ibfk_2` (`app_name`),
  CONSTRAINT `sec_groups_apps_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `sec_groups_apps_ibfk_2` FOREIGN KEY (`app_name`) REFERENCES `sec_apps` (`app_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.sec_users
CREATE TABLE IF NOT EXISTS `sec_users` (
  `login` varchar(190) NOT NULL,
  `pswd` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `activation_code` varchar(32) DEFAULT NULL,
  `priv_admin` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.sec_users_groups
CREATE TABLE IF NOT EXISTS `sec_users_groups` (
  `login` varchar(190) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`login`,`group_id`),
  KEY `sec_users_groups_ibfk_2` (`group_id`),
  CONSTRAINT `sec_users_groups_ibfk_1` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE CASCADE,
  CONSTRAINT `sec_users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela otakalogo.versoes
CREATE TABLE IF NOT EXISTS `versoes` (
  `ver_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK - versoes',
  `ver_nr` int(11) NOT NULL,
  `ver_desc` varchar(50) NOT NULL,
  `mid_id` int(11) NOT NULL COMMENT 'FK - midias',
  `ver_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ver_id`) USING BTREE,
  KEY `gen_id` (`mid_id`),
  CONSTRAINT `fk_versao_midia` FOREIGN KEY (`mid_id`) REFERENCES `midias` (`mid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
