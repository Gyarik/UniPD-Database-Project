SELECT COUNT (*) as Contratti, S.id_sede, C.data_firma
FROM Contratto as C JOIN Dipendente as D ON C.id_dip = D.id_dip
        JOIN Sede as S ON D.id_sede = S.id_sede
GROUP BY S.id_sede, C.data_firma
HAVING C.data_firma < '2020-1-1'