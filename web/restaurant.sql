/*
SQLyog Community v8.53 
MySQL - 5.5.27 : Database - restaurante
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`restaurante` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `restaurante`;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `nombre` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `categoria` */

/*Table structure for table `mesa` */

DROP TABLE IF EXISTS `mesa`;

CREATE TABLE `mesa` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `numero` varchar(20) DEFAULT NULL,
  `capacidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mesa` */

/*Table structure for table `pedido` */

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `fecha` varchar(20) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `id_mesa` varchar(20) DEFAULT NULL,
  `id_usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_mesa` (`id_mesa`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_mesa`) REFERENCES `mesa` (`id`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedido` */

/*Table structure for table `persona_dato` */

DROP TABLE IF EXISTS `persona_dato`;

CREATE TABLE `persona_dato` (
  `id` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ap_paterno` varchar(20) NOT NULL,
  `ap_materno` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `persona_dato` */

insert  into `persona_dato`(`id`,`nombre`,`ap_paterno`,`ap_materno`) values ('1','Elvis','Ali','Vilca'),('2','admin','admin','admin');

/*Table structure for table `personas_dato` */

DROP TABLE IF EXISTS `personas_dato`;

CREATE TABLE `personas_dato` (
  `id` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ap_paterno` varchar(20) NOT NULL,
  `ap_materno` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `personas_dato` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `nombre` varchar(20) DEFAULT NULL,
  `precio` varchar(20) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `id_categoria` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `producto` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` varchar(20) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_persona` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`usuario`,`password`,`id_persona`) values ('u1','elvis_f45','123','1');

/*Table structure for table `usuario_rol` */

DROP TABLE IF EXISTS `usuario_rol`;

CREATE TABLE `usuario_rol` (
  `id_usuario` varchar(20) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario_rol` */

insert  into `usuario_rol`(`id_usuario`,`rol`,`estado`) values ('u1','MOZO',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
