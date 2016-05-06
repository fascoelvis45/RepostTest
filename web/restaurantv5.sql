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
  `id` int(10) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `categoria` */



insert  into `categoria`(`id`,`nombre`,`estado`) values (1,'Caldos','1'),(2,'Segundos','1'),(3,'Gaseosas','1');



/*Table structure for table `mesa` */



DROP TABLE IF EXISTS `mesa`;



CREATE TABLE `mesa` (
  `id` int(10) NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `capacidad` varchar(20) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `mesa` */



insert  into `mesa`(`id`,`numero`,`capacidad`,`estado`) values (1,'1','4','1'),(2,'2','4','1'),(3,'3','4','1'),(4,'4','4','1'),(5,'5','4','1'),(6,'6','4','1'),(7,'7','4','1');



/*Table structure for table `pedido` */



DROP TABLE IF EXISTS `pedido`;



CREATE TABLE `pedido` (
  `id` int(10) NOT NULL DEFAULT '111',
  `fecha` date DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `id_mesa` int(10) DEFAULT NULL,
  `id_usuario` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_mesa` (`id_mesa`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_mesa`) REFERENCES `mesa` (`id`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `pedido` */



insert  into `pedido`(`id`,`fecha`,`estado`,`id_mesa`,`id_usuario`) values (1,'2016-03-01','0',1,1),(2,'2016-03-07','1',1,1),(3,'2016-03-07','1',2,1);



/*Table structure for table `pedido_destalle` */



DROP TABLE IF EXISTS `pedido_destalle`;



CREATE TABLE `pedido_destalle` (
  `id_pedido` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `cantidad_producto` varchar(20) NOT NULL,
  `precio_unitario` varchar(20) NOT NULL,
  `precio_total` varchar(20) NOT NULL,
  `igv_unitario` varchar(20) NOT NULL,
  `igv_total` varchar(20) NOT NULL,
  `estado_pedido` varchar(1) NOT NULL,
  `estado_preparacion` varchar(1) NOT NULL,
  `estado_entrega` varchar(1) NOT NULL,
  `estado_cobro` varchar(1) NOT NULL,
  `grupo` varchar(20) NOT NULL,
  `id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `pedido_destalle` */



insert  into `pedido_destalle`(`id_pedido`,`id_producto`,`cantidad_producto`,`precio_unitario`,`precio_total`,`igv_unitario`,`igv_total`,`estado_pedido`,`estado_preparacion`,`estado_entrega`,`estado_cobro`,`id`) values (0,0,'0','0','0','0','0','0','0','0','0',0),(2,1,'1','10','10','0.0','0.0','0','0','0','0',1),(2,2,'1','7','7','0.0','0.0','0','0','0','0',2);



/*Table structure for table `pedido_mesa` */



DROP TABLE IF EXISTS `pedido_mesa`;



CREATE TABLE `pedido_mesa` (
  `id` int(10) NOT NULL DEFAULT '111',
  `id_pedido` int(10) DEFAULT NULL,
  `id_mesa` int(10) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `pedido_mesa` */



insert  into `pedido_mesa`(`id`,`id_pedido`,`id_mesa`,`estado`) values (1,1,1,'0'),(2,2,1,'1'),(3,3,2,'1'),(4,2,3,'1'),(5,2,4,'1'),(6,2,5,'1'),(7,2,6,'1'),(8,2,7,'1'),(9,2,7,'1'),(10,2,7,'1');



/*Table structure for table `persona_dato` */



DROP TABLE IF EXISTS `persona_dato`;



CREATE TABLE `persona_dato` (
  `id` int(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ap_paterno` varchar(20) NOT NULL,
  `ap_materno` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `persona_dato` */



insert  into `persona_dato`(`id`,`nombre`,`ap_paterno`,`ap_materno`) values (1,'Elvis','Ali','Vilca'),(2,'admin','admin','admin');



/*Table structure for table `producto` */



DROP TABLE IF EXISTS `producto`;



CREATE TABLE `producto` (
  `id` int(10) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `precio` varchar(20) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `id_categoria` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `producto` */



insert  into `producto`(`id`,`nombre`,`precio`,`estado`,`id_categoria`) values (1,'cebiche','10','1',2),(2,'Caldo De Gallina','7','1',1),(3,'CocaCola 700ml','2','1',3);



/*Table structure for table `usuario` */



DROP TABLE IF EXISTS `usuario`;



CREATE TABLE `usuario` (
  `id` int(10) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_persona` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `usuario` */



insert  into `usuario`(`id`,`usuario`,`password`,`id_persona`) values (1,'elvis_f45','123','1');



/*Table structure for table `usuario_rol` */



DROP TABLE IF EXISTS `usuario_rol`;



CREATE TABLE `usuario_rol` (
  `id_usuario` int(10) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `usuario_rol` */



insert  into `usuario_rol`(`id_usuario`,`rol`,`estado`) values (0,'MOZO',1),(1,'COCINERO',1);



/* Trigger structure for table `categoria` */



DELIMITER $$



/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `increment_id_categoria` */$$



/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `increment_id_categoria` BEFORE INSERT ON `categoria` FOR EACH ROW SET NEW.id = (SELECT MAX(id) + 1 FROM categoria) */$$





DELIMITER ;



/* Trigger structure for table `mesa` */



DELIMITER $$



/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `increment_id_mesa` */$$



/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `increment_id_mesa` BEFORE INSERT ON `mesa` FOR EACH ROW SET NEW.id = (SELECT MAX(id) + 1 FROM mesa) */$$





DELIMITER ;



/* Trigger structure for table `pedido` */



DELIMITER $$



/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `increment_id_pedido` */$$



/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `increment_id_pedido` BEFORE INSERT ON `pedido` FOR EACH ROW SET NEW.id = (SELECT MAX(id) + 1 FROM pedido) */$$





DELIMITER ;



/* Trigger structure for table `pedido_destalle` */



DELIMITER $$



/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `increment_id_pedido_detalle` */$$



/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `increment_id_pedido_detalle` BEFORE INSERT ON `pedido_destalle` FOR EACH ROW SET NEW.id = (SELECT MAX(id) + 1 FROM pedido_destalle) */$$





DELIMITER ;



/* Trigger structure for table `pedido_mesa` */



DELIMITER $$



/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `increment_id_pedido_mesa` */$$



/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `increment_id_pedido_mesa` BEFORE INSERT ON `pedido_mesa` FOR EACH ROW SET NEW.id = (SELECT MAX(id) + 1 FROM pedido_mesa) */$$





DELIMITER ;



/* Trigger structure for table `persona_dato` */



DELIMITER $$



/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `increment_id_persona_dato` */$$



/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `increment_id_persona_dato` BEFORE INSERT ON `persona_dato` FOR EACH ROW SET NEW.id = (SELECT MAX(id) + 1 FROM persona_dato) */$$





DELIMITER ;



/* Trigger structure for table `producto` */



DELIMITER $$



/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `increment_id_producto` */$$



/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `increment_id_producto` BEFORE INSERT ON `producto` FOR EACH ROW SET NEW.id = (SELECT MAX(id) + 1 FROM producto) */$$





DELIMITER ;



/* Trigger structure for table `usuario` */



DELIMITER $$



/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `increment_id_usuario` */$$



/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `increment_id_usuario` BEFORE INSERT ON `usuario` FOR EACH ROW SET NEW.id = (SELECT MAX(id) + 1 FROM usuario) */$$





DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

