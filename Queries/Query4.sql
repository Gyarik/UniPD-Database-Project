--Tutti i clienti che hanno stretto un  accordo con un dipendente la cui sede di appartenenza è diversa da quella
--del dipendente che ha fatto il contratto

SELECT a.p_iva
FROM Accordo AS a JOIN Cliente as c ON a.p_iva = c.p_iva  
    JOIN Dipendente as d1 ON a.id_dip = d1.id_dip
    JOIN Contratto as co ON a.p_iva = co.p_iva
    JOIN Dipendente as d2 ON co.id_dip = d2.id_dip
    WHERE d1.id_dip != d2.id_dip AND d1.id_sede != d2.id_sede;




 --Non sono sicuro del primo join, lo faccio per sicurezza dato che tecnicamente non ci sono relazioni (FK) tra Accordo e Contratto