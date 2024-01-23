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

-- REQUETES

-- a) Liste de tous les étudiants
SELECT eT.numEtu, eT.nom, eT.prenom
FROM etudiant eT; 

-- b) Liste de tous les étudiants, classée par ordre alphabétique inverse
SELECT eT.numEtu, eT.nom, eT.prenom
FROM etudiant eT 
ORDER BY eT.nom DESC;

-- c) Libellé et coefficient (exprimé en pourcentage) de chaque matière 
SELECT m.codeMat, m.libelle, CONCAT((m.coef*100)/10, '%')
FROM matiere m;

-- e) Nom et prénom des étudiants domiciliés à Lyon
SELECT eT.nom, eT.prenom, eT.ville
FROM etudiant eT
WHERE eT.ville = 'Lyon';

-- f) Liste des notes supérieures ou égales à 10
SELECT eT.nom, eT.prenom, n.note, m.libelle
FROM notation n 
INNER JOIN etudiant eT ON eT.numEtu = n.numETU
INNER JOIN epreuve eP ON eP.numEpreuve = n.numEpreuve
INNER JOIN matiere m ON m.codeMat = eP.codeMat
WHERE n.note >= 10;

-- g) Liste des épreuves dont la date se situe entre le 1er janvier et le 30 juin 2014
SELECT eP.dateEpreuve, m.libelle
FROM epreuve eP 
INNER JOIN matiere m ON m.codeMat = eP.codeMat
WHERE eP.dateEpreuve > '2014-01-01' AND eP.dateEpreuve < '2014-06-30';

-- h) Nom, prénom et ville des étudiants dont la ville contient la chaîne "ll" (LL)
SELECT eT.nom, eT.prenom, eT.ville
FROM etudiant eT
HAVING eT.ville LIKE '%ll%';

-- i) Prénoms des étudiants de nom Dupont, Durand ou Martin
SELECT eT.prenom, eT.nom
FROM etudiant eT
WHERE eT.nom = 'Dupont' OR eT.nom = 'Durant' OR eT.nom = 'Martin' ; 

-- j) Somme des coefficients de toutes les matières
SELECT SUM(m.coef) AS SommeMatieres 
FROM matiere m ;

-- k) Nombre total d'épreuves
SELECT COUNT(eP.numEpreuve) AS NombreEpreuves
FROM epreuve eP;

-- l) Nombre de notes indéterminées (NULL)
SELECT n.note 
FROM notation n 
WHERE n.note IS NOT NULL;

-- m) Liste des épreuves (numéro, date et lieu) incluant le libellé de la matière
SELECT eP.numEpreuve, eP.dateEpreuve, eP.lieu, m.libelle
FROM epreuve eP 
INNER JOIN matiere m ON m.codeMat = eP.codeMat ; 

-- n et o) Liste des notes en précisant pour chacune le nom et le prénom de l'étudiant qui l'a obtenue
SELECT n.note, m.libelle, eT.nom, eT.prenom
FROM notation n 
INNER JOIN etudiant eT ON eT.numEtu = n.numETU 
INNER JOIN matiere m ON m.codeMat = n.numETU

-- p) Nom et prénom des étudiants qui ont obtenu au moins une note égale à 20
SELECT eT.nom, eT.prenom, n.note
FROM etudiant eT
INNER JOIN notation n ON n.numETU = eT.numEtu
WHERE n.note >= 20 


-- q r) Moyennes des notes de chaque étudiant (indiquer le nom et le prénom) triées par ordre décroissant des moyennes
SELECT eT.nom, eT.prenom, ROUND(AVG(n.note), 2) AS MoyenneEtudiant 
FROM etudiant eT
INNER JOIN notation n ON n.numETU = eT.numEtu
GROUP BY eT.nom, eT.prenom
ORDER BY MoyenneEtudiant DESC 

-- s) Moyennes des notes pour les matières (indiquer le libellé) comportant plus d'une épreuve
SELECT m.libelle , AVG(n.note) AS moyenne_notes
FROM matiere m
inner JOIN epreuve ep ON m.codeMat = eP.codeMat
inner JOIN notation n ON eP.numEpreuve = n.numEpreuve
GROUP BY m.libelle
HAVING COUNT( DISTINCT ep.numEpreuve) > 1;	

-- t) Moyennes des notes obtenues aux épreuves (indiquer le numéro d'épreuve) où moins de 6 étudiants ont été notés		
SELECT ep.numEpreuve, AVG(n.note) AS MoyenneNoteEpreuve
FROM epreuve ep
INNER JOIN notation n ON ep.numEpreuve = n.numEpreuve
GROUP BY ep.numEpreuve
HAVING COUNT(n.numETU) < 6