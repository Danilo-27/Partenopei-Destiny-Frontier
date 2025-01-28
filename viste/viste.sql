--Vista numero 1

 CREATE VIEW missioni_completate AS
 SELECT
 p.membro as codice_membro,
 COUNT() as num_missioni_completate
 FROM Partecipazioni p
 JOIN Missioni m ON p.missione = m.codice
 WHERE m.stato = 'COMPLETATA'
 GROUP BY p.membro;

--Vista numero 2

CREATE VIEW durata_media_missioni as
select p.membro as codice_membro,
avg(m.data_fine-m.data_inizio) as media_durata_missioni
FROM Partecipazioni p
JOIN Missioni m ON p.missione = m.codice
WHERE m.stato = 'COMPLETATA'
GROUP BY p.membro;

--Vista numero 3

CREATE OR REPLACE VIEW num_totali_interventi as
SELECT me.codice as codice_membro,
COUNT() as num_interventi
FROM MEMBRI_EQUIPAGGIO ME
JOIN COINVOLGIMENTI C ON ME.codice = c.equipaggio
GROUP BY ME.codice

--Vista numero 4

 CREATE OR REPLACE VIEW num_totali_interventi_riusciti as
 SELECT me.codice as codice_membro,
 COUNT(*) as num_interventi_riusciti
 FROM MEMBRI_EQUIPAGGIO ME
 JOIN COINVOLGIMENTI C ON ME.codice = C.equipaggio
 join INTERVENTI I ON I.CODICE=C.intervento
 WHERE I.esito='RIUSCITO'
 GROUP BY ME.codice

--Vista numero 5

 CREATE VIEW ruoli_ricoperti AS
 SELECT
 membro as codice_membro,
 COUNT(DISTINCT ruolo) as numero_ruoli
 FROM Partecipazioni
 GROUP BY membro;

--Vista numero 6

 CREATE OR REPLACE VIEW dati_membri AS
 SELECT
 MC.codice_membro,
 MC.num_missioni_completate,
 DME.media_durata_missioni,
 RR.numero_ruoli,
 NTI.num_interventi,
 NTIR.num_interventi_riusciti
 FROM missioni_completate MC
 JOIN durata_media_missioni DME ON MC.codice_membro =
 DME.codice_membro
 JOIN ruoli_ricoperti RR ON MC.codice_membro = RR.codice_membro
 LEFT JOIN num_totali_interventi NTI ON
 NTI.codice_membro=RR.codice_membro
 LEFT JOIN num_totali_interventi_riusciti NTIR ON NTI.codice_membro= NTIR.codice_membro;

--Vista numero 7

 CREATE VIEW view_missioni_in_corso AS
 SELECT M.codice AS codice_missione,
 M.stato AS stato_missione,
 S.codice AS codice_sesnore,
 s.stato AS stato_sensore,
 s.data_installazione AS data_sensore,
 AN.codice AS codice_anomalia,
 AN.livello_priorita AS priorita_anomalia
 FROM MISSIONI M JOIN IMPIEGO_SENSORI ISE ON M.codice=ISE.missione
 JOIN SENSORI S ON S.codice=ISE.sensore
 JOIN ANOMALIE AN ON AN.sensore=S.codice
 WHERE M.stato = 'INCORSO'









