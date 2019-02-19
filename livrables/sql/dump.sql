-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 19, 2019 at 04:11 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `PIZZERIA`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `iD` mediumint(9) NOT NULL,
  `road_category` varchar(50) NOT NULL,
  `street_number` varchar(50) NOT NULL,
  `complement` varchar(150) DEFAULT NULL,
  `zipcode` char(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `supplier_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`iD`, `road_category`, `street_number`, `complement`, `zipcode`, `city`, `email`, `supplier_id`) VALUES
(1, 'Boulevard des Pizzas', '4 bis', NULL, '13001', 'MARSEILLE', 'marseille@oc_pizza.com', NULL),
(2, 'Place des Pizzaiolos', '89', NULL, '69001', 'LYON', 'lyon@oc_pizza.com', NULL),
(3, 'rue de l\'Epeule', '13', NULL, '06150', 'CANNES', 'lyon@oc_pizza.com', NULL),
(4, 'Place des fournisseurs', '9', NULL, '69001', 'LYON', 'ingredeurope@yahoo.com', 1),
(5, 'Rue des Pizzas', '3 ter', 'au rez de chaussee du grand bâtiment du festival', '06150', 'CANNES', 'cannes@fournisseurs.com', 3),
(6, 'rue La Boétie', '12', NULL, '75016', 'PARIS', 'paris@fournisseurs.com', 2),
(7, 'Avenue du donjon Rouge', '1', 'la livraison doit se faire a l\'interieur du donjon rouge, merci.', '12345', 'PORT-REAL', 'cersei@cersei.got', NULL),
(8, 'Rue de Lancehelion', '2', NULL, '12345', 'LES JARDINS AQUATIQUES', 'ellaria@ellaria.got', NULL),
(9, 'Place des dragons', '20', 'deposez vite la livraison, sinon vous risquez de vous faire bruler.', '12345', 'DRAGONSTONE', 'daenerys@daenerys.got', NULL),
(10, 'Ruelle du Nord', '1', NULL, '12345', 'WINTERFELL', 'jeressuscitesurcommande@hotmail.fr', NULL),
(11, 'Place du Jeu de Paume', '29', NULL, '18100', 'VIERZON', 'sdffds@teleworm.us', NULL),
(12, 'cours Jean Jaures', '25', NULL, '33300', 'BORDEAUX', 'dsf@dayrep.com', NULL),
(13, 'rue de la Mare aux Carats', '9', NULL, '34070', 'MONTPELLIER', 'PatriciaLHeureux@jourrapide.com', NULL),
(14, 'Chemin Du Lavarin Sud', '17', NULL, '06800', 'CAGNES-SUR-MER', 'r74@teleworm.us', NULL),
(15, 'rue Jean Vilar', '1 bis', NULL, '33130', 'BÈGLES', 'ouioui@teleworm.us', NULL),
(16, 'rue du Fossé des Tanneurs', '3', NULL, '83100', 'TOULON', 'po@teleworm.us', NULL),
(17, 'Chemin des Bateliers', '4', NULL, '20090', 'AJACCIO', 'MalagigiLangelier@teleworm.us', NULL),
(18, 'rue des six frères Ruellan', '12', NULL, '95110', 'SANNOIS', 'daafdsfds@teleworm.us', NULL),
(19, 'avenue de Provence', '190', NULL, '06220', 'VALLAURIS', 'blabla@teleworm.us', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Billing`
--

CREATE TABLE `Billing` (
  `order_id` mediumint(9) NOT NULL,
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Billing`
--

INSERT INTO `Billing` (`order_id`, `amount`) VALUES
(3, '17.00'),
(1, '32.00'),
(2, '8.00'),
(1, '28.50');

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `num_client` mediumint(9) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_number` char(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`num_client`, `first_name`, `last_name`, `phone_number`, `gender`, `password`) VALUES
(1, 'Cersei', 'Lannister', '0123456789', 'F', 'gameofthrones'),
(2, 'Jon', 'Snow', '0123456789', 'H', 'gameofthrones'),
(3, 'Daenerys', 'Targaryen', '0123456789', 'F', 'gameofthrones'),
(4, 'Ellaria', 'Sand', '0123456789', 'F', 'gameofthrones');

-- --------------------------------------------------------

--
-- Table structure for table `ClientDetails`
--

CREATE TABLE `ClientDetails` (
  `client_id` mediumint(9) NOT NULL,
  `address_id` mediumint(9) NOT NULL,
  `membership_start_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ClientDetails`
--

INSERT INTO `ClientDetails` (`client_id`, `address_id`, `membership_start_date`) VALUES
(1, 7, '2019-02-19 17:11:40'),
(2, 10, '2019-02-19 17:11:40'),
(3, 9, '2019-02-19 17:11:40'),
(4, 8, '2019-02-19 17:11:40');

-- --------------------------------------------------------

--
-- Table structure for table `CommandLine`
--

CREATE TABLE `CommandLine` (
  `order_id` mediumint(9) NOT NULL,
  `pizza_id` tinyint(4) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `pizza_size` enum('1','1.5','2') NOT NULL,
  `pizza_crust` enum('thin','thick','crusty') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CommandLine`
--

INSERT INTO `CommandLine` (`order_id`, `pizza_id`, `quantity`, `pizza_size`, `pizza_crust`) VALUES
(1, 2, 4, '2', 'crusty'),
(1, 4, 3, '1.5', 'thin'),
(2, 2, 1, '1', 'thick'),
(3, 1, 2, '1', 'thin');

-- --------------------------------------------------------

--
-- Table structure for table `Composition`
--

CREATE TABLE `Composition` (
  `ingredient_id` tinyint(4) NOT NULL,
  `recipe_id` tinyint(4) NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Composition`
--

INSERT INTO `Composition` (`ingredient_id`, `recipe_id`, `quantity`) VALUES
(1, 1, '0.10'),
(1, 2, '0.10'),
(1, 3, '0.10'),
(1, 4, '0.10'),
(2, 3, '0.20'),
(3, 4, '0.50'),
(4, 1, '0.20'),
(5, 3, '0.20'),
(5, 4, '0.90'),
(6, 3, '0.09'),
(7, 2, '0.10'),
(8, 2, '0.05'),
(9, 1, '0.05'),
(9, 4, '0.10');

-- --------------------------------------------------------

--
-- Table structure for table `Ingredient`
--

CREATE TABLE `Ingredient` (
  `iD` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ingredient`
--

INSERT INTO `Ingredient` (`iD`, `name`) VALUES
(1, 'blé'),
(2, 'chorizo'),
(3, 'champignons'),
(4, 'fromage'),
(5, 'jambon'),
(6, 'poivrons'),
(7, 'lardons'),
(8, 'crème fraîche'),
(9, 'olives');

-- --------------------------------------------------------

--
-- Table structure for table `OrderPizzeria`
--

CREATE TABLE `OrderPizzeria` (
  `order_number` mediumint(9) NOT NULL,
  `status` enum('pending','being prepared','cancelled','being delivered','picked up','delivered') NOT NULL,
  `date` datetime NOT NULL,
  `payment_made` tinyint(1) NOT NULL,
  `payment_method` enum('debit card online','debit card on delivery','debit card on site','cash on delivery','cash on site','other') NOT NULL,
  `client_id` mediumint(9) NOT NULL,
  `team_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OrderPizzeria`
--

INSERT INTO `OrderPizzeria` (`order_number`, `status`, `date`, `payment_made`, `payment_method`, `client_id`, `team_id`) VALUES
(1, 'pending', '2019-02-11 00:00:00', 0, 'other', 3, 1),
(2, 'being delivered', '2019-02-13 12:43:07', 1, 'cash on delivery', 4, 3),
(3, 'delivered', '2018-12-11 00:00:00', 1, 'debit card on site', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `OrderSupplier`
--

CREATE TABLE `OrderSupplier` (
  `ingredient_id` tinyint(4) NOT NULL,
  `supplier_id` tinyint(4) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OrderSupplier`
--

INSERT INTO `OrderSupplier` (`ingredient_id`, `supplier_id`, `date`, `quantity`) VALUES
(1, 1, '2019-02-03 00:00:00', '4.20'),
(1, 3, '2019-01-01 00:00:00', '3.43'),
(2, 2, '2019-03-01 00:00:00', '2.20'),
(2, 3, '2019-01-07 00:00:00', '0.50'),
(6, 2, '2019-02-10 00:00:00', '1.05'),
(7, 1, '2019-01-01 00:00:00', '5.21');

-- --------------------------------------------------------

--
-- Table structure for table `Pizza`
--

CREATE TABLE `Pizza` (
  `iD` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL,
  `cost` decimal(4,2) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `recipe_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pizza`
--

INSERT INTO `Pizza` (`iD`, `name`, `cost`, `price`, `recipe_id`) VALUES
(1, 'Quatre Fromages', '3.43', '8.50', 1),
(2, 'Forestière', '2.98', '8.00', 4),
(3, 'Volcano', '3.58', '9.00', 3),
(4, 'Fermière', '3.76', '9.50', 2);

-- --------------------------------------------------------

--
-- Table structure for table `PizzaStore`
--

CREATE TABLE `PizzaStore` (
  `iD` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL,
  `revenue` decimal(15,2) DEFAULT NULL,
  `team_size` tinyint(4) DEFAULT NULL,
  `opening_hour` time NOT NULL,
  `closing_hour` time NOT NULL,
  `address_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PizzaStore`
--

INSERT INTO `PizzaStore` (`iD`, `name`, `revenue`, `team_size`, `opening_hour`, `closing_hour`, `address_id`) VALUES
(1, '0C PIZZA LYON EST', '13504.34', 26, '08:00:00', '22:00:00', 2),
(2, '0C PIZZA MARSEILLE ESTAQUES', '18885.04', 31, '07:00:00', '22:00:00', 1),
(3, '0C PIZZA CANNES BOCCA', '21909.90', 25, '09:00:00', '23:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Recipe`
--

CREATE TABLE `Recipe` (
  `iD` tinyint(4) NOT NULL,
  `comment` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Recipe`
--

INSERT INTO `Recipe` (`iD`, `comment`) VALUES
(1, 'Mettre beaucoup de fromage'),
(2, 'Melanger le fromage et la crème fraîche.'),
(3, 'Ajouter un peu de sauce piquante en plus des poivrons et du chorizo.'),
(4, 'Ne pas cuire les champignons.');

-- --------------------------------------------------------

--
-- Table structure for table `Stock`
--

CREATE TABLE `Stock` (
  `ingredient_id` tinyint(4) NOT NULL,
  `pizza_store_id` tinyint(4) NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Stock`
--

INSERT INTO `Stock` (`ingredient_id`, `pizza_store_id`, `quantity`) VALUES
(1, 2, '50.00'),
(2, 1, '940.00'),
(3, 1, '2.90'),
(4, 3, '900.60'),
(5, 3, '200.00'),
(6, 1, '90.10'),
(7, 2, '5.39'),
(8, 2, '4.89'),
(9, 3, '2.00');

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE `Supplier` (
  `iD` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Supplier`
--

INSERT INTO `Supplier` (`iD`, `name`) VALUES
(1, 'INGREDIENTS EUROPE'),
(2, 'CED PARIS'),
(3, 'COMPAGNIE AGRICOLE');

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `iD` mediumint(9) NOT NULL,
  `position` enum('employee','delivery guy','pizza chef','manager','boss') NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_number` char(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `password` varchar(32) NOT NULL,
  `pizza_store_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`iD`, `position`, `first_name`, `last_name`, `phone_number`, `gender`, `password`, `pizza_store_id`) VALUES
(1, 'employee', 'Paul', 'Pierre', '0123456789', 'H', 'password', 3),
(2, 'manager', 'Pierre', 'Jacques', '0123456789', 'H', 'password', 1),
(3, 'employee', 'Eve', 'Dupont', '0123456789', 'F', 'password', 1),
(4, 'delivery guy', 'Claire', 'Martin', '0123456789', 'F', 'password', 2),
(5, 'manager', 'Agnès', 'Téziste', '0123456789', 'F', 'password', 3),
(6, 'pizza chef', 'Harry', 'Potter', '0123456789', 'H', 'password', 2);

-- --------------------------------------------------------

--
-- Table structure for table `TeamDetails`
--

CREATE TABLE `TeamDetails` (
  `team_id` mediumint(9) NOT NULL,
  `address_id` mediumint(9) NOT NULL,
  `membership_start_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TeamDetails`
--

INSERT INTO `TeamDetails` (`team_id`, `address_id`, `membership_start_date`) VALUES
(1, 11, '2019-02-19 17:11:40'),
(2, 15, '2019-02-19 17:11:40'),
(3, 18, '2019-02-19 17:11:40'),
(3, 19, '2019-02-19 17:11:40'),
(4, 12, '2019-02-19 17:11:40'),
(4, 17, '2019-02-19 17:11:40'),
(5, 14, '2019-02-19 17:11:40'),
(6, 13, '2019-02-19 17:11:40'),
(6, 16, '2019-02-19 17:11:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `supplier_address_fk` (`supplier_id`);

--
-- Indexes for table `Billing`
--
ALTER TABLE `Billing`
  ADD KEY `order_pizzeria_billing_fk` (`order_id`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`num_client`);

--
-- Indexes for table `ClientDetails`
--
ALTER TABLE `ClientDetails`
  ADD PRIMARY KEY (`client_id`,`address_id`),
  ADD KEY `client_details_address_fk` (`address_id`);

--
-- Indexes for table `CommandLine`
--
ALTER TABLE `CommandLine`
  ADD PRIMARY KEY (`order_id`,`pizza_id`),
  ADD KEY `command_line_pizza_fk` (`pizza_id`);

--
-- Indexes for table `Composition`
--
ALTER TABLE `Composition`
  ADD PRIMARY KEY (`ingredient_id`,`recipe_id`),
  ADD KEY `composition_recipe_fk` (`recipe_id`);

--
-- Indexes for table `Ingredient`
--
ALTER TABLE `Ingredient`
  ADD PRIMARY KEY (`iD`);

--
-- Indexes for table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `order_pizzeria_client_fk` (`client_id`),
  ADD KEY `order_pizzeria_team_fk` (`team_id`);

--
-- Indexes for table `OrderSupplier`
--
ALTER TABLE `OrderSupplier`
  ADD PRIMARY KEY (`ingredient_id`,`supplier_id`),
  ADD KEY `order_supplier_supplier_fk` (`supplier_id`);

--
-- Indexes for table `Pizza`
--
ALTER TABLE `Pizza`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `pizza_recipe_fk` (`recipe_id`);

--
-- Indexes for table `PizzaStore`
--
ALTER TABLE `PizzaStore`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `pizza_store_address_fk` (`address_id`);

--
-- Indexes for table `Recipe`
--
ALTER TABLE `Recipe`
  ADD PRIMARY KEY (`iD`);

--
-- Indexes for table `Stock`
--
ALTER TABLE `Stock`
  ADD PRIMARY KEY (`ingredient_id`,`pizza_store_id`),
  ADD KEY `stock_pizza_store_fk` (`pizza_store_id`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`iD`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `team_pizza_store_fk` (`pizza_store_id`);

--
-- Indexes for table `TeamDetails`
--
ALTER TABLE `TeamDetails`
  ADD PRIMARY KEY (`team_id`,`address_id`),
  ADD KEY `team_details_address_fk` (`address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `iD` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `num_client` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Ingredient`
--
ALTER TABLE `Ingredient`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  MODIFY `order_number` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Pizza`
--
ALTER TABLE `Pizza`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `PizzaStore`
--
ALTER TABLE `PizzaStore`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Recipe`
--
ALTER TABLE `Recipe`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Team`
--
ALTER TABLE `Team`
  MODIFY `iD` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `supplier_address_fk` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Billing`
--
ALTER TABLE `Billing`
  ADD CONSTRAINT `order_pizzeria_billing_fk` FOREIGN KEY (`order_id`) REFERENCES `OrderPizzeria` (`order_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ClientDetails`
--
ALTER TABLE `ClientDetails`
  ADD CONSTRAINT `client_details_address_fk` FOREIGN KEY (`address_id`) REFERENCES `Address` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `client_details_client_fk` FOREIGN KEY (`client_id`) REFERENCES `Client` (`num_client`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `CommandLine`
--
ALTER TABLE `CommandLine`
  ADD CONSTRAINT `command_line_order_fk` FOREIGN KEY (`order_id`) REFERENCES `OrderPizzeria` (`order_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `command_line_pizza_fk` FOREIGN KEY (`pizza_id`) REFERENCES `Pizza` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Composition`
--
ALTER TABLE `Composition`
  ADD CONSTRAINT `composition_ingredient_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `composition_recipe_fk` FOREIGN KEY (`recipe_id`) REFERENCES `Recipe` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  ADD CONSTRAINT `order_pizzeria_client_fk` FOREIGN KEY (`client_id`) REFERENCES `Client` (`num_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_pizzeria_team_fk` FOREIGN KEY (`team_id`) REFERENCES `Team` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `OrderSupplier`
--
ALTER TABLE `OrderSupplier`
  ADD CONSTRAINT `order_supplier_ingredient_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_supplier_supplier_fk` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Pizza`
--
ALTER TABLE `Pizza`
  ADD CONSTRAINT `pizza_recipe_fk` FOREIGN KEY (`recipe_id`) REFERENCES `Recipe` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PizzaStore`
--
ALTER TABLE `PizzaStore`
  ADD CONSTRAINT `pizza_store_address_fk` FOREIGN KEY (`address_id`) REFERENCES `Address` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Stock`
--
ALTER TABLE `Stock`
  ADD CONSTRAINT `stock_ingredient_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `stock_pizza_store_fk` FOREIGN KEY (`pizza_store_id`) REFERENCES `PizzaStore` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Team`
--
ALTER TABLE `Team`
  ADD CONSTRAINT `team_pizza_store_fk` FOREIGN KEY (`pizza_store_id`) REFERENCES `PizzaStore` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `TeamDetails`
--
ALTER TABLE `TeamDetails`
  ADD CONSTRAINT `team_details_address_fk` FOREIGN KEY (`address_id`) REFERENCES `Address` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `team_details_team_fk` FOREIGN KEY (`team_id`) REFERENCES `Team` (`iD`) ON DELETE NO ACTION ON UPDATE NO ACTION;