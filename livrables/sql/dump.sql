-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  sam. 02 fév. 2019 à 09:26
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `OC_PIZZA`
--

-- --------------------------------------------------------

--
-- Structure de la table `Address`
--

CREATE TABLE `Address` (
  `iD` tinyint(11) NOT NULL,
  `road_category` varchar(50) NOT NULL,
  `street_number` varchar(50) NOT NULL,
  `complement` varchar(150) NOT NULL,
  `zipcode` char(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `pizza_store_id` tinyint(9) NOT NULL,
  `person_id` tinyint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Billing`
--

CREATE TABLE `Billing` (
  `iD` tinyint(4) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `order_id` mediumint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `num_client` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Ingredient`
--

CREATE TABLE `Ingredient` (
  `iD` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL,
  `supplier_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `OrderPizzeria`
--

CREATE TABLE `OrderPizzeria` (
  `order_number` mediumint(9) NOT NULL,
  `status` enum('pending','being prepared','cancelled','being delivered','picked up','delivered') NOT NULL,
  `date` datetime NOT NULL,
  `payment_made` tinyint(1) NOT NULL,
  `payment_method` enum('debit card online','debit card on delivery','debit card on site','cash on delivery','cash on site','other') NOT NULL,
  `client_id` tinyint(4) NOT NULL,
  `team_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Person`
--

CREATE TABLE `Person` (
  `iD` tinyint(4) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_number` char(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Pizza`
--

CREATE TABLE `Pizza` (
  `iD` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL,
  `size` tinyint(4) NOT NULL,
  `crust` varchar(150) NOT NULL,
  `cost` decimal(4,2) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `team_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `PizzaStore`
--

CREATE TABLE `PizzaStore` (
  `iD` tinyint(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `revenue` decimal(15,2) NOT NULL,
  `team_size` tinyint(4) NOT NULL,
  `opening_hour` time NOT NULL,
  `closing_hour` time NOT NULL,
  `team_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Recipe`
--

CREATE TABLE `Recipe` (
  `iD` tinyint(4) NOT NULL,
  `comment` mediumtext NOT NULL,
  `ingredient_id` tinyint(4) NOT NULL,
  `pizza_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Stock`
--

CREATE TABLE `Stock` (
  `ingredient_id` tinyint(4) NOT NULL,
  `pizza_store_id` tinyint(11) NOT NULL,
  `quantity` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Supplier`
--

CREATE TABLE `Supplier` (
  `iD` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Team`
--

CREATE TABLE `Team` (
  `iD` tinyint(11) NOT NULL,
  `position` enum('employee','delivery guy','pizza chef','manager','boss') NOT NULL,
  `workplace` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `pizza_store_id` (`pizza_store_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Index pour la table `Billing`
--
ALTER TABLE `Billing`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`num_client`);

--
-- Index pour la table `Ingredient`
--
ALTER TABLE `Ingredient`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Index pour la table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Index pour la table `Person`
--
ALTER TABLE `Person`
  ADD PRIMARY KEY (`iD`);

--
-- Index pour la table `Pizza`
--
ALTER TABLE `Pizza`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `team_id` (`team_id`);

--
-- Index pour la table `PizzaStore`
--
ALTER TABLE `PizzaStore`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `team_id` (`team_id`);

--
-- Index pour la table `Recipe`
--
ALTER TABLE `Recipe`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `pizza_id` (`pizza_id`);

--
-- Index pour la table `Stock`
--
ALTER TABLE `Stock`
  ADD PRIMARY KEY (`ingredient_id`),
  ADD KEY `pizza_store_id` (`pizza_store_id`);

--
-- Index pour la table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`iD`);

--
-- Index pour la table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`iD`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Address`
--
ALTER TABLE `Address`
  MODIFY `iD` tinyint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Billing`
--
ALTER TABLE `Billing`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Client`
--
ALTER TABLE `Client`
  MODIFY `num_client` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Ingredient`
--
ALTER TABLE `Ingredient`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  MODIFY `order_number` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Person`
--
ALTER TABLE `Person`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Pizza`
--
ALTER TABLE `Pizza`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `PizzaStore`
--
ALTER TABLE `PizzaStore`
  MODIFY `iD` tinyint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Recipe`
--
ALTER TABLE `Recipe`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `iD` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Team`
--
ALTER TABLE `Team`
  MODIFY `iD` tinyint(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`pizza_store_id`) REFERENCES `PizzaStore` (`iD`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `Team` (`iD`);

--
-- Contraintes pour la table `Billing`
--
ALTER TABLE `Billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `OrderPizzeria` (`order_number`);

--
-- Contraintes pour la table `Ingredient`
--
ALTER TABLE `Ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`iD`);

--
-- Contraintes pour la table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  ADD CONSTRAINT `orderpizzeria_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client` (`num_client`),
  ADD CONSTRAINT `orderpizzeria_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `Team` (`iD`);

--
-- Contraintes pour la table `Pizza`
--
ALTER TABLE `Pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Team` (`iD`);

--
-- Contraintes pour la table `PizzaStore`
--
ALTER TABLE `PizzaStore`
  ADD CONSTRAINT `pizzastore_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Team` (`iD`);

--
-- Contraintes pour la table `Recipe`
--
ALTER TABLE `Recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`pizza_id`) REFERENCES `Pizza` (`iD`);

--
-- Contraintes pour la table `Stock`
--
ALTER TABLE `Stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient` (`iD`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`pizza_store_id`) REFERENCES `PizzaStore` (`iD`);
