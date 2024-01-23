-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Les données exportées n'étaient pas sélectionnées.

-- Les données exportées n'étaient pas sélectionnées.

-- Les données exportées n'étaient pas sélectionnées.

-- Les données exportées n'étaient pas sélectionnées.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- Les Requêtes

-- a) Ajouter un nouveau fournisseur avec les attributs de votre choix
INSERT INTO fournisseur (NumF, NomF, Statut, VilleF)
VALUES (22, 'Nouveau_F', 'Actif', 'Londre');

-- b) Supprimer tous les produits de couleur noire et de numéros compris entre 100 et 1999
DELETE FROM produit p 
WHERE p.Couleur = 'noir' AND p.NumP BETWEEN 6 AND 8;

-- c) Changer la ville du fournisseur 3 par Mulhouse
UPDATE fournisseur
SET VilleF = 'Mulhouse'
WHERE NumF = 3