-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para es_extended
CREATE DATABASE IF NOT EXISTS `es_extended` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `es_extended`;

-- Volcando estructura para tabla es_extended.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.addon_account: ~4 rows (aproximadamente)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Concesionario', 1),
	('society_mechanic', 'Mecánico', 1),
	('society_police', 'Policía', 1);

-- Volcando estructura para tabla es_extended.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.addon_account_data: ~4 rows (aproximadamente)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 0, NULL),
	(2, 'society_cardealer', 0, NULL),
	(3, 'society_police', 0, NULL),
	(4, 'society_mechanic', 0, NULL);

-- Volcando estructura para tabla es_extended.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.addon_inventory: ~4 rows (aproximadamente)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Concesionario', 1),
	('society_mechanic', 'Mecánico', 1),
	('society_police', 'Policía', 1);

-- Volcando estructura para tabla es_extended.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.addon_inventory_items: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.billing: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.cardealer_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.datastore: ~3 rows (aproximadamente)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_mechanic', 'Mécanico', 1),
	('society_police', 'Policía', 1);

-- Volcando estructura para tabla es_extended.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.datastore_data: ~3 rows (aproximadamente)
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_ambulance', NULL, '\'{}\''),
	(2, 'society_police', NULL, '\'{}\''),
	(3, 'society_mechanic', NULL, '\'{}\'');

-- Volcando estructura para tabla es_extended.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.fine_types: ~52 rows (aproximadamente)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Mal uso del claxon', 30, 0),
	(2, 'Cruzar indebidamente la línea continua', 40, 0),
	(3, 'Conducir por el lado incorrecto de la carretera', 250, 0),
	(4, 'Giro indebido', 250, 0),
	(5, 'Conducir indebidamente fuera de la carretera', 170, 0),
	(6, 'No hacer caso a una orden de un agente', 30, 0),
	(7, 'Detener el vehículo de forma incorrecta', 150, 0),
	(8, 'Aparcar en un lugar no habilitado', 70, 0),
	(9, 'No ceder al girar a la derecha', 70, 0),
	(10, 'No cumplir con los datos de tu vehículo', 90, 0),
	(11, 'No pararse en una señal de STOP', 105, 0),
	(12, 'No pararse en un semáforo cuando está en rojo', 130, 0),
	(13, 'Cruzar indebidamente', 100, 0),
	(14, 'Conducir un coche no permitido', 100, 0),
	(15, 'Conducir sin carnet de conducción', 1500, 0),
	(16, 'Chocar y darse a la fuga', 800, 0),
	(17, 'Exceder la velocidad permitida en 5 km/h', 90, 0),
	(18, 'Exceder la velocidad permitida entre 5 y 15 km/h', 120, 0),
	(19, 'Exceder la velocidad permitida entre 15 y 30 km/h', 180, 0),
	(20, 'Exceder la velocidad permitida más de 30 km/h', 300, 0),
	(21, 'Generar atasco en una carretera', 110, 1),
	(22, 'Intoxicación pública', 90, 1),
	(23, 'Conducta alocada', 90, 1),
	(24, 'Obstrucción a la justicia', 130, 1),
	(25, 'Insultos hacia civiles', 75, 1),
	(26, 'Insultos hacia un agente', 110, 1),
	(27, 'Amenaza verbar a un civil', 90, 1),
	(28, 'Amenaza verbal a un agente', 150, 1),
	(29, 'Dar información falsa', 250, 1),
	(30, 'Intento de corrupción', 1500, 1),
	(31, 'Tendencia de armas en los limites de la ciudad', 120, 2),
	(32, 'Tendencia de armas letales en los limites de la ciudad', 300, 2),
	(33, 'No tener licencia de armas', 600, 2),
	(34, 'Posesión de un arma ilegal', 700, 2),
	(35, 'Posesión de herramientas para robos', 300, 2),
	(36, 'Desorden público', 1800, 2),
	(37, 'Intento de venta o distribución de sustancias ilegales', 1500, 2),
	(38, 'Fabricación de sustancias ilegales', 1500, 2),
	(39, 'Posesión de sustancias ilegales', 650, 2),
	(40, 'Secuestro de un civil', 1500, 2),
	(41, 'Secuestro de un agente', 2000, 2),
	(42, 'Robo', 650, 2),
	(43, 'Robo armado a una tienda', 650, 2),
	(44, 'Robo armado a un banco', 1500, 2),
	(45, 'Asalto a un civil', 2000, 3),
	(46, 'Asalto a un agente', 2500, 3),
	(47, 'Intento de asesinato a un civil', 3000, 3),
	(48, 'Intento de asesinato a un agente', 5000, 3),
	(49, 'Asesinato de un civil', 10000, 3),
	(50, 'Asesinato de un policia', 30000, 3),
	(51, 'Homicidio involuntario', 1800, 3),
	(52, 'Fraude', 2000, 2);

-- Volcando estructura para tabla es_extended.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.items: ~8 rows (aproximadamente)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('bandage', 'Bandage', 2, 0, 1),
	('blowpipe', 'Soplete', 2, 0, 1),
	('carokit', 'Kit de cuerpo', 3, 0, 1),
	('carotool', 'Herramientas', 2, 0, 1),
	('fixkit', 'Kit de reparación', 3, 0, 1),
	('fixtool', 'Herramientas de reparo', 2, 0, 1),
	('gazbottle', 'Botella de gas', 2, 0, 1),
	('medikit', 'Medikit', 2, 0, 1);

-- Volcando estructura para tabla es_extended.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.jobs: ~10 rows (aproximadamente)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 1),
	('bus-driver', 'Busero', 0),
	('cardealer', 'Concesionario', 1),
	('forklift-driver', 'Montacargas', 0),
	('garbage-driver', 'Basurero', 0),
	('lifeguard', 'Salvavidas', 0),
	('mechanic', 'Mecánico', 1),
	('police', 'Policía', 1),
	('scuba-diver', 'Scuba', 0),
	('unemployed', 'Desempleado', 0);

-- Volcando estructura para tabla es_extended.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.job_grades: ~24 rows (aproximadamente)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Desempleado', 200, '{}', '{}'),
	(2, 'cardealer', 0, 'recruit', 'Recluta', 10, '{}', '{}'),
	(3, 'cardealer', 1, 'novice', 'Novato', 25, '{}', '{}'),
	(4, 'cardealer', 2, 'experienced', 'Experimentado', 40, '{}', '{}'),
	(5, 'cardealer', 3, 'boss', 'Jefe', 0, '{}', '{}'),
	(6, 'ambulance', 0, 'ambulance', 'EMS', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(7, 'ambulance', 1, 'doctor', 'EMS Experimentado', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(8, 'ambulance', 2, 'chief_doctor', 'EMS Supervisor', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(9, 'ambulance', 3, 'boss', 'Jefe', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(10, 'police', 0, 'recruit', 'Cadete', 20, '{}', '{}'),
	(11, 'police', 1, 'officer', 'Oficial', 40, '{}', '{}'),
	(12, 'police', 2, 'sergeant', 'Sargento', 60, '{}', '{}'),
	(13, 'police', 3, 'lieutenant', 'Teniente', 85, '{}', '{}'),
	(14, 'police', 4, 'boss', 'Jefe', 100, '{}', '{}'),
	(15, 'mechanic', 0, 'recrue', 'Recluta', 12, '{}', '{}'),
	(16, 'mechanic', 1, 'novice', 'Novato', 24, '{}', '{}'),
	(17, 'mechanic', 2, 'experimente', 'Experimentado', 36, '{}', '{}'),
	(18, 'mechanic', 3, 'chief', 'Supervisor', 48, '{}', '{}'),
	(19, 'mechanic', 4, 'boss', 'Jefe', 0, '{}', '{}'),
	(20, 'bus-driver', 0, 'employee', 'Empleado', 50, '{}', '{}'),
	(21, 'forklift-driver', 0, 'employee', 'Empleado', 50, '{}', '{}'),
	(22, 'scuba-diver', 0, 'employee', 'Empleado', 50, '{}', '{}'),
	(23, 'lifeguard', 0, 'employee', 'Empleado', 50, '{}', '{}'),
	(24, 'garbage-driver', 0, 'employee', 'Empleado', 50, '{}', '{}');

-- Volcando estructura para tabla es_extended.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.licenses: ~5 rows (aproximadamente)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Permiso teórico de conducir'),
	('drive', 'Permiso de conducir de coche'),
	('drive_bike', 'Permiso de conducir de moto'),
	('drive_truck', 'Permiso de conducir de camión'),
	('weapon', 'Permiso de armas');

-- Volcando estructura para tabla es_extended.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.management_outfits: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `peopleWithKeys` longtext DEFAULT '[]',
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.owned_vehicles: ~2 rows (aproximadamente)
INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`, `parking`, `peopleWithKeys`, `glovebox`, `trunk`) VALUES
	('ffd8ac5f04b93043d9a101cdf1a17be7dc6e91a2', 'BCJ 571', '{"wheels":3,"modXenon":false,"modRoof":-1,"deformation":[],"modHorns":-1,"modHood":-1,"dashboardColor":0,"modRightFender":-1,"modHydrolic":-1,"doorsBroken":{"6":false,"0":false,"1":false,"2":false,"3":false,"4":false,"5":false},"modFrame":-1,"modFender":-1,"plate":"BCJ 571","modFrontBumper":-1,"modEngineBlock":-1,"xenonColor":255,"modLivery":-1,"modTrimA":-1,"fuelLevel":54.9,"bodyHealth":1000.0,"tyreSmokeColor":[255,255,255],"modSmokeEnabled":false,"modDashboard":-1,"modTransmission":-1,"modBrakes":-1,"modVanityPlate":-1,"modTurbo":false,"modSpeakers":-1,"model":-16948145,"color1":4,"windowTint":-1,"modSteeringWheel":-1,"modAirFilter":-1,"modArchCover":-1,"modDoorR":-1,"modOrnaments":-1,"modSeats":-1,"modTrimB":-1,"modLightbar":-1,"modBackWheels":-1,"modGrille":-1,"modDoorSpeaker":-1,"modFrontWheels":-1,"modSuspension":-1,"modSideSkirt":-1,"modSpoilers":-1,"modRearBumper":-1,"color2":0,"neonEnabled":[false,false,false,false],"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"modEngine":-1,"wheelColor":156,"modStruts":-1,"modTank":-1,"plateIndex":0,"neonColor":[255,0,255],"pearlescentColor":111,"modAerials":-1,"dirtLevel":10.0,"windowsBroken":{"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true},"modShifterLeavers":-1,"tankHealth":1000.0,"modArmor":-1,"modPlateHolder":-1,"modAPlate":-1,"modDial":-1,"extras":{"10":false,"11":false},"modExhaust":-1,"modTrunk":-1,"engineHealth":1000.0,"interiorColor":0}', 'car', NULL, 0, 'SandyShores', '[]', NULL, NULL),
	('ffd8ac5f04b93043d9a101cdf1a17be7dc6e91a2', 'RBJ 909', '{"modExhaust":-1,"tankHealth":999.2,"wheels":3,"plateIndex":0,"modTurbo":false,"neonEnabled":[false,false,false,false],"modHood":-1,"modRearBumper":-1,"modSeats":-1,"deformation":[],"modTrunk":-1,"modTrimB":-1,"modFrame":-1,"modPlateHolder":-1,"dashboardColor":0,"doorsBroken":{"6":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"modTank":-1,"modSideSkirt":-1,"modGrille":-1,"modFender":-1,"dirtLevel":11.1,"fuelLevel":28.2,"tyreBurst":{"4":false,"1":false,"0":false,"5":false},"windowsBroken":{"6":false,"7":false,"4":true,"5":true,"2":false,"3":false,"0":false,"1":false},"modBackWheels":-1,"modLivery":-1,"modEngineBlock":-1,"modDoorR":-1,"modVanityPlate":-1,"modDoorSpeaker":-1,"modTransmission":-1,"modSuspension":-1,"modFrontBumper":-1,"wheelColor":156,"modOrnaments":-1,"modHorns":-1,"extras":{"11":1,"10":false},"tyreSmokeColor":[255,255,255],"bodyHealth":992.3,"modRoof":-1,"modAerials":-1,"modSteeringWheel":-1,"modArchCover":-1,"modHydrolic":-1,"modAPlate":-1,"xenonColor":255,"modLightbar":-1,"color1":1,"modSmokeEnabled":false,"modShifterLeavers":-1,"modBrakes":-1,"neonColor":[255,0,255],"color2":0,"modArmor":-1,"model":-16948145,"engineHealth":991.8,"modTrimA":-1,"modFrontWheels":-1,"modDashboard":-1,"modXenon":false,"modSpeakers":-1,"pearlescentColor":4,"modStruts":-1,"modAirFilter":-1,"modDial":-1,"windowTint":-1,"modEngine":-1,"modRightFender":-1,"plate":"RBJ 909","interiorColor":0,"modSpoilers":-1}', 'car', NULL, 1, 'Legion', '[]', NULL, NULL);

-- Volcando estructura para tabla es_extended.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.ox_doorlock: ~1 rows (aproximadamente)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'LSPD', '{"maxDistance":2,"heading":270,"coords":{"x":453.079345703125,"y":-983.1895141601563,"z":30.83926391601562},"state":1,"model":749848321,"passcode":"3107","doors":false}');

-- Volcando estructura para tabla es_extended.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.ox_inventory: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.pefcl_accounts
CREATE TABLE IF NOT EXISTS `pefcl_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT 0,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'owner',
  `balance` int(11) DEFAULT 25000,
  `type` varchar(255) DEFAULT 'personal',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `number_2` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.pefcl_accounts: ~3 rows (aproximadamente)
INSERT INTO `pefcl_accounts` (`id`, `number`, `accountName`, `isDefault`, `ownerIdentifier`, `role`, `balance`, `type`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
	(2, '920,2878-1401-0320', 'Police', 1, 'police', 'owner', 50, 'shared', '2023-03-20 21:14:08', '2023-03-20 21:14:08', NULL),
	(3, '920,0103-0521-0415', 'Ambulance', 1, 'ambulance', 'owner', 50, 'shared', '2023-03-20 21:56:00', '2023-03-20 21:56:00', NULL),
	(6, '920,7251-2268-1105', 'Cuenta personal', 1, 'ffd8ac5f04b93043d9a101cdf1a17be7dc6e91a2', 'owner', 5620, 'personal', '2023-03-28 21:47:45', '2023-03-30 01:09:22', NULL);

-- Volcando estructura para tabla es_extended.pefcl_cash
CREATE TABLE IF NOT EXISTS `pefcl_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT 2000,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerIdentifier` (`ownerIdentifier`),
  UNIQUE KEY `ownerIdentifier_2` (`ownerIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.pefcl_cash: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.pefcl_external_accounts
CREATE TABLE IF NOT EXISTS `pefcl_external_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pefcl_external_accounts_user_id_number` (`userId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.pefcl_external_accounts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.pefcl_invoices
CREATE TABLE IF NOT EXISTS `pefcl_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `fromIdentifier` varchar(255) NOT NULL,
  `toIdentifier` varchar(255) NOT NULL,
  `receiverAccountIdentifier` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `status` varchar(255) DEFAULT 'PENDING',
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.pefcl_invoices: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.pefcl_shared_accounts
CREATE TABLE IF NOT EXISTS `pefcl_shared_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIdentifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'contributor',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `pefcl_shared_accounts_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.pefcl_shared_accounts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.pefcl_transactions
CREATE TABLE IF NOT EXISTS `pefcl_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `type` varchar(255) DEFAULT 'Outgoing',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `toAccountId` int(11) DEFAULT NULL,
  `fromAccountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAccountId` (`toAccountId`),
  KEY `fromAccountId` (`fromAccountId`),
  CONSTRAINT `pefcl_transactions_ibfk_1` FOREIGN KEY (`toAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pefcl_transactions_ibfk_2` FOREIGN KEY (`fromAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.pefcl_transactions: ~51 rows (aproximadamente)
INSERT INTO `pefcl_transactions` (`id`, `message`, `amount`, `type`, `createdAt`, `updatedAt`, `toAccountId`, `fromAccountId`) VALUES
	(1, 'Welfare Check #1', 200, 'Incoming', '2023-03-20 21:11:18', '2023-03-20 21:11:18', NULL, NULL),
	(2, 'Paycheck #2', 20, 'Incoming', '2023-03-20 21:18:18', '2023-03-20 21:18:18', NULL, NULL),
	(3, 'Withdrew 1000 from an ATM. #3', 1000, 'Outgoing', '2023-03-20 21:46:41', '2023-03-20 21:46:41', NULL, NULL),
	(4, 'Paycheck #4', 20, 'Incoming', '2023-03-20 21:52:40', '2023-03-20 21:52:40', NULL, NULL),
	(5, 'Paycheck #5', 20, 'Incoming', '2023-03-20 21:59:40', '2023-03-20 21:59:40', NULL, NULL),
	(6, 'Paycheck #6', 20, 'Incoming', '2023-03-20 22:06:40', '2023-03-20 22:06:40', NULL, NULL),
	(7, 'Paycheck #7', 20, 'Incoming', '2023-03-21 00:51:21', '2023-03-21 00:51:21', NULL, NULL),
	(8, 'Paycheck #8', 20, 'Incoming', '2023-03-22 23:41:09', '2023-03-22 23:41:09', NULL, NULL),
	(9, 'Paycheck #9', 20, 'Incoming', '2023-03-22 23:49:59', '2023-03-22 23:49:59', NULL, NULL),
	(10, 'Paycheck #10', 20, 'Incoming', '2023-03-22 23:56:59', '2023-03-22 23:56:59', NULL, NULL),
	(11, 'Paycheck #11', 50, 'Incoming', '2023-03-25 00:46:40', '2023-03-25 00:46:40', NULL, NULL),
	(12, 'Paycheck #12', 50, 'Incoming', '2023-03-25 00:58:28', '2023-03-25 00:58:28', NULL, NULL),
	(13, 'Paycheck #13', 50, 'Incoming', '2023-03-25 01:05:28', '2023-03-25 01:05:28', NULL, NULL),
	(14, 'Paycheck #14', 50, 'Incoming', '2023-03-25 01:12:28', '2023-03-25 01:12:28', NULL, NULL),
	(15, 'unknown #15', 50, 'Outgoing', '2023-03-25 01:13:00', '2023-03-25 01:13:00', NULL, NULL),
	(16, 'Paycheck #16', 50, 'Incoming', '2023-03-25 01:19:28', '2023-03-25 01:19:28', NULL, NULL),
	(17, 'Paycheck #17', 50, 'Incoming', '2023-03-25 01:26:28', '2023-03-25 01:26:28', NULL, NULL),
	(18, 'Withdrew 500 from an ATM. #18', 500, 'Outgoing', '2023-03-25 02:01:49', '2023-03-25 02:01:49', NULL, NULL),
	(19, 'Withdrew 1000 from an ATM. #19', 1000, 'Outgoing', '2023-03-25 02:01:50', '2023-03-25 02:01:50', NULL, NULL),
	(20, 'Withdrew 3000 from an ATM. #20', 3000, 'Outgoing', '2023-03-25 02:01:51', '2023-03-25 02:01:51', NULL, NULL),
	(21, 'Withdrew 5000 from an ATM. #21', 5000, 'Outgoing', '2023-03-25 02:01:51', '2023-03-25 02:01:51', NULL, NULL),
	(22, 'Withdrew 1500 from an ATM. #22', 1500, 'Outgoing', '2023-03-25 02:01:52', '2023-03-25 02:01:52', NULL, NULL),
	(23, 'Withdrew 7500 from an ATM. #23', 7500, 'Outgoing', '2023-03-25 02:01:52', '2023-03-25 02:01:52', NULL, NULL),
	(24, 'Withdrew 1000 from an ATM. #24', 1000, 'Outgoing', '2023-03-25 02:01:52', '2023-03-25 02:01:52', NULL, NULL),
	(25, 'Withdrew 3000 from an ATM. #25', 3000, 'Outgoing', '2023-03-25 02:01:53', '2023-03-25 02:01:53', NULL, NULL),
	(26, 'Withdrew 1000 from an ATM. #26', 1000, 'Outgoing', '2023-03-25 02:01:53', '2023-03-25 02:01:53', NULL, NULL),
	(27, 'Withdrew 1500 from an ATM. #27', 1500, 'Outgoing', '2023-03-25 02:01:54', '2023-03-25 02:01:54', NULL, NULL),
	(28, 'Withdrew 7500 from an ATM. #28', 7500, 'Outgoing', '2023-03-25 02:01:54', '2023-03-25 02:01:54', NULL, NULL),
	(29, 'Withdrew 5000 from an ATM. #29', 5000, 'Outgoing', '2023-03-25 02:01:54', '2023-03-25 02:01:54', NULL, NULL),
	(30, 'Withdrew 500 from an ATM. #30', 500, 'Outgoing', '2023-03-25 02:01:55', '2023-03-25 02:01:55', NULL, NULL),
	(31, 'Withdrew 5000 from an ATM. #31', 5000, 'Outgoing', '2023-03-25 02:01:55', '2023-03-25 02:01:55', NULL, NULL),
	(32, 'Withdrew 1000 from an ATM. #32', 1000, 'Outgoing', '2023-03-25 02:01:55', '2023-03-25 02:01:55', NULL, NULL),
	(33, 'Withdrew 1500 from an ATM. #33', 1500, 'Outgoing', '2023-03-25 02:01:56', '2023-03-25 02:01:56', NULL, NULL),
	(34, 'Withdrew 500 from an ATM. #34', 500, 'Outgoing', '2023-03-25 02:01:57', '2023-03-25 02:01:57', NULL, NULL),
	(35, 'Withdrew 500 from an ATM. #35', 500, 'Outgoing', '2023-03-25 02:01:57', '2023-03-25 02:01:57', NULL, NULL),
	(36, 'Withdrew 500 from an ATM. #36', 500, 'Outgoing', '2023-03-25 02:01:58', '2023-03-25 02:01:58', NULL, NULL),
	(37, 'Withdrew 500 from an ATM. #37', 500, 'Outgoing', '2023-03-25 02:01:58', '2023-03-25 02:01:58', NULL, NULL),
	(38, 'Withdrew 500 from an ATM. #38', 500, 'Outgoing', '2023-03-25 02:01:58', '2023-03-25 02:01:58', NULL, NULL),
	(39, 'Withdrew 1000 from an ATM. #39', 1000, 'Outgoing', '2023-03-25 02:01:59', '2023-03-25 02:01:59', NULL, NULL),
	(40, 'Withdrew 500 from an ATM. #40', 500, 'Outgoing', '2023-03-25 02:01:59', '2023-03-25 02:01:59', NULL, NULL),
	(41, 'Withdrew 500 from an ATM. #41', 500, 'Outgoing', '2023-03-25 02:02:00', '2023-03-25 02:02:00', NULL, NULL),
	(42, 'Welfare Check #42', 200, 'Incoming', '2023-03-25 19:50:02', '2023-03-25 19:50:02', NULL, NULL),
	(43, 'Welfare Check #43', 200, 'Incoming', '2023-03-25 21:54:49', '2023-03-25 21:54:49', NULL, NULL),
	(44, 'Welfare Check #44', 200, 'Incoming', '2023-03-25 22:56:13', '2023-03-25 22:56:13', NULL, NULL),
	(45, 'Welfare Check #45', 200, 'Incoming', '2023-03-26 01:38:07', '2023-03-26 01:38:07', NULL, NULL),
	(46, 'Welfare Check #46', 200, 'Incoming', '2023-03-26 01:45:07', '2023-03-26 01:45:07', NULL, NULL),
	(47, 'Welfare Check #47', 200, 'Incoming', '2023-03-26 01:52:07', '2023-03-26 01:52:07', NULL, NULL),
	(48, 'Welfare Check #48', 200, 'Incoming', '2023-03-28 21:58:46', '2023-03-28 21:58:46', 6, NULL),
	(49, 'Welfare Check #49', 200, 'Incoming', '2023-03-28 22:36:40', '2023-03-28 22:36:40', 6, NULL),
	(50, 'Paycheck #50', 20, 'Incoming', '2023-03-30 00:30:21', '2023-03-30 00:30:21', 6, NULL),
	(51, 'Welfare Check #51', 200, 'Incoming', '2023-03-30 01:09:22', '2023-03-30 01:09:22', 6, NULL);

-- Volcando estructura para tabla es_extended.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla es_extended.playerskins: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.player_outfits: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla es_extended.player_outfit_codes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.rented_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.society_moneywash: ~0 rows (aproximadamente)

-- Volcando estructura para tabla es_extended.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `skin` longtext DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.users: ~1 rows (aproximadamente)
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `is_dead`, `skin`, `phone_number`) VALUES
	('ffd8ac5f04b93043d9a101cdf1a17be7dc6e91a2', '{"bank":5620,"money":0,"black_money":0}', 'admin', '[]', 'unemployed', 0, '[]', '[]', '{"y":-993.4945068359375,"x":-240.3164825439453,"heading":113.38582611083985,"z":29.2967529296875}', 'Nova', 'Nova', '08/09/1999', 'm', 200, 0, '{"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":51,"component_id":1,"texture":1},{"drawable":3,"component_id":11,"texture":0},{"drawable":1,"component_id":3,"texture":0},{"drawable":3,"component_id":6,"texture":0}],"tattoos":[],"headOverlays":{"sunDamage":{"style":0,"color":0,"secondColor":0,"opacity":0},"eyebrows":{"style":12,"color":0,"secondColor":0,"opacity":1},"blemishes":{"style":0,"color":0,"secondColor":0,"opacity":0},"blush":{"style":0,"color":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"style":0,"color":0,"secondColor":0,"opacity":0},"chestHair":{"style":0,"color":0,"secondColor":0,"opacity":0},"lipstick":{"style":0,"color":0,"secondColor":0,"opacity":0},"makeUp":{"style":0,"color":57,"secondColor":0,"opacity":0},"beard":{"style":24,"color":41,"secondColor":0,"opacity":1},"ageing":{"style":0,"color":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"style":0,"color":0,"secondColor":0,"opacity":0},"complexion":{"style":0,"color":0,"secondColor":0,"opacity":0}},"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"headBlend":{"skinSecond":0,"shapeThird":0,"skinThird":0,"skinFirst":0,"thirdMix":0,"skinMix":0,"shapeFirst":0,"shapeMix":0,"shapeSecond":0},"eyeColor":2,"faceFeatures":{"lipsThickness":0,"noseWidth":0,"neckThickness":0,"nosePeakSize":0,"chinBoneLenght":0,"jawBoneBackSize":0,"eyeBrownHigh":0,"jawBoneWidth":0,"nosePeakHigh":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"eyesOpening":0,"cheeksBoneHigh":0,"cheeksWidth":0,"chinBoneLowering":0,"noseBoneTwist":0,"chinBoneSize":0,"chinHole":0,"noseBoneHigh":0,"nosePeakLowering":0},"hair":{"style":3,"color":26,"highlight":29,"texture":0}}', NULL);

-- Volcando estructura para tabla es_extended.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.user_licenses: ~2 rows (aproximadamente)
INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'dmv', 'ffd8ac5f04b93043d9a101cdf1a17be7dc6e91a2'),
	(2, 'weapon', 'ffd8ac5f04b93043d9a101cdf1a17be7dc6e91a2');

-- Volcando estructura para tabla es_extended.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.vehicles: ~240 rows (aproximadamente)
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');

-- Volcando estructura para tabla es_extended.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.vehicle_categories: ~11 rows (aproximadamente)
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compactos'),
	('coupes', 'Cupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Todoterreno'),
	('sedans', 'Sedanes'),
	('sports', 'Deportivos'),
	('sportsclassics', 'Deportivos clásicos'),
	('super', 'Super'),
	('suvs', 'Monovolúmenes'),
	('vans', 'Furgonetas');

-- Volcando estructura para tabla es_extended.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.vehicle_sold: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
