create database aeroport;
use aeroport;
INSERT INTO `pilote` (`nomPil`,`adresse`,`salaire`)
VALUES
  ("Moussa","Paris", "650000"),
  ("Mouskito","Marseille","900000"),
  ("Homer","Cergy","750901"),
  ("Zack","Cergy","350000");
UPDATE `pilote` SET salaire = 650000 where numPil="1";
UPDATE `pilote` SET salaire = 900000 where numPil="2";
UPDATE `pilote` SET salaire = 750901 where numPil="3";
UPDATE `pilote` SET salaire = 350000 where numPil="4";


use aeroport;
INSERT INTO  avion (numAv,nomAv , capacite, localisation)
VALUES
 ('1', 'Alpha', '300', 'Paris'),
 ('2', 'Delta', '400', 'Milan'),
 ('3', 'Delta', '350', 'Rome');
 
INSERT INTO  vol (numVol,numPil,numAv , villeDepart, villeArrivee, heureDepart)
VALUES
('AF351', '1', '2' , 'paris', 'newyork', '9:00;00'),
('RU154', '2', '3' , 'canada', 'londres', '13:00;00'),
('LH1792', '3', '1' , 'paris', 'tunis', '11:00;00');
-- Donnez toutes les informations sur les pilotes de la compagnie.
SELECT * FROM pilote;
-- Quels sont les numéros des pilotes en service et les villes de départ de leurs vols ?
SELECT numpil,villeDepart FROM vol; 
-- Donnez la liste des avions dont la capacité est supérieure à 350 passagers.
SELECT * FROM avion WHERE capacite > 350;
-- Quels sont les numéros et noms des avions localisés à 'Paris' ?
SELECT numAv , nomAv FROM avion WHERE localisation = 'paris';
-- Dans combien de villes distinctes sont localisées des avions ?
SELECT COUNT(DISTINCT localisation) FROM avion; 
-- Quel est le nom des pilotes domiciliés à Cergy dont le salaire est supérieur à 500 000 ?
SELECT nomPil FROM pilote WHERE adresse LIKE 'Cergy' AND salaire > 500000;
-- Quels sont les avions (numéro et nom) localisés à Paris ou dont la capacité est inférieure à 350 passagers ?
SELECT numAv, nomAv FROM avion WHERE localisation LIKE 'paris' OR capacite < 350;
-- Liste des vols au départ de Paris allant à 'New york' après 18 heures ?
SELECT * FROM vol WHERE villeDepart LIKE "paris" AND arrivee LIKE "New York" AND heureDepart > '18:00';
-- Quels sont les numéros des pilotes qui ne sont pas en service ?
SELECT DISTINCT numPil FROM pilote WHERE numPil NOT IN (SELECT DISTINCT numPil FROM vol);
-- Quels sont les vols (numéro, ville de départ) effectués par les pilotes de numéro 00001 et 00002 ?
SELECT numVol, villeDepart FROM vol WHERE numPil IN (1,2);
-- Quels sont les pilotes dont le nom commence par « Z » ?
SELECT * FROM Pilote WHERE NomPil LIKE 'Z%';
-- Quels sont les pilotes dont la troisième lettre est un « b » ? 
SELECT * FROM Pilote WHERE NomPil LIKE '__b%';
-- les jointures
-- inner
SELECT p.numPil,villeDepart FROM vol v INNER JOIN pilote p ON v.numPil = p.numPil;
-- cross join
SELECT * FROM vol CROSS JOIN avion;
-- using
SELECT p.numPil,villeDepart FROM vol v INNER JOIN pilote p USING(numPil);
