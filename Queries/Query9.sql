--Nome delle aziende le quali non hanno raggiunto un accordo con un addetto marketing

SELECT nome_azienda
FROM Cliente
WHERE p_iva NOT IN (SELECT p_iva FROM Accordo);
