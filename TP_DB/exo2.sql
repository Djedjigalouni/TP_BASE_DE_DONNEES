-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 27 Décembre 2023 à 21:34
-- Version du serveur :  5.7.33-0ubuntu0.16.04.1
-- Version de PHP :  7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `exercice2`
--

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `id_medecin` int(11) NOT NULL,
  `id_malade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `consultation_maladie`
--

CREATE TABLE `consultation_maladie` (
  `id_consultation` int(11) NOT NULL,
  `id_maladie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `consultation_sympthome`
--

CREATE TABLE `consultation_sympthome` (
  `id_consultation` int(11) NOT NULL,
  `id_sympthome` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `malade`
--

CREATE TABLE `malade` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

CREATE TABLE `maladie` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `sympthome`
--

CREATE TABLE `sympthome` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `sympthome_maladie`
--

CREATE TABLE `sympthome_maladie` (
  `id_sympthome` int(11) NOT NULL,
  `id_maladie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medecin` (`id_medecin`,`id_malade`),
  ADD KEY `consultation_ibfk_2` (`id_malade`);

--
-- Index pour la table `consultation_maladie`
--
ALTER TABLE `consultation_maladie`
  ADD KEY `id_consultation` (`id_consultation`,`id_maladie`),
  ADD KEY `consultation_maladie_ibfk_2` (`id_maladie`);

--
-- Index pour la table `consultation_sympthome`
--
ALTER TABLE `consultation_sympthome`
  ADD KEY `id_consultation` (`id_consultation`,`id_sympthome`),
  ADD KEY `id_sympthome` (`id_sympthome`);

--
-- Index pour la table `malade`
--
ALTER TABLE `malade`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `maladie`
--
ALTER TABLE `maladie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sympthome`
--
ALTER TABLE `sympthome`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sympthome_maladie`
--
ALTER TABLE `sympthome_maladie`
  ADD KEY `id_sympthome` (`id_sympthome`,`id_maladie`),
  ADD KEY `id_maladie` (`id_maladie`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `malade`
--
ALTER TABLE `malade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `maladie`
--
ALTER TABLE `maladie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sympthome`
--
ALTER TABLE `sympthome`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`id_medecin`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`id_malade`) REFERENCES `malade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `consultation_maladie`
--
ALTER TABLE `consultation_maladie`
  ADD CONSTRAINT `consultation_maladie_ibfk_1` FOREIGN KEY (`id_consultation`) REFERENCES `consultation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consultation_maladie_ibfk_2` FOREIGN KEY (`id_maladie`) REFERENCES `maladie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `consultation_sympthome`
--
ALTER TABLE `consultation_sympthome`
  ADD CONSTRAINT `consultation_sympthome_ibfk_1` FOREIGN KEY (`id_consultation`) REFERENCES `consultation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consultation_sympthome_ibfk_2` FOREIGN KEY (`id_sympthome`) REFERENCES `sympthome` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sympthome_maladie`
--
ALTER TABLE `sympthome_maladie`
  ADD CONSTRAINT `sympthome_maladie_ibfk_1` FOREIGN KEY (`id_sympthome`) REFERENCES `sympthome` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sympthome_maladie_ibfk_2` FOREIGN KEY (`id_maladie`) REFERENCES `maladie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
