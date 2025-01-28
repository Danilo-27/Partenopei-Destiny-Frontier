--uery numero 1

 SELECT S.kSTATO AS "Stato",
 COUNT(DISTINCT S.codice) AS "Numero di Sensori"
 FROM MISSIONI M
 JOIN PARTECIPAZIONI P ON P.missione = M.codice
 JOIN MEMBRI_EQUIPAGGIO MB ON MB.codice = P.membro
 JOIN IMPIEGO_SENSORI ISE ON M.codice = ISE.missione
 JOIN SENSORI S ON ISE.sensore = S.codice
 WHERE (UPPER(MB.matricola) = UPPER(:APP_USER) AND
 M.stato='INCORSO')OR UPPER(:APP_USER)='SUPERVISOR'
 GROUP BY S.stato

--Query numero 2

 SELECT
 A.livello_priorita AS "Priorità",
 COUNT(DISTINCT A.codice) AS "Numero di Anomalie",
 COUNT(DISTINCT R.codice) AS "Numero di Rilevazioni",
 ROUND(COUNT(DISTINCT R.codice) * 1.0 / COUNT(DISTINCT
 A.codice), 4) AS "Rapporto RILEVAZIONI_ANOMALIE"
 FROM MISSIONI M
 JOIN PARTECIPAZIONI P ON P.missione = M.codice
 JOIN MEMBRI_EQUIPAGGIO MB ON MB.codice = P.membro
 JOIN IMPIEGO_SENSORI ISE ON M.codice = ISE.missione
 JOIN SENSORI S ON ISE.sensore = S.codice
 JOIN ANOMALIE A ON A.sensore = S.codice
 LEFT JOIN RILEVAZIONI R ON R.sensore = S.codice
 WHERE
 (UPPER(MB.matricola) = UPPER(:APP_USER) AND M.stato = 'INCORSO')
 OR UPPER(:APP_USER) = 'SUPERVISOR'
 GROUP BY A.livello_priorita
 HAVING COUNT(DISTINCT A.codice) > 0
 ORDER BY A.livello_priorita ASC;

--Query numero 3

 SELECT
 count(R.codice) as NUMERO_RILEVAZIONI,S.codice,AVG(R.valore)
 FROM MISSIONI M
 JOIN PARTECIPAZIONI P ON P.missione = M.codice
 JOIN MEMBRI_EQUIPAGGIO MB ON MB.codice = P.membro
 JOIN IMPIEGO_SENSORI ISE ON M.codice = ISE.missione
 JOIN SENSORI S ON ISE.sensore = S.codice
 JOIN RILEVAZIONI R ON R.sensore = S.codice
 WHERE
 (M.stato = 'INCORSO'AND UPPER(MB.matricola) = UPPER(:APP_USER))
 OR UPPER(:APP_USER)='SUPERVISOR'
 GROUP BY S.codice

--Query numero 4

 SELECT M.obiettivo,TO_CHAR(data_inizio, 'DD/MM/YYYY') AS
 DATA_INIZIO,
 CASE
 WHEN data_fine IS NULL OR data_fine > SYSDATE THEN 'IN
 CORSO'
 ELSE TO_CHAR(data_fine, 'DD/MM/YYYY')
 END AS data_fine,
 M.stato
 FROM MISSIONI M
 JOIN PARTECIPAZIONI P ON P.missione=M.codice
 JOIN MEMBRI_EQUIPAGGIO MB ON MB.codice=P.membro
 WHERE UPPER(MB.matricola) = UPPER(:APP_USER) OR
 UPPER(:APP_USER)='SUPERVISOR'
 GROUP BY M.codice,M.obiettivo,M.stato,M.data_inizio,M.data_fine

--Query numero 5

 SELECT
 AN.codice,AN.causa,AN.livello_priorita,AN.sensore,AN.data,AN.ora
 FROM ANOMALIE AN
 JOIN IMPIEGO_SENSORI ISE ON ISE.sensore=AN.sensore
 JOIN MISSIONI M ON ISE.missione=M.codice
 JOIN PARTECIPAZIONI P ON P.missione=M.codice
 JOIN MEMBRI_EQUIPAGGIO MB ON MB.codice=P.membro
 WHERE UPPER(MB.matricola) = UPPER(:APP_USER) OR
 UPPER(:APP_USER)='SUPERVISOR'
 GROUP BY AN.codice, AN.causa, AN.livello_priorita, AN.data, AN.ora,AN.sensore

--Query numero 6

 SELECT I.codice,I.descrizione,I.esito,TO_CHAR(I.data_intervento,'DD/MM/YYYY') AS data_intervento,I.anomalia
 FROM INTERVENTI I
 JOIN COINVOLGIMENTI CO ON I.codice=CO.intervento
 JOIN MEMBRI_EQUIPAGGIO MB ON CO.equipaggio=MB.codice
 WHERE UPPER(MB.matricola) = UPPER(:APP_USER) OR
 UPPER(:APP_USER)='SUPERVISOR'
 GROUP BY I.codice,I.descrizione,I.esito,I.data_intervento,I.anomalia