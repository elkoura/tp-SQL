riaDB [compta]> SET SQL_SAFE_UPDATES = 0;
Query OK, 0 rows affected (0.000 sec)

MariaDB [compta]> SET SQL_SAFE_UPDATES = 0;
Query OK, 0 rows affected (0.000 sec)

MariaDB [compta]> DELETE FROM compo
    -> WHERE ID_BON IN (
    ->     SELECT ID FROM bon
    ->     WHERE DATE_CMDE BETWEEN '2019-04-01' AND '2019-04-30'
    -> );
Query OK, 0 rows affected (0.005 sec)

MariaDB [compta]> DELETE FROM bon
    -> WHERE DATE_CMDE BETWEEN '2019-04-01' AND '2019-04-30';
Query OK, 0 rows affected (0.000 sec)