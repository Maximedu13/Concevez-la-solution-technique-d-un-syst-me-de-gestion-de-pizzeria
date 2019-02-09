-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  sam. 09 fév. 2019 à 09:32
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `OC`
--

-- --------------------------------------------------------

--
-- Structure de la table `OrderPizzeria`
--

CREATE TABLE `OrderPizzeria` (
  `order_number` mediumint(9) NOT NULL,
  `pizza_size` tinyint(4) DEFAULT NULL,
  `pizza_crust` varchar(150) DEFAULT NULL,
  `status` enum('pending','being prepared','cancelled','being delivered','picked up','delivered') NOT NULL,
  `date` datetime NOT NULL,
  `payment_made` tinyint(1) NOT NULL,
  `payment_method` enum('debit card online','debit card on delivery','debit card on site','cash on delivery','cash on site','other') NOT NULL,
  `client_id` mediumint(4) NOT NULL,
  `team_id` mediumint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `team_id` (`team_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  MODIFY `order_number` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `OrderPizzeria`
--
ALTER TABLE `OrderPizzeria`
  ADD CONSTRAINT `orderpizzeria_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `oc_pizza`.`Client` (`num_client`),
  ADD CONSTRAINT `orderpizzeria_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `oc_pizza`.`Team` (`iD`);
