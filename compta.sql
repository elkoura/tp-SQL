-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 24 mai 2024 à 22:06
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `ID` int(11) NOT NULL,
  `REF` varchar(255) NOT NULL,
  `DESIGNATION` varchar(255) NOT NULL,
  `PRIX` decimal(10,2) NOT NULL,
  `ID_FOU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`ID`, `REF`, `DESIGNATION`, `PRIX`, `ID_FOU`) VALUES
(1, 'A01', 'Perceuse P1', 74.99, 1),
(2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2),
(4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3),
(5, 'A02', 'Meuleuse 125mm', 37.85, 1),
(6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80, 3),
(7, 'A03', 'Perceuse à colonne', 185.25, 1),
(8, 'D04', 'Coffret méches à bois', 12.25, 3),
(9, 'F03', 'Coffret méches plates', 6.25, 2),
(10, 'F04', 'Fraises d’encastrement', 8.14, 2);

-- --------------------------------------------------------

--
-- Structure de la table `bon`
--

CREATE TABLE `bon` (
  `ID` int(11) NOT NULL,
  `NUMERO` varchar(255) NOT NULL,
  `DATE_CMDE` date NOT NULL,
  `DELAI` varchar(255) DEFAULT NULL,
  `ID_FOU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `bon`
--

INSERT INTO `bon` (`ID`, `NUMERO`, `DATE_CMDE`, `DELAI`, `ID_FOU`) VALUES
(1, '001', '2024-05-24', '3 jours', 1);

-- --------------------------------------------------------

--
-- Structure de la table `compo`
--

CREATE TABLE `compo` (
  `ID` int(11) NOT NULL,
  `QTE` int(11) NOT NULL,
  `ID_ART` int(11) DEFAULT NULL,
  `ID_BON` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `compo`
--

INSERT INTO `compo` (`ID`, `QTE`, `ID_ART`, `ID_BON`) VALUES
(1, 3, 1, 1),
(2, 4, 5, 1),
(3, 1, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`ID`, `NOM`) VALUES
(1, 'Fran?aise d\'Imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_FOU` (`ID_FOU`);

--
-- Index pour la table `bon`
--
ALTER TABLE `bon`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_FOU` (`ID_FOU`);

--
-- Index pour la table `compo`
--
ALTER TABLE `compo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_ART` (`ID_ART`),
  ADD KEY `ID_BON` (`ID_BON`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `bon`
--
ALTER TABLE `bon`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `compo`
--
ALTER TABLE `compo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`ID_FOU`) REFERENCES `fournisseur` (`ID`);

--
-- Contraintes pour la table `bon`
--
ALTER TABLE `bon`
  ADD CONSTRAINT `bon_ibfk_1` FOREIGN KEY (`ID_FOU`) REFERENCES `fournisseur` (`ID`);

--
-- Contraintes pour la table `compo`
--
ALTER TABLE `compo`
  ADD CONSTRAINT `compo_ibfk_1` FOREIGN KEY (`ID_ART`) REFERENCES `article` (`ID`),
  ADD CONSTRAINT `compo_ibfk_2` FOREIGN KEY (`ID_BON`) REFERENCES `bon` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


