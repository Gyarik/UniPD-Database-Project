--Nome dei progetti e moduli in cui vi lavorano 2 o più dipendenti


SELECT p.nome_prog, a.id_modulo
FROM Progetto as p JOIN Modulo as m ON p.id_prog = m.id_prog
    JOIN Assegnazione as a ON a.id_modulo = m.id_modulo
GROUP BY p.nome_prog, a.id_modulo
HAVING COUNT(*) >= 2;