create DATABASE jointures;
use jointures;
	CREATE TABLE departements(
		DNO int auto_increment primary key,
        DNOM varchar(50) not null,
        DIR varchar(50) not null,
        ville varchar(50) not null
        );
	CREATE TABLE employes(
		ENO int auto_increment primary key,
        ENOM varchar(50) not null,
        PROF varchar(50) not null,
        DATEEMB date,
        COM int not null,
        SAL int not null,
        DNO int not null
        );
        
INSERT INTO employes (ENO, ENOM , PROF, DATEEMB, COM, SAL, DNO)
VALUES
 ( 10, 'Joe', 'ingenieur', '1993-1-10',4000 ,3000,3), 
 ( 20, 'Jack', 'technicien', 1-5-88,3000,2000,2), 
 ( 30, 'Jim', 'vendeur', 1-3-80,5000,5000,1), 
 ( 40, 'Lucy', 'ingenieur', 1-3-80,5000,5000,3); 

UPDATE employes SET DATEEMB = '1993-1-10' WHERE ENO=10;
UPDATE employes SET DATEEMB = '1988-5-1' WHERE ENO=20;
UPDATE employes SET DATEEMB = '1980-3-1' WHERE ENO=30;
UPDATE employes SET DATEEMB = '1980-3-1' WHERE ENO=40;

INSERT INTO departements (DNO, DNOM , DIR, ville)
VALUES
 ( 1, 'commercial', '30', 'new york'), 
 ( 2 ,'production', '20', 'houston'), 
 ( 3 ,'developpement', '40', 'boston');


-- Requête 1: Faire le produit cartésien en Employés et Départements
SELECT * FROM employes, departements;
SELECT * FROM employes CROSS JOIN departements;
-- Requête 2: Donnez les noms des employés et les noms de leur département
SELECT e.ENOM AS 'nom de l\'employé', d.DNOM AS 'nom du departement' FROM employes e JOIN departements d ON e.dno = d.dno;
-- Requête 3: Donnez les numéros des employés travaillant à Boston
-- bug ne fonctionne pas 
SELECT e.ENO AS 'numéro de l\'employe' FROM employes e JOIN departement d ON e.DNO = d.DNO WHERE d.ville ='boston';
-- Requête 4: Donnez les noms des directeurs de département 1 et 3.
SELECT DIR AS "Nom du directeur" FROM departements WHERE DNO IN (1, 3);

-- Requête 5: Donnez les noms des employés travaillant dans un département avec au moins un ingénieur

-- Requête 6: Donnez le salaire et le nom des employés gagnant plus qu'un (au moins un) ingénieur

-- Requête 7 : Donnez les salaires et le nom des employés gagnant plus que tous les ingénieurs

-- Requête 8: Donnez les noms des employés et les noms de leur directeur.

-- Requête 9: Trouvez les noms des employés ayant le même directeur que JIM

-- Requête 10: Donnez le nom et la date d'embauche des employés embauchés avant leur directeur ; donnez égalementle nom et la date d'embauche dudit directeur

-- Requête 11: Donnez les départements qui n'ont pas d'employés

-- Requête 12:Donnez les noms des employés du département commercial embauchés le même jour quun employé dudépartement Production

-- Requête 13:Donnez les noms des employés embauchés avant tous les employés du département 1.

-- Requête 14: Donnez les noms des employés ayant le même emploi et le même directeur que JOE.
