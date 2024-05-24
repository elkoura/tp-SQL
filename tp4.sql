
SELECT REF, DESIGNATION FROM article WHERE PRIX > 2;



SELECT * FROM article WHERE PRIX >= 2 AND PRIX <= 6.25;




SELECT * FROM article WHERE PRIX >= 2 AND PRIX <= 6.25;

SELECT * FROM article WHERE PRIX BETWEEN 2 AND 6.25;





SELECT a.* FROM article a
JOIN fournisseur f ON a.ID_FOU = f.ID
WHERE NOT (a.PRIX BETWEEN 2 AND 6.25) AND f.NOM = 'Française d\'Imports';






SELECT COLUMN_NAME, COLLATION_NAME
FROM information_schema.columns
WHERE table_schema = 'compta' AND table_name = 'fournisseur';

-- Pour ajuster la collation
ALTER TABLE fournisseur MODIFY COLUMN NOM VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci;
MariaDB [compta]> SELECT a.* FROM article a
    -> JOIN fournisseur f ON a.ID_FOU = f.ID
    -> WHERE f.NOM NOT IN ('Française d\'Imports', 'Dubois & Fils');
+----+-----+----------------------------------------+------+--------+
| ID | REF | DESIGNATION                            | PRIX | ID_FOU |
+----+-----+----------------------------------------+------+--------+
|  2 | F01 | Boulon laiton 4 x 40 mm (sachet de 10) | 2.25 |      2 |
|  3 | F02 | Boulon laiton 5 x 40 mm (sachet de 10) | 4.45 |      2 |
|  9 | F03 | Coffret m├®ches plates                  | 6.25 |      2 |
| 10 | F04 | Fraises dÔÇÖencastrement                 | 8.14 |      2 |
+----+-----+----------------------------------------+------+--------+
4 rows in set (0.001 sec)

MariaDB [compta]> -- Définir la collation pour la session
MariaDB [compta]> SET collation_connection = 'utf8_general_ci';
Query OK, 0 rows affected (0.000 sec)

MariaDB [compta]>
MariaDB [compta]> -- Puis exécutez votre requête
MariaDB [compta]> SELECT a.* FROM article a
    -> JOIN fournisseur f ON a.ID_FOU = f.ID
    -> WHERE NOT (a.PRIX BETWEEN 2 AND 6.25) AND f.NOM = 'Française d''Imports';
+----+-----+---------------------+--------+--------+
| ID | REF | DESIGNATION         | PRIX   | ID_FOU |
+----+-----+---------------------+--------+--------+
|  1 | A01 | Perceuse P1         |  74.99 |      1 |
|  5 | A02 | Meuleuse 125mm      |  37.85 |      1 |
|  7 | A03 | Perceuse ├á colonne  | 185.25 |      1 |
+----+-----+---------------------+--------+--------+
3 rows in set (0.001 sec)

MariaDB [compta]> -- Définir la collation pour la session
MariaDB [compta]> SET collation_connection = 'utf8_general_ci';
Query OK, 0 rows affected (0.000 sec)

MariaDB [compta]>
MariaDB [compta]> -- Puis exécutez votre requête
MariaDB [compta]> SELECT a.* FROM article a
    -> JOIN fournisseur f ON a.ID_FOU = f.ID
    -> WHERE NOT (a.PRIX BETWEEN 2 AND 6.25) AND f.NOM = 'Française d''Imports';
+----+-----+---------------------+--------+--------+
| ID | REF | DESIGNATION         | PRIX   | ID_FOU |
+----+-----+---------------------+--------+--------+
|  1 | A01 | Perceuse P1         |  74.99 |      1 |
|  5 | A02 | Meuleuse 125mm      |  37.85 |      1 |
|  7 | A03 | Perceuse ├á colonne  | 185.25 |      1 |
+----+-----+---------------------+--------+--------+
3 rows in set (0.000 sec)

MariaDB [compta]> SET SQL_SAFE_UPDATES = 0;
Query OK, 0 rows affected (0.018 sec)

MariaDB [compta]> UPDATE article
    -> SET DESIGNATION = UPPER(DESIGNATION)
    -> WHERE PRIX > 10;
Query OK, 4 rows affected (0.045 sec)
Rows matched: 4  Changed: 4  Warnings: 0

MariaDB [compta]> UPDATE article
    -> SET DESIGNATION = LOWER(DESIGNATION)
    -> WHERE ID = 2;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [compta]> UPDATE article
    -> SET PRIX = PRIX * 1.10
    -> WHERE ID_FOU = (SELECT ID FROM fournisseur WHERE NOM = 'FDM SA');
Query OK, 4 rows affected, 4 warnings (0.013 sec)
Rows matched: 4  Changed: 4  Warnings: 4

MariaDB [compta]>