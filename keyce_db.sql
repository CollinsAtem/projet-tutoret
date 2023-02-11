-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 10 fév. 2023 à 16:16
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `keyce`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(5) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(10) NOT NULL,
  `admin_mail` varchar(30) NOT NULL,
  `admin_pwd` char(5) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_mail`, `admin_pwd`) VALUES
(1, 'Nancy', 'nmeuyou8@gmail.com', 'goodj');

-- --------------------------------------------------------

--
-- Structure de la table `avions`
--

DROP TABLE IF EXISTS `avions`;
CREATE TABLE IF NOT EXISTS `avions` (
  `av_id` int(5) NOT NULL AUTO_INCREMENT,
  `nom_av` varchar(10) NOT NULL,
  `nb_siege` int(3) NOT NULL,
  `location` varchar(20) NOT NULL,
  `n_compagnie` varchar(20) NOT NULL,
  `etat` char(1) NOT NULL,
  PRIMARY KEY (`av_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bagages`
--

DROP TABLE IF EXISTS `bagages`;
CREATE TABLE IF NOT EXISTS `bagages` (
  `bagage_id` int(5) NOT NULL AUTO_INCREMENT,
  `nb_bagage` int(1) NOT NULL,
  `b_kilo` char(4) NOT NULL,
  PRIMARY KEY (`bagage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(5) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(11) NOT NULL,
  `client_mail` varchar(30) NOT NULL,
  `client_pwd` char(5) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `passager`
--

DROP TABLE IF EXISTS `passager`;
CREATE TABLE IF NOT EXISTS `passager` (
  `passager_id` int(5) NOT NULL AUTO_INCREMENT,
  `p_nom` varchar(10) NOT NULL,
  `p_prenom` varchar(10) NOT NULL,
  `p_title` varchar(3) NOT NULL,
  `p_dob` date NOT NULL,
  `nationalite` varchar(20) NOT NULL,
  `sexe` char(1) NOT NULL,
  `num_passeport` int(11) NOT NULL,
  `exp_date` date NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `p_mail` varchar(30) NOT NULL,
  `vol_id` int(5) NOT NULL,
  PRIMARY KEY (`passager_id`),
  KEY `passager_ibfk_1` (`vol_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` int(5) NOT NULL AUTO_INCREMENT,
  `ville_d` varchar(20) NOT NULL,
  `ville_a` varchar(20) NOT NULL,
  `date_d` datetime NOT NULL,
  `date_a` datetime NOT NULL,
  `nb_personne` int(11) NOT NULL,
  `type_class` char(1) NOT NULL,
  `type_vol` char(2) NOT NULL,
  PRIMARY KEY (`reservation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vols`
--

DROP TABLE IF EXISTS `vols`;
CREATE TABLE IF NOT EXISTS `vols` (
  `vol_id` int(5) NOT NULL AUTO_INCREMENT,
  `arrivale` datetime NOT NULL,
  `departure` datetime NOT NULL,
  `source` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL,
  `compagnie` varchar(20) NOT NULL,
  `siege_dp` int(3) NOT NULL,
  `siege_to` int(3) NOT NULL,
  `prix` int(11) NOT NULL,
  `vol_d` varchar(3) NOT NULL,
  `statut` char(1) DEFAULT NULL,
  `nb_passager` int(11) NOT NULL,
  `admin_id` int(5) NOT NULL,
  `av_id` int(5) NOT NULL,
  PRIMARY KEY (`vol_id`),
  KEY `vols_ibfk_1` (`admin_id`),
  KEY `vols_ibfk_2` (`av_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vols`
--

INSERT INTO `vols` (`vol_id`, `arrivale`, `departure`, `source`, `destination`, `compagnie`, `siege_dp`, `siege_to`, `prix`, `vol_d`, `statut`, `nb_passager`, `admin_id`, `av_id`) VALUES
(1, '2022-02-20 12:00:00', '2022-02-17 06:00:00', 'Cameroun Nsimalen', 'Maroc Rabat', 'keyce airlines', 250, 300, 300000, '6h', '', 50, 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
