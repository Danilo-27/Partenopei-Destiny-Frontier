-- Popolamento Membri Equipaggio
INSERT INTO Membri_Equipaggio (codice,matricola, nome, cognome) VALUES (1,'MEM10000', 'Marco', 'Rossi');
INSERT INTO Membri_Equipaggio (codice,matricola, nome, cognome) VALUES (2,'MEM10100', 'Laura', 'Bianchi');
INSERT INTO Membri_Equipaggio (codice,matricola, nome, cognome) VALUES (3,'MEM10200', 'Paolo', 'Verdi');
INSERT INTO Membri_Equipaggio (codice,matricola, nome, cognome) VALUES (4,'MEM10300', 'Elena', 'Ferrari');
INSERT INTO Membri_Equipaggio (codice,matricola, nome, cognome) VALUES (5,'MEM10400', 'Giuseppe', 'Romano');


-- Popolamento Missioni
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES 
(1, 'Esplorazione iniziale Cratere Tycho - Analisi composizione suolo', 
TO_DATE('15/03/2015', 'DD/MM/YYYY'), TO_DATE('15/03/2016', 'DD/MM/YYYY'), 'COMPLETATA');

INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES 
(2, 'Studio approfondito radiazioni e attività  geologica Cratere Tycho', 
TO_DATE('10/01/2024', 'DD/MM/YYYY'), NULL, 'INCORSO');

-- Popolamento Sensori Missione 1
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4000, 'ATTIVO', TO_DATE('15/03/2015', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('15/09/2015', 'DD/MM/YYYY'), -43.453421, -46.245678, 1243.50);

INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4050, 'ATTIVO', TO_DATE('15/03/2015', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('15/09/2015', 'DD/MM/YYYY'), -43.456789, -46.248901, 1245.20);

INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4100, 'DISATTIVO', TO_DATE('15/03/2015', 'DD/MM/YYYY'), 'RADIAZIONI', TO_DATE('15/09/2015', 'DD/MM/YYYY'), -43.459012, -46.251234, 1247.30);

-- Popolamento Sensori Missione 2 (nuovo sensore per rimpiazzare quello di radiazioni)
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4150, 'ATTIVO', TO_DATE('10/02/2024', 'DD/MM/YYYY'), 'RADIAZIONI', TO_DATE('10/01/2024', 'DD/MM/YYYY'), -43.461234, -46.254567, 1245.80);

-- Popolamento Partecipazioni Missione 1
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 1, 1);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 1, 2);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 1, 3);

-- Popolamento Partecipazioni Missione 2
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 2, 1);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 2, 2);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 2, 3);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('BIOLOGO', 2, 4);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('FISICO', 2, 5);

-- Popolamento Impiego_Sensori Missione 1
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (1, 4000);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (1, 4050);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (1, 4100);

-- Popolamento Impiego_Sensori Missione 2 (con nuovo sensore radiazioni)
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (2, 4000);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (2, 4050);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (2, 4150);

-- Anomalia sensore radiazioni
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES 
(1, 4100, TO_DATE('15/09/2015', 'DD/MM/YYYY'), TO_TIMESTAMP('15/09/2015 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 
'Rottura radar', 2);

-- Intervento per anomalia
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES 
(1, 'RIPARAZIONE', 'FALLITO', TO_DATE('15/09/2015', 'DD/MM/YYYY'), 1);

-- Coinvolgimenti nell'intervento
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (2, 1);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (3, 1);

-- Anomalia 1: Sensore di temperatura
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES 
(2, 4000, TO_DATE('20/06/2015', 'DD/MM/YYYY'), TO_TIMESTAMP('20/06/2015 10:15:00', 'DD/MM/YYYY HH24:MI:SS'), 
'Sbalzo improvviso nei dati rilevati', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES 
(2, 'CALIBRAZIONE', 'RIUSCITO', TO_DATE('21/06/2015', 'DD/MM/YYYY'), 2);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (2, 2);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (3, 2);

-- Anomalia 2: Sensore di pressione
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES 
(3, 4050, TO_DATE('15/08/2015', 'DD/MM/YYYY'), TO_TIMESTAMP('15/08/2015 09:00:00', 'DD/MM/YYYY HH24:MI:SS'), 
'Errore nei valori registrati', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES 
(3, 'RIPARAZIONE', 'RIUSCITO', TO_DATE('16/08/2015', 'DD/MM/YYYY'), 3);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (2, 3);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (3, 3);

-- Anomalia durante la seconda missione
-- Anomalia al sensore di pressione
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES 
(4, 4050, TO_DATE('15/03/2024', 'DD/MM/YYYY'), TO_TIMESTAMP('15/03/2024 12:30:00', 'DD/MM/YYYY HH24:MI:SS'), 
'Guasto meccanico', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES 
(4, 'SOSTITUZIONE', 'RIUSCITO', TO_DATE('16/03/2024', 'DD/MM/YYYY'), 4);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (4, 4);




-- Popolamento Missioni Polo Nord
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES 
(3, 'Esplorazione iniziale Polo Nord Lunare - Studio temperature estreme e depositi ghiaccio', 
TO_DATE('20/06/2016', 'DD/MM/YYYY'), TO_DATE('20/06/2017', 'DD/MM/YYYY'), 'COMPLETATA');

INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES 
(4, 'Sostituzione strumentazione danneggiata e mappatura dettagliata depositi ghiaccio Polo Nord', 
TO_DATE('15/01/2018', 'DD/MM/YYYY'), TO_DATE('15/01/2019', 'DD/MM/YYYY'), 'COMPLETATA');

-- Popolamento Sensori Prima Missione
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4200, 'DISATTIVO', TO_DATE('20/06/2016', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('10/09/2016', 'DD/MM/YYYY'), 89.623654, 0.225478, 542.70);

INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4250, 'DISATTIVO', TO_DATE('20/06/2016', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('15/08/2016', 'DD/MM/YYYY'), 89.523854, 0.125678, 543.50);

INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4300, 'ATTIVO', TO_DATE('20/06/2016', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('20/06/2017', 'DD/MM/YYYY'), 89.724654, 0.025278, 541.90);

-- Popolamento Sensori Seconda Missione (sostitutivi)
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4350, 'ATTIVO', TO_DATE('15/01/2018', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('15/01/2019', 'DD/MM/YYYY'), 89.624654, 0.226478, 542.30);

INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES 
(4400, 'ATTIVO', TO_DATE('15/01/2018', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('15/01/2019', 'DD/MM/YYYY'), 89.524854, 0.126678, 543.10);

-- Popolamento Partecipazioni Prima Missione
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 3, 3);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 3, 4);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 3, 5);

-- Popolamento Partecipazioni Seconda Missione
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 4, 2);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 4, 4); 
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 4, 1);  

-- Popolamento Impiego_Sensori Prima Missione
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (3, 4200);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (3, 4250);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (3, 4300);

-- Popolamento Impiego_Sensori Seconda Missione
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (4, 4300);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (4, 4350);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (4, 4400);

-- Anomalie Prima Missione
-- Anomalia sensore temperatura (malfunzionamento critico)
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES 
(5, 4200, TO_DATE('10/09/2016', 'DD/MM/YYYY'), TO_TIMESTAMP('10/09/2016 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 
'Temperature estreme', 3);

-- Intervento fallito per sensore temperatura
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES 
(5, 'RIPARAZIONE', 'FALLITO', TO_DATE('11/09/2016', 'DD/MM/YYYY'), 5);

-- Coinvolgimento di Paolo Verdi nell'intervento fallito
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (3, 5);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (4, 5);

-- Anomalia sensore pressione
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES 
(6, 4250, TO_DATE('15/08/2016', 'DD/MM/YYYY'), TO_TIMESTAMP('15/08/2016 09:15:00', 'DD/MM/YYYY HH24:MI:SS'), 
'Guasto elettronico', 2);

INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES 
(6, 'RIPARAZIONE', 'FALLITO', TO_DATE('16/08/2016', 'DD/MM/YYYY'), 6);

INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (4, 6);




INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(10, 'Obiettivo esplorazione missione 10', TO_DATE('08/07/2010', 'DD/MM/YYYY'), TO_DATE('03/02/2011', 'DD/MM/YYYY'), 'COMPLETATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4500, 'ATTIVO', TO_DATE('12/06/2010', 'DD/MM/YYYY'), 'RADIAZIONI', TO_DATE('12/06/2010', 'DD/MM/YYYY'),
-83.629026, -57.745537, 578.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(100, 4500, TO_DATE('10/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 64.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(101, 4500, TO_DATE('14/06/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/06/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 121.79);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(102, 4500, TO_DATE('17/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 198.37);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(103, 4500, TO_DATE('05/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 198.13);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(104, 4500, TO_DATE('31/08/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/08/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 98.89);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(105, 4500, TO_DATE('16/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 37.61);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(106, 4500, TO_DATE('27/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 31.11);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(107, 4500, TO_DATE('18/06/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/06/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 4.23);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(108, 4500, TO_DATE('16/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 57.37);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(109, 4500, TO_DATE('21/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 16.06);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(20, 4500, TO_DATE('22/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 20', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(10, 'Intervento simulato 10', 'RIUSCITO', TO_DATE('30/12/2010', 'DD/MM/YYYY'), 20);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 10);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 10);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 10);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(21, 4500, TO_DATE('11/08/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/08/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 21', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(11, 'Intervento simulato 11', 'RIUSCITO', TO_DATE('20/08/2010', 'DD/MM/YYYY'), 21);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 11);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 11);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (10, 4500);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4501, 'ATTIVO', TO_DATE('23/06/2010', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('23/06/2010', 'DD/MM/YYYY'),
60.629892, 21.570601, 469.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(110, 4501, TO_DATE('12/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 13.64);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(111, 4501, TO_DATE('20/07/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/07/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 47.46);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(112, 4501, TO_DATE('03/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 78.69);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(113, 4501, TO_DATE('25/06/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/06/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.26);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(114, 4501, TO_DATE('11/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.52);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(115, 4501, TO_DATE('25/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 66.29);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(116, 4501, TO_DATE('11/07/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/07/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 5.60);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(117, 4501, TO_DATE('12/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 53.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(118, 4501, TO_DATE('30/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 28.62);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(119, 4501, TO_DATE('30/06/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/06/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 97.04);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(22, 4501, TO_DATE('13/07/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/07/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 22', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(12, 'Intervento simulato 12', 'RIUSCITO', TO_DATE('14/07/2010', 'DD/MM/YYYY'), 22);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 12);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 12);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(23, 4501, TO_DATE('21/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 23', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(13, 'Intervento simulato 13', 'RIUSCITO', TO_DATE('31/12/2010', 'DD/MM/YYYY'), 23);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 13);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 13);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 13);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(24, 4501, TO_DATE('07/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 24', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(14, 'Intervento simulato 14', 'RIUSCITO', TO_DATE('16/11/2010', 'DD/MM/YYYY'), 24);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 14);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 14);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 14);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(25, 4501, TO_DATE('24/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 25', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(15, 'Intervento simulato 15', 'FALLITO', TO_DATE('03/10/2010', 'DD/MM/YYYY'), 25);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 15);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 15);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 15);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4501;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (10, 4501);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4502, 'ATTIVO', TO_DATE('13/06/2010', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('13/06/2010', 'DD/MM/YYYY'),
41.428700, 137.011443, 734.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(120, 4502, TO_DATE('05/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 17.30);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(121, 4502, TO_DATE('14/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 54.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(122, 4502, TO_DATE('01/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -96.25);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(123, 4502, TO_DATE('01/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 44.81);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(124, 4502, TO_DATE('06/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -59.63);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(125, 4502, TO_DATE('23/07/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/07/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -64.72);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(126, 4502, TO_DATE('22/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -112.93);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(127, 4502, TO_DATE('27/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 49.15);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(128, 4502, TO_DATE('10/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 1.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(129, 4502, TO_DATE('27/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -41.19);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(130, 4502, TO_DATE('16/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -111.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(131, 4502, TO_DATE('19/06/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/06/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -7.28);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(132, 4502, TO_DATE('18/08/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/08/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 80.12);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(133, 4502, TO_DATE('26/07/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/07/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -63.07);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(26, 4502, TO_DATE('20/07/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/07/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 26', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(16, 'Intervento simulato 16', 'RIUSCITO', TO_DATE('28/07/2010', 'DD/MM/YYYY'), 26);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 16);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 16);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(27, 4502, TO_DATE('22/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 27', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(17, 'Intervento simulato 17', 'RIUSCITO', TO_DATE('24/01/2011', 'DD/MM/YYYY'), 27);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 17);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 17);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 17);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(28, 4502, TO_DATE('25/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 28', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(18, 'Intervento simulato 18', 'RIUSCITO', TO_DATE('02/12/2010', 'DD/MM/YYYY'), 28);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 18);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 18);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 18);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(29, 4502, TO_DATE('10/08/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/08/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 29', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(19, 'Intervento simulato 19', 'FALLITO', TO_DATE('15/08/2010', 'DD/MM/YYYY'), 29);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 19);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 19);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4502;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (10, 4502);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 10, 8);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 10, 10);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 10, 7);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('BIOLOGO', 10, 6);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(11, 'Obiettivo esplorazione missione 11', TO_DATE('05/11/2019', 'DD/MM/YYYY'), TO_DATE('15/06/2020', 'DD/MM/YYYY'), 'COMPLETATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4503, 'ATTIVO', TO_DATE('16/10/2019', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('16/10/2019', 'DD/MM/YYYY'),
-36.228154, -51.282693, 337.61);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(134, 4503, TO_DATE('08/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(135, 4503, TO_DATE('13/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(136, 4503, TO_DATE('05/06/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/06/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(137, 4503, TO_DATE('27/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(138, 4503, TO_DATE('23/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(139, 4503, TO_DATE('10/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(140, 4503, TO_DATE('15/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(141, 4503, TO_DATE('19/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(142, 4503, TO_DATE('22/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(143, 4503, TO_DATE('29/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(144, 4503, TO_DATE('01/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(145, 4503, TO_DATE('23/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(146, 4503, TO_DATE('10/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(147, 4503, TO_DATE('15/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(148, 4503, TO_DATE('02/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(149, 4503, TO_DATE('09/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(30, 4503, TO_DATE('16/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 30', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(20, 'Intervento simulato 20', 'RIUSCITO', TO_DATE('25/05/2020', 'DD/MM/YYYY'), 30);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 20);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 20);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(31, 4503, TO_DATE('06/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 31', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(21, 'Intervento simulato 21', 'RIUSCITO', TO_DATE('14/12/2019', 'DD/MM/YYYY'), 31);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 21);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 21);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (11, 4503);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4504, 'ATTIVO', TO_DATE('21/10/2019', 'DD/MM/YYYY'), 'GAS', TO_DATE('21/10/2019', 'DD/MM/YYYY'),
-87.167167, -46.020093, 917.13);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(150, 4504, TO_DATE('25/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(151, 4504, TO_DATE('13/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(152, 4504, TO_DATE('24/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(153, 4504, TO_DATE('12/06/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/06/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(154, 4504, TO_DATE('22/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(155, 4504, TO_DATE('19/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(156, 4504, TO_DATE('19/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(157, 4504, TO_DATE('09/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(158, 4504, TO_DATE('29/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(159, 4504, TO_DATE('29/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(160, 4504, TO_DATE('02/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(161, 4504, TO_DATE('10/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(162, 4504, TO_DATE('23/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(163, 4504, TO_DATE('31/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(164, 4504, TO_DATE('08/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(32, 4504, TO_DATE('02/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 32', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(22, 'Intervento simulato 22', 'RIUSCITO', TO_DATE('03/11/2019', 'DD/MM/YYYY'), 32);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 22);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 22);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(33, 4504, TO_DATE('04/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 33', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(23, 'Intervento simulato 23', 'RIUSCITO', TO_DATE('12/04/2020', 'DD/MM/YYYY'), 33);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 23);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 23);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (11, 4504);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4505, 'ATTIVO', TO_DATE('25/10/2019', 'DD/MM/YYYY'), 'GAS', TO_DATE('25/10/2019', 'DD/MM/YYYY'),
-85.034907, -23.305458, 137.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(165, 4505, TO_DATE('10/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(166, 4505, TO_DATE('11/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(167, 4505, TO_DATE('27/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(168, 4505, TO_DATE('19/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(169, 4505, TO_DATE('13/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(170, 4505, TO_DATE('26/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(171, 4505, TO_DATE('17/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(172, 4505, TO_DATE('12/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(173, 4505, TO_DATE('01/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(174, 4505, TO_DATE('30/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(175, 4505, TO_DATE('26/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(176, 4505, TO_DATE('15/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(177, 4505, TO_DATE('12/06/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/06/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(178, 4505, TO_DATE('10/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(179, 4505, TO_DATE('02/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(180, 4505, TO_DATE('26/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(181, 4505, TO_DATE('23/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(182, 4505, TO_DATE('12/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(183, 4505, TO_DATE('23/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.10);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(34, 4505, TO_DATE('04/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 34', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(24, 'Intervento simulato 24', 'RIUSCITO', TO_DATE('07/01/2020', 'DD/MM/YYYY'), 34);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 24);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 24);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(35, 4505, TO_DATE('29/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 35', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(25, 'Intervento simulato 25', 'RIUSCITO', TO_DATE('30/10/2019', 'DD/MM/YYYY'), 35);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 25);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 25);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 25);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(36, 4505, TO_DATE('03/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 36', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(26, 'Intervento simulato 26', 'RIUSCITO', TO_DATE('05/03/2020', 'DD/MM/YYYY'), 36);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 26);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 26);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 26);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(37, 4505, TO_DATE('18/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 37', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(27, 'Intervento simulato 27', 'FALLITO', TO_DATE('19/05/2020', 'DD/MM/YYYY'), 37);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 27);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 27);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 27);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4505;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (11, 4505);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4506, 'ATTIVO', TO_DATE('22/10/2019', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('22/10/2019', 'DD/MM/YYYY'),
63.150407, 75.367353, 598.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(184, 4506, TO_DATE('08/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 13.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(185, 4506, TO_DATE('01/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 62.84);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(186, 4506, TO_DATE('28/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 38.20);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(187, 4506, TO_DATE('25/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 61.46);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(188, 4506, TO_DATE('27/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 28.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(189, 4506, TO_DATE('17/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 89.36);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(190, 4506, TO_DATE('24/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22.81);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(191, 4506, TO_DATE('04/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 26.99);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(192, 4506, TO_DATE('29/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 85.26);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(193, 4506, TO_DATE('07/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(194, 4506, TO_DATE('26/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 55.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(195, 4506, TO_DATE('23/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 16.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(196, 4506, TO_DATE('25/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 76.12);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(197, 4506, TO_DATE('23/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 77.80);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(198, 4506, TO_DATE('21/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 69.58);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(199, 4506, TO_DATE('27/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 29.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(200, 4506, TO_DATE('14/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 99.87);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(201, 4506, TO_DATE('26/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 16.60);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(38, 4506, TO_DATE('18/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 38', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(28, 'Intervento simulato 28', 'RIUSCITO', TO_DATE('21/02/2020', 'DD/MM/YYYY'), 38);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 28);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 28);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 28);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(39, 4506, TO_DATE('04/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 39', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(29, 'Intervento simulato 29', 'RIUSCITO', TO_DATE('06/01/2020', 'DD/MM/YYYY'), 39);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 29);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 29);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 29);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (11, 4506);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4507, 'ATTIVO', TO_DATE('21/10/2019', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('21/10/2019', 'DD/MM/YYYY'),
-82.430114, -17.195331, 681.38);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(202, 4507, TO_DATE('12/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(203, 4507, TO_DATE('20/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(204, 4507, TO_DATE('18/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(205, 4507, TO_DATE('17/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(206, 4507, TO_DATE('09/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(207, 4507, TO_DATE('27/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(208, 4507, TO_DATE('27/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(209, 4507, TO_DATE('04/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(210, 4507, TO_DATE('14/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(211, 4507, TO_DATE('15/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(212, 4507, TO_DATE('25/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(213, 4507, TO_DATE('20/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(214, 4507, TO_DATE('03/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(215, 4507, TO_DATE('13/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(216, 4507, TO_DATE('05/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(217, 4507, TO_DATE('30/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(218, 4507, TO_DATE('17/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(219, 4507, TO_DATE('09/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(40, 4507, TO_DATE('31/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 40', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(30, 'Intervento simulato 30', 'RIUSCITO', TO_DATE('04/01/2020', 'DD/MM/YYYY'), 40);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 30);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 30);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(41, 4507, TO_DATE('20/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 41', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(31, 'Intervento simulato 31', 'RIUSCITO', TO_DATE('29/03/2020', 'DD/MM/YYYY'), 41);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 31);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 31);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(42, 4507, TO_DATE('02/06/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/06/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 42', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(32, 'Intervento simulato 32', 'RIUSCITO', TO_DATE('10/06/2020', 'DD/MM/YYYY'), 42);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 32);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 32);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(43, 4507, TO_DATE('09/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 43', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(33, 'Intervento simulato 33', 'FALLITO', TO_DATE('10/05/2020', 'DD/MM/YYYY'), 43);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 33);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 33);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4507;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (11, 4507);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4508, 'ATTIVO', TO_DATE('22/10/2019', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('22/10/2019', 'DD/MM/YYYY'),
-49.988440, 85.122296, 327.15);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(220, 4508, TO_DATE('20/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(221, 4508, TO_DATE('14/06/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/06/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(222, 4508, TO_DATE('29/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(223, 4508, TO_DATE('19/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(224, 4508, TO_DATE('13/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(225, 4508, TO_DATE('01/06/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/06/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(226, 4508, TO_DATE('21/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(227, 4508, TO_DATE('09/06/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/06/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(228, 4508, TO_DATE('19/02/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/02/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(229, 4508, TO_DATE('30/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(230, 4508, TO_DATE('21/05/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/05/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(231, 4508, TO_DATE('10/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(232, 4508, TO_DATE('11/04/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/04/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(233, 4508, TO_DATE('05/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(234, 4508, TO_DATE('27/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(235, 4508, TO_DATE('13/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(236, 4508, TO_DATE('18/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(44, 4508, TO_DATE('05/03/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/03/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 44', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(34, 'Intervento simulato 34', 'RIUSCITO', TO_DATE('09/03/2020', 'DD/MM/YYYY'), 44);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 34);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 34);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(45, 4508, TO_DATE('29/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 45', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(35, 'Intervento simulato 35', 'RIUSCITO', TO_DATE('30/01/2020', 'DD/MM/YYYY'), 45);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 35);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 35);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 35);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(46, 4508, TO_DATE('26/12/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/12/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 46', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(36, 'Intervento simulato 36', 'RIUSCITO', TO_DATE('02/01/2020', 'DD/MM/YYYY'), 46);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 36);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 36);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(47, 4508, TO_DATE('09/01/2020', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/01/2020 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 47', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(37, 'Intervento simulato 37', 'FALLITO', TO_DATE('19/01/2020', 'DD/MM/YYYY'), 47);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 37);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 37);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 37);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4508;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (11, 4508);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 11, 9);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 11, 8);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(12, 'Obiettivo esplorazione missione 12', TO_DATE('02/05/2017', 'DD/MM/YYYY'), NULL, 'ANNULLATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4509, 'ATTIVO', TO_DATE('13/04/2017', 'DD/MM/YYYY'), 'GAS', TO_DATE('13/04/2017', 'DD/MM/YYYY'),
34.401723, 157.530628, 306.98);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(237, 4509, TO_DATE('24/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(238, 4509, TO_DATE('03/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(239, 4509, TO_DATE('17/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(240, 4509, TO_DATE('17/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(241, 4509, TO_DATE('10/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(242, 4509, TO_DATE('14/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(243, 4509, TO_DATE('21/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(244, 4509, TO_DATE('14/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(245, 4509, TO_DATE('26/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(246, 4509, TO_DATE('01/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(247, 4509, TO_DATE('20/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(248, 4509, TO_DATE('12/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(249, 4509, TO_DATE('15/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(250, 4509, TO_DATE('03/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(48, 4509, TO_DATE('22/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 48', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(38, 'Intervento simulato 38', 'RIUSCITO', TO_DATE('29/04/2017', 'DD/MM/YYYY'), 48);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 38);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 38);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 38);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(49, 4509, TO_DATE('02/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 49', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(39, 'Intervento simulato 39', 'RIUSCITO', TO_DATE('06/05/2017', 'DD/MM/YYYY'), 49);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 39);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 39);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(50, 4509, TO_DATE('04/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 50', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(40, 'Intervento simulato 40', 'RIUSCITO', TO_DATE('09/05/2017', 'DD/MM/YYYY'), 50);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 40);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 40);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 40);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (12, 4509);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4510, 'ATTIVO', TO_DATE('18/04/2017', 'DD/MM/YYYY'), 'RADIAZIONI', TO_DATE('18/04/2017', 'DD/MM/YYYY'),
-41.770011, 171.783708, 607.77);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(251, 4510, TO_DATE('19/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 181.28);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(252, 4510, TO_DATE('04/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 103.44);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(253, 4510, TO_DATE('01/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 104.34);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(254, 4510, TO_DATE('22/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 162.38);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(255, 4510, TO_DATE('10/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 40.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(256, 4510, TO_DATE('28/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 3.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(257, 4510, TO_DATE('04/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 45.52);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(258, 4510, TO_DATE('10/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 111.14);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(259, 4510, TO_DATE('31/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 99.58);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(260, 4510, TO_DATE('05/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 93.49);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(261, 4510, TO_DATE('18/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 23.71);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(262, 4510, TO_DATE('25/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 141.53);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(263, 4510, TO_DATE('29/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 117.24);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(51, 4510, TO_DATE('17/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 51', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(41, 'Intervento simulato 41', 'RIUSCITO', TO_DATE('27/05/2017', 'DD/MM/YYYY'), 51);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 41);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 41);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(52, 4510, TO_DATE('09/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 52', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(42, 'Intervento simulato 42', 'RIUSCITO', TO_DATE('12/05/2017', 'DD/MM/YYYY'), 52);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 42);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 42);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 42);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(53, 4510, TO_DATE('22/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 53', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(43, 'Intervento simulato 43', 'RIUSCITO', TO_DATE('29/05/2017', 'DD/MM/YYYY'), 53);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 43);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 43);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(54, 4510, TO_DATE('03/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 54', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(44, 'Intervento simulato 44', 'FALLITO', TO_DATE('06/06/2017', 'DD/MM/YYYY'), 54);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 44);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 44);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4510;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (12, 4510);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4511, 'ATTIVO', TO_DATE('16/04/2017', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('16/04/2017', 'DD/MM/YYYY'),
-81.615043, 123.294750, 828.68);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(264, 4511, TO_DATE('26/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -92.69);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(265, 4511, TO_DATE('22/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -17.64);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(266, 4511, TO_DATE('21/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 113.38);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(267, 4511, TO_DATE('23/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 52.36);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(268, 4511, TO_DATE('12/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -165.40);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(269, 4511, TO_DATE('16/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -49.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(270, 4511, TO_DATE('25/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 32.13);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(271, 4511, TO_DATE('06/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 104.15);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(272, 4511, TO_DATE('23/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -52.53);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(273, 4511, TO_DATE('02/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -56.21);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(274, 4511, TO_DATE('23/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 26.80);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(275, 4511, TO_DATE('24/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 55.11);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(276, 4511, TO_DATE('25/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -87.81);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(55, 4511, TO_DATE('26/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 55', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(45, 'Intervento simulato 45', 'RIUSCITO', TO_DATE('05/05/2017', 'DD/MM/YYYY'), 55);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 45);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 45);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 45);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(56, 4511, TO_DATE('04/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 56', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(46, 'Intervento simulato 46', 'RIUSCITO', TO_DATE('11/06/2017', 'DD/MM/YYYY'), 56);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 46);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 46);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 46);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(57, 4511, TO_DATE('26/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 57', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(47, 'Intervento simulato 47', 'RIUSCITO', TO_DATE('04/05/2017', 'DD/MM/YYYY'), 57);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 47);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 47);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(58, 4511, TO_DATE('02/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 58', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(48, 'Intervento simulato 48', 'FALLITO', TO_DATE('03/06/2017', 'DD/MM/YYYY'), 58);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 48);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 48);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 48);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4511;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (12, 4511);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4512, 'ATTIVO', TO_DATE('02/04/2017', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('02/04/2017', 'DD/MM/YYYY'),
-47.288008, 91.685373, 996.11);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(277, 4512, TO_DATE('30/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -19.91);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(278, 4512, TO_DATE('15/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -127.85);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(279, 4512, TO_DATE('23/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -149.39);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(280, 4512, TO_DATE('06/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 23.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(281, 4512, TO_DATE('20/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -138.34);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(282, 4512, TO_DATE('11/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 36.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(283, 4512, TO_DATE('26/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 47.57);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(284, 4512, TO_DATE('09/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -167.13);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(285, 4512, TO_DATE('07/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -133.75);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(286, 4512, TO_DATE('28/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -49.79);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(287, 4512, TO_DATE('05/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -27.14);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(288, 4512, TO_DATE('15/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -45.34);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(289, 4512, TO_DATE('27/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 24.47);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(290, 4512, TO_DATE('12/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -148.69);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(291, 4512, TO_DATE('18/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -74.64);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(292, 4512, TO_DATE('08/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 79.20);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(293, 4512, TO_DATE('04/06/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/06/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 52.33);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(59, 4512, TO_DATE('07/04/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/04/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 59', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(49, 'Intervento simulato 49', 'RIUSCITO', TO_DATE('13/04/2017', 'DD/MM/YYYY'), 59);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 49);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 49);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 49);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(60, 4512, TO_DATE('14/05/2017', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/05/2017 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 60', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(50, 'Intervento simulato 50', 'RIUSCITO', TO_DATE('23/05/2017', 'DD/MM/YYYY'), 60);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 50);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 50);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 50);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (12, 4512);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 12, 10);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 12, 9);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(13, 'Obiettivo esplorazione missione 13', TO_DATE('28/03/2019', 'DD/MM/YYYY'), NULL, 'ANNULLATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4513, 'ATTIVO', TO_DATE('06/03/2019', 'DD/MM/YYYY'), 'GAS', TO_DATE('06/03/2019', 'DD/MM/YYYY'),
-31.627878, -132.326570, 742.16);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(294, 4513, TO_DATE('18/03/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/03/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(295, 4513, TO_DATE('15/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(296, 4513, TO_DATE('09/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(297, 4513, TO_DATE('20/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(298, 4513, TO_DATE('29/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(299, 4513, TO_DATE('17/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(300, 4513, TO_DATE('21/03/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/03/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(301, 4513, TO_DATE('25/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(302, 4513, TO_DATE('01/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(303, 4513, TO_DATE('03/08/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/08/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(304, 4513, TO_DATE('04/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(61, 4513, TO_DATE('22/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 61', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(51, 'Intervento simulato 51', 'RIUSCITO', TO_DATE('27/10/2019', 'DD/MM/YYYY'), 61);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 51);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 51);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(62, 4513, TO_DATE('22/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 62', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(52, 'Intervento simulato 52', 'RIUSCITO', TO_DATE('28/09/2019', 'DD/MM/YYYY'), 62);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 52);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 52);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 52);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(63, 4513, TO_DATE('14/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 63', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(53, 'Intervento simulato 53', 'RIUSCITO', TO_DATE('16/05/2019', 'DD/MM/YYYY'), 63);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 53);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 53);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(64, 4513, TO_DATE('18/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 64', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(54, 'Intervento simulato 54', 'FALLITO', TO_DATE('22/09/2019', 'DD/MM/YYYY'), 64);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 54);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 54);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4513;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (13, 4513);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4514, 'ATTIVO', TO_DATE('08/03/2019', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('08/03/2019', 'DD/MM/YYYY'),
-31.188795, -44.687699, 893.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(305, 4514, TO_DATE('14/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 63.12);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(306, 4514, TO_DATE('02/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 60.41);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(307, 4514, TO_DATE('16/08/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/08/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 35.90);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(308, 4514, TO_DATE('15/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 38.81);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(309, 4514, TO_DATE('07/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 79.32);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(310, 4514, TO_DATE('19/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 32.43);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(311, 4514, TO_DATE('05/06/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/06/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 62.14);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(312, 4514, TO_DATE('24/08/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/08/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 26.80);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(313, 4514, TO_DATE('03/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 81.15);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(314, 4514, TO_DATE('15/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 75.45);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(315, 4514, TO_DATE('26/06/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/06/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 65.31);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(316, 4514, TO_DATE('28/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 97.19);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(317, 4514, TO_DATE('20/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 5.37);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(318, 4514, TO_DATE('15/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 64.96);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(319, 4514, TO_DATE('26/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 21.26);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(320, 4514, TO_DATE('27/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 59.79);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(321, 4514, TO_DATE('15/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 58.79);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(65, 4514, TO_DATE('21/08/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/08/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 65', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(55, 'Intervento simulato 55', 'RIUSCITO', TO_DATE('30/08/2019', 'DD/MM/YYYY'), 65);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 55);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 55);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 55);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(66, 4514, TO_DATE('28/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 66', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(56, 'Intervento simulato 56', 'RIUSCITO', TO_DATE('08/10/2019', 'DD/MM/YYYY'), 66);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 56);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 56);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 56);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(67, 4514, TO_DATE('08/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 67', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(57, 'Intervento simulato 57', 'RIUSCITO', TO_DATE('09/09/2019', 'DD/MM/YYYY'), 67);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 57);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 57);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(68, 4514, TO_DATE('07/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 68', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(58, 'Intervento simulato 58', 'FALLITO', TO_DATE('14/10/2019', 'DD/MM/YYYY'), 68);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 58);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 58);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4514;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (13, 4514);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4515, 'ATTIVO', TO_DATE('05/03/2019', 'DD/MM/YYYY'), 'GAS', TO_DATE('05/03/2019', 'DD/MM/YYYY'),
89.256894, -151.135544, 747.83);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(322, 4515, TO_DATE('17/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(323, 4515, TO_DATE('27/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(324, 4515, TO_DATE('14/03/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/03/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(325, 4515, TO_DATE('29/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(326, 4515, TO_DATE('20/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(327, 4515, TO_DATE('01/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(328, 4515, TO_DATE('20/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(329, 4515, TO_DATE('24/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(330, 4515, TO_DATE('04/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(331, 4515, TO_DATE('08/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(332, 4515, TO_DATE('09/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(333, 4515, TO_DATE('02/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(69, 4515, TO_DATE('08/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 69', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(59, 'Intervento simulato 59', 'RIUSCITO', TO_DATE('09/04/2019', 'DD/MM/YYYY'), 69);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 59);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 59);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(70, 4515, TO_DATE('27/03/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/03/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 70', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(60, 'Intervento simulato 60', 'RIUSCITO', TO_DATE('02/04/2019', 'DD/MM/YYYY'), 70);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 60);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 60);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 60);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(71, 4515, TO_DATE('16/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 71', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(61, 'Intervento simulato 61', 'RIUSCITO', TO_DATE('24/04/2019', 'DD/MM/YYYY'), 71);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 61);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 61);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(72, 4515, TO_DATE('07/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 72', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(62, 'Intervento simulato 62', 'FALLITO', TO_DATE('08/11/2019', 'DD/MM/YYYY'), 72);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 62);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 62);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 62);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4515;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (13, 4515);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4516, 'ATTIVO', TO_DATE('14/03/2019', 'DD/MM/YYYY'), 'GAS', TO_DATE('14/03/2019', 'DD/MM/YYYY'),
-16.030867, 15.766926, 145.63);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(334, 4516, TO_DATE('28/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(335, 4516, TO_DATE('18/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(336, 4516, TO_DATE('26/03/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/03/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(337, 4516, TO_DATE('12/06/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/06/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(338, 4516, TO_DATE('04/06/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/06/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(339, 4516, TO_DATE('19/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(340, 4516, TO_DATE('23/06/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/06/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(341, 4516, TO_DATE('06/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(342, 4516, TO_DATE('03/06/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/06/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(343, 4516, TO_DATE('30/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(344, 4516, TO_DATE('20/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(345, 4516, TO_DATE('24/08/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/08/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(73, 4516, TO_DATE('29/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 73', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(63, 'Intervento simulato 63', 'RIUSCITO', TO_DATE('30/09/2019', 'DD/MM/YYYY'), 73);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 63);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 63);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(74, 4516, TO_DATE('27/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 74', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(64, 'Intervento simulato 64', 'RIUSCITO', TO_DATE('02/05/2019', 'DD/MM/YYYY'), 74);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 64);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 64);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(75, 4516, TO_DATE('16/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 75', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(65, 'Intervento simulato 65', 'RIUSCITO', TO_DATE('21/09/2019', 'DD/MM/YYYY'), 75);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 65);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 65);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (13, 4516);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4517, 'ATTIVO', TO_DATE('03/03/2019', 'DD/MM/YYYY'), 'RADIAZIONI', TO_DATE('03/03/2019', 'DD/MM/YYYY'),
-14.048046, 63.381630, 411.65);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(346, 4517, TO_DATE('13/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 62.23);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(347, 4517, TO_DATE('02/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 78.52);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(348, 4517, TO_DATE('31/08/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/08/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 184.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(349, 4517, TO_DATE('14/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 12.79);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(350, 4517, TO_DATE('19/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 32.58);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(351, 4517, TO_DATE('28/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 44.87);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(352, 4517, TO_DATE('29/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 176.14);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(353, 4517, TO_DATE('23/06/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/06/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 145.20);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(354, 4517, TO_DATE('08/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 54.58);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(355, 4517, TO_DATE('06/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 20.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(356, 4517, TO_DATE('19/08/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/08/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 8.20);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(357, 4517, TO_DATE('13/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 123.92);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(358, 4517, TO_DATE('30/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 91.84);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(359, 4517, TO_DATE('22/06/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/06/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 135.34);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(360, 4517, TO_DATE('22/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 125.65);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(361, 4517, TO_DATE('07/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 44.01);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(76, 4517, TO_DATE('23/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 76', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(66, 'Intervento simulato 66', 'RIUSCITO', TO_DATE('27/10/2019', 'DD/MM/YYYY'), 76);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 66);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 66);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(77, 4517, TO_DATE('15/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 77', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(67, 'Intervento simulato 67', 'RIUSCITO', TO_DATE('18/07/2019', 'DD/MM/YYYY'), 77);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 67);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 67);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (13, 4517);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4518, 'ATTIVO', TO_DATE('05/03/2019', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('05/03/2019', 'DD/MM/YYYY'),
-0.881003, 18.503131, 796.64);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(362, 4518, TO_DATE('22/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 21.45);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(363, 4518, TO_DATE('04/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 13.21);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(364, 4518, TO_DATE('19/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 19.20);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(365, 4518, TO_DATE('05/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 71.27);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(366, 4518, TO_DATE('01/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 37.58);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(367, 4518, TO_DATE('09/04/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/04/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 34.28);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(368, 4518, TO_DATE('30/03/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/03/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 40.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(369, 4518, TO_DATE('01/07/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/07/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 80.15);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(370, 4518, TO_DATE('05/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 63.61);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(371, 4518, TO_DATE('04/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 3.71);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(372, 4518, TO_DATE('08/08/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/08/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 52.22);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(373, 4518, TO_DATE('05/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 28.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(374, 4518, TO_DATE('04/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 72.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(375, 4518, TO_DATE('20/05/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/05/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 65.40);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(376, 4518, TO_DATE('09/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 37.37);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(377, 4518, TO_DATE('04/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(378, 4518, TO_DATE('16/03/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/03/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 76.86);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(78, 4518, TO_DATE('04/11/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/11/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 78', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(68, 'Intervento simulato 68', 'RIUSCITO', TO_DATE('14/11/2019', 'DD/MM/YYYY'), 78);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 68);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 68);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 68);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(79, 4518, TO_DATE('15/03/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/03/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 79', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(69, 'Intervento simulato 69', 'RIUSCITO', TO_DATE('22/03/2019', 'DD/MM/YYYY'), 79);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 69);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 69);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 69);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(80, 4518, TO_DATE('05/09/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 80', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(70, 'Intervento simulato 70', 'RIUSCITO', TO_DATE('12/09/2019', 'DD/MM/YYYY'), 80);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 70);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 70);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 70);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(81, 4518, TO_DATE('10/10/2019', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/10/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 81', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(71, 'Intervento simulato 71', 'FALLITO', TO_DATE('13/10/2019', 'DD/MM/YYYY'), 81);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 71);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 71);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 71);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4518;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (13, 4518);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 13, 10);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 13, 7);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 13, 8);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(14, 'Obiettivo esplorazione missione 14', TO_DATE('21/08/2012', 'DD/MM/YYYY'), TO_DATE('30/06/2013', 'DD/MM/YYYY'), 'COMPLETATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4519, 'ATTIVO', TO_DATE('23/07/2012', 'DD/MM/YYYY'), 'GAS', TO_DATE('23/07/2012', 'DD/MM/YYYY'),
3.658531, 149.290865, 102.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(379, 4519, TO_DATE('11/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(380, 4519, TO_DATE('20/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(381, 4519, TO_DATE('10/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(382, 4519, TO_DATE('03/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(383, 4519, TO_DATE('09/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(384, 4519, TO_DATE('15/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(385, 4519, TO_DATE('21/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(386, 4519, TO_DATE('22/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(387, 4519, TO_DATE('20/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(388, 4519, TO_DATE('30/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(389, 4519, TO_DATE('10/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(390, 4519, TO_DATE('25/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(391, 4519, TO_DATE('16/02/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/02/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(392, 4519, TO_DATE('02/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(393, 4519, TO_DATE('28/02/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/02/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(394, 4519, TO_DATE('11/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(395, 4519, TO_DATE('20/02/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/02/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(396, 4519, TO_DATE('25/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(397, 4519, TO_DATE('05/08/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/08/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(398, 4519, TO_DATE('22/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(82, 4519, TO_DATE('25/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 82', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(72, 'Intervento simulato 72', 'RIUSCITO', TO_DATE('02/10/2012', 'DD/MM/YYYY'), 82);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 72);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 72);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(83, 4519, TO_DATE('26/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 83', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(73, 'Intervento simulato 73', 'RIUSCITO', TO_DATE('28/04/2013', 'DD/MM/YYYY'), 83);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 73);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 73);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 73);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(84, 4519, TO_DATE('24/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 84', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(74, 'Intervento simulato 74', 'RIUSCITO', TO_DATE('04/10/2012', 'DD/MM/YYYY'), 84);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 74);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 74);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 74);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(85, 4519, TO_DATE('11/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 85', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(75, 'Intervento simulato 75', 'FALLITO', TO_DATE('16/06/2013', 'DD/MM/YYYY'), 85);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 75);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 75);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 75);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4519;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (14, 4519);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4520, 'ATTIVO', TO_DATE('09/08/2012', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('09/08/2012', 'DD/MM/YYYY'),
71.973012, 51.131440, 446.52);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(399, 4520, TO_DATE('16/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(400, 4520, TO_DATE('10/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(401, 4520, TO_DATE('04/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(402, 4520, TO_DATE('16/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(403, 4520, TO_DATE('02/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(404, 4520, TO_DATE('27/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(405, 4520, TO_DATE('28/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(406, 4520, TO_DATE('26/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(407, 4520, TO_DATE('16/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(408, 4520, TO_DATE('09/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(409, 4520, TO_DATE('22/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(410, 4520, TO_DATE('27/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(411, 4520, TO_DATE('23/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(412, 4520, TO_DATE('22/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(413, 4520, TO_DATE('31/08/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/08/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(414, 4520, TO_DATE('08/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(415, 4520, TO_DATE('22/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(86, 4520, TO_DATE('16/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 86', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(76, 'Intervento simulato 76', 'RIUSCITO', TO_DATE('17/05/2013', 'DD/MM/YYYY'), 86);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 76);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 76);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 76);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(87, 4520, TO_DATE('02/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 87', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(77, 'Intervento simulato 77', 'RIUSCITO', TO_DATE('07/03/2013', 'DD/MM/YYYY'), 87);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 77);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 77);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 77);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(88, 4520, TO_DATE('26/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 88', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(78, 'Intervento simulato 78', 'RIUSCITO', TO_DATE('30/04/2013', 'DD/MM/YYYY'), 88);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 78);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 78);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(89, 4520, TO_DATE('09/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 89', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(79, 'Intervento simulato 79', 'FALLITO', TO_DATE('15/04/2013', 'DD/MM/YYYY'), 89);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 79);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 79);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 79);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4520;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (14, 4520);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4521, 'ATTIVO', TO_DATE('28/07/2012', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('28/07/2012', 'DD/MM/YYYY'),
-17.029835, 169.750900, 919.78);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(416, 4521, TO_DATE('21/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(417, 4521, TO_DATE('24/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(418, 4521, TO_DATE('17/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(419, 4521, TO_DATE('21/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(420, 4521, TO_DATE('08/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(421, 4521, TO_DATE('12/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(422, 4521, TO_DATE('13/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(423, 4521, TO_DATE('21/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(424, 4521, TO_DATE('25/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(425, 4521, TO_DATE('16/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(426, 4521, TO_DATE('08/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(427, 4521, TO_DATE('13/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(90, 4521, TO_DATE('26/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 90', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(80, 'Intervento simulato 80', 'RIUSCITO', TO_DATE('06/12/2012', 'DD/MM/YYYY'), 90);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 80);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 80);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 80);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(91, 4521, TO_DATE('17/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 91', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(81, 'Intervento simulato 81', 'RIUSCITO', TO_DATE('22/05/2013', 'DD/MM/YYYY'), 91);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 81);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 81);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (14, 4521);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4522, 'ATTIVO', TO_DATE('09/08/2012', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('09/08/2012', 'DD/MM/YYYY'),
-12.267745, -25.499776, 735.75);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(428, 4522, TO_DATE('30/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 33.54);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(429, 4522, TO_DATE('24/05/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/05/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 75.47);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(430, 4522, TO_DATE('14/08/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/08/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 43.32);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(431, 4522, TO_DATE('26/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 83.90);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(432, 4522, TO_DATE('02/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 39.49);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(433, 4522, TO_DATE('05/02/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/02/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 93.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(434, 4522, TO_DATE('16/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 57.37);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(435, 4522, TO_DATE('01/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 41.29);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(436, 4522, TO_DATE('14/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 9.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(437, 4522, TO_DATE('22/08/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/08/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 99.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(438, 4522, TO_DATE('27/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 50.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(439, 4522, TO_DATE('17/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 6.47);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(92, 4522, TO_DATE('08/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 92', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(82, 'Intervento simulato 82', 'RIUSCITO', TO_DATE('11/06/2013', 'DD/MM/YYYY'), 92);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 82);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 82);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 82);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(93, 4522, TO_DATE('09/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 93', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(83, 'Intervento simulato 83', 'RIUSCITO', TO_DATE('14/09/2012', 'DD/MM/YYYY'), 93);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 83);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 83);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 83);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(94, 4522, TO_DATE('08/04/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/04/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 94', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(84, 'Intervento simulato 84', 'RIUSCITO', TO_DATE('17/04/2013', 'DD/MM/YYYY'), 94);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 84);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 84);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 84);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(95, 4522, TO_DATE('07/06/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/06/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 95', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(85, 'Intervento simulato 85', 'FALLITO', TO_DATE('16/06/2013', 'DD/MM/YYYY'), 95);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 85);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 85);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4522;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (14, 4522);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 14, 10);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 14, 7);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 14, 8);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('BIOLOGO', 14, 9);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(15, 'Obiettivo esplorazione missione 15', TO_DATE('03/10/2010', 'DD/MM/YYYY'), TO_DATE('13/02/2011', 'DD/MM/YYYY'), 'COMPLETATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4523, 'ATTIVO', TO_DATE('14/09/2010', 'DD/MM/YYYY'), 'GAS', TO_DATE('14/09/2010', 'DD/MM/YYYY'),
70.339249, -91.976372, 336.21);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(440, 4523, TO_DATE('13/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(441, 4523, TO_DATE('27/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(442, 4523, TO_DATE('09/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(443, 4523, TO_DATE('31/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(444, 4523, TO_DATE('10/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(445, 4523, TO_DATE('23/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(446, 4523, TO_DATE('02/02/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/02/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(447, 4523, TO_DATE('12/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(448, 4523, TO_DATE('06/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(449, 4523, TO_DATE('15/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(450, 4523, TO_DATE('07/02/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/02/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(451, 4523, TO_DATE('14/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(452, 4523, TO_DATE('23/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(453, 4523, TO_DATE('22/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(454, 4523, TO_DATE('13/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(455, 4523, TO_DATE('05/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(456, 4523, TO_DATE('16/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(457, 4523, TO_DATE('11/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(96, 4523, TO_DATE('15/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 96', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(86, 'Intervento simulato 86', 'RIUSCITO', TO_DATE('25/12/2010', 'DD/MM/YYYY'), 96);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 86);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 86);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(97, 4523, TO_DATE('21/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 97', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(87, 'Intervento simulato 87', 'RIUSCITO', TO_DATE('25/09/2010', 'DD/MM/YYYY'), 97);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 87);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 87);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 87);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(98, 4523, TO_DATE('19/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 98', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(88, 'Intervento simulato 88', 'RIUSCITO', TO_DATE('22/01/2011', 'DD/MM/YYYY'), 98);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 88);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 88);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (15, 4523);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4524, 'ATTIVO', TO_DATE('18/09/2010', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('18/09/2010', 'DD/MM/YYYY'),
-80.009708, -51.375963, 993.49);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(458, 4524, TO_DATE('04/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 115.75);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(459, 4524, TO_DATE('13/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -57.54);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(460, 4524, TO_DATE('07/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 8.74);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(461, 4524, TO_DATE('13/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 123.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(462, 4524, TO_DATE('28/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 77.41);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(463, 4524, TO_DATE('09/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -142.28);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(464, 4524, TO_DATE('04/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 110.73);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(465, 4524, TO_DATE('12/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -170.37);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(466, 4524, TO_DATE('30/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -108.39);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(467, 4524, TO_DATE('07/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -29.68);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(99, 4524, TO_DATE('03/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 99', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(89, 'Intervento simulato 89', 'RIUSCITO', TO_DATE('05/11/2010', 'DD/MM/YYYY'), 99);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 89);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 89);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(100, 4524, TO_DATE('10/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 100', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(90, 'Intervento simulato 90', 'RIUSCITO', TO_DATE('11/12/2010', 'DD/MM/YYYY'), 100);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 90);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 90);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (15, 4524);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4525, 'ATTIVO', TO_DATE('23/09/2010', 'DD/MM/YYYY'), 'GAS', TO_DATE('23/09/2010', 'DD/MM/YYYY'),
12.452020, 179.436359, 664.45);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(468, 4525, TO_DATE('21/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(469, 4525, TO_DATE('01/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(470, 4525, TO_DATE('21/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(471, 4525, TO_DATE('14/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(472, 4525, TO_DATE('01/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(473, 4525, TO_DATE('07/02/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/02/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(474, 4525, TO_DATE('09/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(475, 4525, TO_DATE('08/02/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/02/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(476, 4525, TO_DATE('02/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(477, 4525, TO_DATE('21/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(478, 4525, TO_DATE('11/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(479, 4525, TO_DATE('23/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(480, 4525, TO_DATE('14/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(481, 4525, TO_DATE('03/02/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/02/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(101, 4525, TO_DATE('18/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 101', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(91, 'Intervento simulato 91', 'RIUSCITO', TO_DATE('27/10/2010', 'DD/MM/YYYY'), 101);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 91);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 91);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(102, 4525, TO_DATE('26/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 102', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(92, 'Intervento simulato 92', 'RIUSCITO', TO_DATE('05/11/2010', 'DD/MM/YYYY'), 102);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 92);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 92);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(103, 4525, TO_DATE('08/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 103', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(93, 'Intervento simulato 93', 'RIUSCITO', TO_DATE('14/01/2011', 'DD/MM/YYYY'), 103);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 93);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 93);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 93);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(104, 4525, TO_DATE('08/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 104', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(94, 'Intervento simulato 94', 'FALLITO', TO_DATE('17/10/2010', 'DD/MM/YYYY'), 104);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 94);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 94);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4525;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (15, 4525);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4526, 'ATTIVO', TO_DATE('14/09/2010', 'DD/MM/YYYY'), 'GAS', TO_DATE('14/09/2010', 'DD/MM/YYYY'),
16.973570, -140.203778, 874.27);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(482, 4526, TO_DATE('19/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(483, 4526, TO_DATE('07/11/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/11/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(484, 4526, TO_DATE('28/12/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/12/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(485, 4526, TO_DATE('17/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(486, 4526, TO_DATE('26/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(487, 4526, TO_DATE('19/09/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/09/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(488, 4526, TO_DATE('25/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(489, 4526, TO_DATE('15/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(490, 4526, TO_DATE('13/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(491, 4526, TO_DATE('04/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(492, 4526, TO_DATE('18/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(105, 4526, TO_DATE('30/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 105', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(95, 'Intervento simulato 95', 'RIUSCITO', TO_DATE('08/11/2010', 'DD/MM/YYYY'), 105);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 95);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 95);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 95);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(106, 4526, TO_DATE('14/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 106', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(96, 'Intervento simulato 96', 'RIUSCITO', TO_DATE('23/10/2010', 'DD/MM/YYYY'), 106);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 96);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 96);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 96);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(107, 4526, TO_DATE('17/01/2011', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/01/2011 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 107', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(97, 'Intervento simulato 97', 'RIUSCITO', TO_DATE('20/01/2011', 'DD/MM/YYYY'), 107);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 97);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 97);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(108, 4526, TO_DATE('15/10/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/10/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 108', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(98, 'Intervento simulato 98', 'FALLITO', TO_DATE('22/10/2010', 'DD/MM/YYYY'), 108);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 98);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 98);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 98);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4526;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (15, 4526);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 15, 8);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 15, 7);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 15, 6);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(16, 'Obiettivo esplorazione missione 16', TO_DATE('11/06/2012', 'DD/MM/YYYY'), TO_DATE('14/03/2013', 'DD/MM/YYYY'), 'COMPLETATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4527, 'ATTIVO', TO_DATE('12/05/2012', 'DD/MM/YYYY'), 'GAS', TO_DATE('12/05/2012', 'DD/MM/YYYY'),
-74.225323, 175.445905, 519.49);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(493, 4527, TO_DATE('14/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(494, 4527, TO_DATE('05/07/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/07/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(495, 4527, TO_DATE('21/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(496, 4527, TO_DATE('06/07/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/07/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(497, 4527, TO_DATE('04/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(498, 4527, TO_DATE('20/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(499, 4527, TO_DATE('07/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(500, 4527, TO_DATE('15/07/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/07/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(501, 4527, TO_DATE('12/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(502, 4527, TO_DATE('19/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(503, 4527, TO_DATE('10/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(504, 4527, TO_DATE('28/05/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/05/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(505, 4527, TO_DATE('15/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(506, 4527, TO_DATE('05/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(507, 4527, TO_DATE('26/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(508, 4527, TO_DATE('25/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(109, 4527, TO_DATE('19/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 109', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(99, 'Intervento simulato 99', 'RIUSCITO', TO_DATE('27/12/2012', 'DD/MM/YYYY'), 109);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 99);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 99);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 99);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(110, 4527, TO_DATE('08/07/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/07/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 110', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(100, 'Intervento simulato 100', 'RIUSCITO', TO_DATE('14/07/2012', 'DD/MM/YYYY'), 110);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 100);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 100);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 100);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(111, 4527, TO_DATE('13/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 111', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(101, 'Intervento simulato 101', 'RIUSCITO', TO_DATE('21/11/2012', 'DD/MM/YYYY'), 111);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 101);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 101);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 101);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (16, 4527);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4528, 'ATTIVO', TO_DATE('28/05/2012', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('28/05/2012', 'DD/MM/YYYY'),
28.155303, 179.548688, 270.43);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(509, 4528, TO_DATE('24/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 58.99);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(510, 4528, TO_DATE('11/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 25.37);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(511, 4528, TO_DATE('21/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10.46);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(512, 4528, TO_DATE('14/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22.35);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(513, 4528, TO_DATE('23/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 98.13);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(514, 4528, TO_DATE('19/08/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/08/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 69.19);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(515, 4528, TO_DATE('19/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 91.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(516, 4528, TO_DATE('01/03/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/03/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 55.41);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(517, 4528, TO_DATE('26/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 83.73);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(518, 4528, TO_DATE('05/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 69.74);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(519, 4528, TO_DATE('11/07/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/07/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 8.38);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(112, 4528, TO_DATE('08/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 112', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(102, 'Intervento simulato 102', 'RIUSCITO', TO_DATE('10/09/2012', 'DD/MM/YYYY'), 112);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 102);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 102);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 102);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(113, 4528, TO_DATE('01/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 113', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(103, 'Intervento simulato 103', 'RIUSCITO', TO_DATE('10/10/2012', 'DD/MM/YYYY'), 113);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 103);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 103);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(114, 4528, TO_DATE('18/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 114', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(104, 'Intervento simulato 104', 'RIUSCITO', TO_DATE('21/12/2012', 'DD/MM/YYYY'), 114);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 104);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 104);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(115, 4528, TO_DATE('07/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 115', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(105, 'Intervento simulato 105', 'FALLITO', TO_DATE('10/11/2012', 'DD/MM/YYYY'), 115);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 105);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 105);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4528;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (16, 4528);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4529, 'ATTIVO', TO_DATE('23/05/2012', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('23/05/2012', 'DD/MM/YYYY'),
-37.393770, -167.226606, 385.20);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(520, 4529, TO_DATE('26/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 108.18);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(521, 4529, TO_DATE('18/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -45.81);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(522, 4529, TO_DATE('30/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 30.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(523, 4529, TO_DATE('12/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -79.58);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(524, 4529, TO_DATE('24/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 113.83);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(525, 4529, TO_DATE('12/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -20.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(526, 4529, TO_DATE('27/05/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/05/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -127.68);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(527, 4529, TO_DATE('23/08/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/08/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -93.12);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(528, 4529, TO_DATE('25/08/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/08/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 77.65);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(529, 4529, TO_DATE('20/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 37.62);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(530, 4529, TO_DATE('09/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 124.54);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(531, 4529, TO_DATE('21/02/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/02/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -14.33);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(532, 4529, TO_DATE('18/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 25.54);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(533, 4529, TO_DATE('28/05/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/05/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 35.45);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(534, 4529, TO_DATE('02/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 73.64);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(535, 4529, TO_DATE('19/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -100.48);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(536, 4529, TO_DATE('31/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -19.57);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(537, 4529, TO_DATE('15/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 118.52);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(538, 4529, TO_DATE('21/02/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/02/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -101.11);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(116, 4529, TO_DATE('26/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 116', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(106, 'Intervento simulato 106', 'RIUSCITO', TO_DATE('04/10/2012', 'DD/MM/YYYY'), 116);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 106);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 106);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(117, 4529, TO_DATE('22/07/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/07/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 117', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(107, 'Intervento simulato 107', 'RIUSCITO', TO_DATE('31/07/2012', 'DD/MM/YYYY'), 117);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 107);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 107);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 107);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(118, 4529, TO_DATE('21/02/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/02/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 118', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(108, 'Intervento simulato 108', 'RIUSCITO', TO_DATE('24/02/2013', 'DD/MM/YYYY'), 118);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 108);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 108);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(119, 4529, TO_DATE('04/07/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/07/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 119', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(109, 'Intervento simulato 109', 'FALLITO', TO_DATE('07/07/2012', 'DD/MM/YYYY'), 119);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 109);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 109);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 109);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4529;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (16, 4529);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4530, 'ATTIVO', TO_DATE('17/05/2012', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('17/05/2012', 'DD/MM/YYYY'),
-29.605262, -18.221258, 552.82);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(539, 4530, TO_DATE('05/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 87.14);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(540, 4530, TO_DATE('31/10/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/10/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 75.26);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(541, 4530, TO_DATE('02/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 11.32);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(542, 4530, TO_DATE('04/01/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/01/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 25.35);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(543, 4530, TO_DATE('04/12/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/12/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 58.29);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(544, 4530, TO_DATE('13/09/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/09/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 49.09);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(545, 4530, TO_DATE('11/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 47.43);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(546, 4530, TO_DATE('31/05/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/05/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 50.48);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(547, 4530, TO_DATE('07/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 81.36);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(548, 4530, TO_DATE('20/08/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/08/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 38.15);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(549, 4530, TO_DATE('09/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 84.17);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(120, 4530, TO_DATE('08/06/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/06/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 120', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(110, 'Intervento simulato 110', 'RIUSCITO', TO_DATE('13/06/2012', 'DD/MM/YYYY'), 120);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 110);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 110);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(121, 4530, TO_DATE('20/11/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/11/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 121', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(111, 'Intervento simulato 111', 'RIUSCITO', TO_DATE('26/11/2012', 'DD/MM/YYYY'), 121);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 111);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 111);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 111);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(122, 4530, TO_DATE('26/05/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/05/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 122', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(112, 'Intervento simulato 112', 'RIUSCITO', TO_DATE('03/06/2012', 'DD/MM/YYYY'), 122);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 112);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 112);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(123, 4530, TO_DATE('27/07/2012', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/07/2012 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 123', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(113, 'Intervento simulato 113', 'FALLITO', TO_DATE('30/07/2012', 'DD/MM/YYYY'), 123);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 113);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 113);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 113);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4530;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (16, 4530);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 16, 10);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 16, 7);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 16, 8);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(17, 'Obiettivo esplorazione missione 17', TO_DATE('10/01/2010', 'DD/MM/YYYY'), TO_DATE('18/02/2010', 'DD/MM/YYYY'), 'COMPLETATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4531, 'ATTIVO', TO_DATE('29/12/2009', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('29/12/2009', 'DD/MM/YYYY'),
-24.009917, 168.468397, 203.66);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(550, 4531, TO_DATE('02/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 55.33);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(551, 4531, TO_DATE('11/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 46.85);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(552, 4531, TO_DATE('02/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 50.19);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(553, 4531, TO_DATE('16/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 55.43);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(554, 4531, TO_DATE('25/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 73.83);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(555, 4531, TO_DATE('04/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 23.65);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(556, 4531, TO_DATE('24/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 28.74);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(557, 4531, TO_DATE('20/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 64.96);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(558, 4531, TO_DATE('23/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 31.92);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(559, 4531, TO_DATE('19/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 56.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(560, 4531, TO_DATE('01/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 31.58);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(124, 4531, TO_DATE('13/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 124', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(114, 'Intervento simulato 114', 'RIUSCITO', TO_DATE('20/01/2010', 'DD/MM/YYYY'), 124);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 114);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 114);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(125, 4531, TO_DATE('09/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 125', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(115, 'Intervento simulato 115', 'RIUSCITO', TO_DATE('18/01/2010', 'DD/MM/YYYY'), 125);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 115);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 115);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(126, 4531, TO_DATE('15/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 126', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(116, 'Intervento simulato 116', 'RIUSCITO', TO_DATE('21/02/2010', 'DD/MM/YYYY'), 126);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 116);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 116);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(127, 4531, TO_DATE('09/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 127', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(117, 'Intervento simulato 117', 'FALLITO', TO_DATE('19/01/2010', 'DD/MM/YYYY'), 127);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 117);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 117);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4531;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (17, 4531);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4532, 'ATTIVO', TO_DATE('30/12/2009', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('30/12/2009', 'DD/MM/YYYY'),
-51.604935, 23.699194, 694.85);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(561, 4532, TO_DATE('17/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 80.12);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(562, 4532, TO_DATE('10/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 73.92);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(563, 4532, TO_DATE('18/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 72.89);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(564, 4532, TO_DATE('17/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 86.78);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(565, 4532, TO_DATE('17/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 46.28);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(566, 4532, TO_DATE('23/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 11.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(567, 4532, TO_DATE('13/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 70.35);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(568, 4532, TO_DATE('06/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 98.89);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(569, 4532, TO_DATE('05/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 7.32);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(570, 4532, TO_DATE('24/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 86.61);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(571, 4532, TO_DATE('15/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 90.50);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(572, 4532, TO_DATE('17/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 9.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(573, 4532, TO_DATE('02/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 14.18);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(128, 4532, TO_DATE('18/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 128', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(118, 'Intervento simulato 118', 'RIUSCITO', TO_DATE('19/01/2010', 'DD/MM/YYYY'), 128);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 118);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 118);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(129, 4532, TO_DATE('31/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 129', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(119, 'Intervento simulato 119', 'RIUSCITO', TO_DATE('01/01/2010', 'DD/MM/YYYY'), 129);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 119);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 119);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 119);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(130, 4532, TO_DATE('05/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 130', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(120, 'Intervento simulato 120', 'RIUSCITO', TO_DATE('08/02/2010', 'DD/MM/YYYY'), 130);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 120);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 120);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 120);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(131, 4532, TO_DATE('06/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 131', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(121, 'Intervento simulato 121', 'FALLITO', TO_DATE('11/01/2010', 'DD/MM/YYYY'), 131);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 121);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 121);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4532;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (17, 4532);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4533, 'ATTIVO', TO_DATE('29/12/2009', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('29/12/2009', 'DD/MM/YYYY'),
70.415459, 57.892515, 879.16);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(574, 4533, TO_DATE('10/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 9.71);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(575, 4533, TO_DATE('24/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 39.44);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(576, 4533, TO_DATE('08/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 36.90);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(577, 4533, TO_DATE('30/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 75.71);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(578, 4533, TO_DATE('08/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 27.80);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(579, 4533, TO_DATE('29/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 20.51);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(580, 4533, TO_DATE('20/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 74.34);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(581, 4533, TO_DATE('13/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 57.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(582, 4533, TO_DATE('16/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 1.36);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(583, 4533, TO_DATE('10/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 68.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(584, 4533, TO_DATE('07/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 16.61);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(585, 4533, TO_DATE('03/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 90.99);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(586, 4533, TO_DATE('03/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42.22);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(587, 4533, TO_DATE('18/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 74.53);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(588, 4533, TO_DATE('31/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 61.31);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(589, 4533, TO_DATE('12/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 89.74);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(132, 4533, TO_DATE('07/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 132', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(122, 'Intervento simulato 122', 'RIUSCITO', TO_DATE('13/02/2010', 'DD/MM/YYYY'), 132);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 122);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 122);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 122);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(133, 4533, TO_DATE('14/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 133', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(123, 'Intervento simulato 123', 'RIUSCITO', TO_DATE('24/01/2010', 'DD/MM/YYYY'), 133);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 123);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 123);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(134, 4533, TO_DATE('11/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 134', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(124, 'Intervento simulato 124', 'RIUSCITO', TO_DATE('21/02/2010', 'DD/MM/YYYY'), 134);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 124);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 124);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 124);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(135, 4533, TO_DATE('07/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 135', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(125, 'Intervento simulato 125', 'FALLITO', TO_DATE('08/02/2010', 'DD/MM/YYYY'), 135);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 125);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 125);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 125);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4533;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (17, 4533);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4534, 'ATTIVO', TO_DATE('17/12/2009', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('17/12/2009', 'DD/MM/YYYY'),
-43.828439, -0.125495, 449.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(590, 4534, TO_DATE('31/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 59.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(591, 4534, TO_DATE('22/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 77.16);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(592, 4534, TO_DATE('17/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 94.56);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(593, 4534, TO_DATE('20/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 91.45);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(594, 4534, TO_DATE('17/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 20.59);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(595, 4534, TO_DATE('27/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 81.79);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(596, 4534, TO_DATE('26/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 2.87);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(597, 4534, TO_DATE('12/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 14.86);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(598, 4534, TO_DATE('08/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 27.81);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(599, 4534, TO_DATE('08/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 40.55);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(600, 4534, TO_DATE('28/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42.48);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(601, 4534, TO_DATE('03/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22.50);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(602, 4534, TO_DATE('29/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 2.54);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(136, 4534, TO_DATE('03/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 136', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(126, 'Intervento simulato 126', 'RIUSCITO', TO_DATE('11/01/2010', 'DD/MM/YYYY'), 136);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 126);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 126);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 126);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(137, 4534, TO_DATE('09/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 137', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(127, 'Intervento simulato 127', 'RIUSCITO', TO_DATE('16/01/2010', 'DD/MM/YYYY'), 137);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 127);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 127);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 127);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(138, 4534, TO_DATE('23/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 138', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(128, 'Intervento simulato 128', 'RIUSCITO', TO_DATE('29/12/2009', 'DD/MM/YYYY'), 138);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 128);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 128);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(139, 4534, TO_DATE('23/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 139', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(129, 'Intervento simulato 129', 'FALLITO', TO_DATE('24/12/2009', 'DD/MM/YYYY'), 139);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 129);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 129);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 129);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4534;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (17, 4534);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4535, 'ATTIVO', TO_DATE('23/12/2009', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('23/12/2009', 'DD/MM/YYYY'),
85.379362, -14.651883, 602.34);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(603, 4535, TO_DATE('06/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 2.33);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(604, 4535, TO_DATE('23/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 73.25);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(605, 4535, TO_DATE('04/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 67.14);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(606, 4535, TO_DATE('29/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 85.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(607, 4535, TO_DATE('08/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 57.99);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(608, 4535, TO_DATE('07/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 66.18);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(609, 4535, TO_DATE('19/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 15.60);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(610, 4535, TO_DATE('16/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 84.29);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(611, 4535, TO_DATE('09/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 93.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(612, 4535, TO_DATE('31/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 55.17);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(613, 4535, TO_DATE('11/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 42.16);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(614, 4535, TO_DATE('14/02/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 98.44);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(615, 4535, TO_DATE('10/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 44.66);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(616, 4535, TO_DATE('03/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 22.41);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(617, 4535, TO_DATE('23/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 29.63);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(618, 4535, TO_DATE('14/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 20.54);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(619, 4535, TO_DATE('07/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 17.13);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(140, 4535, TO_DATE('31/12/2009', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/12/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 140', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(130, 'Intervento simulato 130', 'RIUSCITO', TO_DATE('04/01/2010', 'DD/MM/YYYY'), 140);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 130);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 130);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 130);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(141, 4535, TO_DATE('21/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 141', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(131, 'Intervento simulato 131', 'RIUSCITO', TO_DATE('31/01/2010', 'DD/MM/YYYY'), 141);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 131);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 131);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(142, 4535, TO_DATE('26/01/2010', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/01/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 142', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(132, 'Intervento simulato 132', 'RIUSCITO', TO_DATE('03/02/2010', 'DD/MM/YYYY'), 142);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 132);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 132);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 132);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (17, 4535);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 17, 10);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 17, 8);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 17, 9);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('BIOLOGO', 17, 7);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(18, 'Obiettivo esplorazione missione 18', TO_DATE('03/05/2014', 'DD/MM/YYYY'), NULL, 'ANNULLATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4536, 'ATTIVO', TO_DATE('03/04/2014', 'DD/MM/YYYY'), 'GAS', TO_DATE('03/04/2014', 'DD/MM/YYYY'),
-10.712040, 23.486535, 475.12);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(620, 4536, TO_DATE('20/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(621, 4536, TO_DATE('02/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(622, 4536, TO_DATE('05/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(623, 4536, TO_DATE('23/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(624, 4536, TO_DATE('23/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(625, 4536, TO_DATE('28/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(626, 4536, TO_DATE('12/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(627, 4536, TO_DATE('04/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(628, 4536, TO_DATE('19/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(629, 4536, TO_DATE('18/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(630, 4536, TO_DATE('29/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(631, 4536, TO_DATE('25/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(632, 4536, TO_DATE('08/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(633, 4536, TO_DATE('09/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(634, 4536, TO_DATE('06/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(635, 4536, TO_DATE('10/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(636, 4536, TO_DATE('02/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(637, 4536, TO_DATE('01/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(638, 4536, TO_DATE('21/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(639, 4536, TO_DATE('12/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(143, 4536, TO_DATE('20/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 143', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(133, 'Intervento simulato 133', 'RIUSCITO', TO_DATE('21/06/2014', 'DD/MM/YYYY'), 143);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 133);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 133);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(144, 4536, TO_DATE('01/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 144', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(134, 'Intervento simulato 134', 'RIUSCITO', TO_DATE('04/05/2014', 'DD/MM/YYYY'), 144);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 134);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 134);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (18, 4536);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4537, 'ATTIVO', TO_DATE('04/04/2014', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('04/04/2014', 'DD/MM/YYYY'),
3.026980, -25.526687, 584.52);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(640, 4537, TO_DATE('21/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -92.29);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(641, 4537, TO_DATE('09/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -94.54);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(642, 4537, TO_DATE('08/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -94.36);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(643, 4537, TO_DATE('05/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 8.78);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(644, 4537, TO_DATE('13/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 21.70);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(645, 4537, TO_DATE('18/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10.38);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(646, 4537, TO_DATE('25/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -45.28);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(647, 4537, TO_DATE('20/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -10.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(648, 4537, TO_DATE('14/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -96.66);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(649, 4537, TO_DATE('17/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -162.62);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(650, 4537, TO_DATE('24/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -162.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(651, 4537, TO_DATE('16/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 82.33);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(652, 4537, TO_DATE('25/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -115.12);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(653, 4537, TO_DATE('09/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -37.16);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(654, 4537, TO_DATE('02/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 115.60);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(655, 4537, TO_DATE('20/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -0.56);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(656, 4537, TO_DATE('15/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -11.11);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(145, 4537, TO_DATE('22/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 145', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(135, 'Intervento simulato 135', 'RIUSCITO', TO_DATE('30/05/2014', 'DD/MM/YYYY'), 145);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 135);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 135);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 135);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(146, 4537, TO_DATE('29/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 146', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(136, 'Intervento simulato 136', 'RIUSCITO', TO_DATE('09/05/2014', 'DD/MM/YYYY'), 146);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 136);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 136);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(147, 4537, TO_DATE('01/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 147', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(137, 'Intervento simulato 137', 'RIUSCITO', TO_DATE('05/05/2014', 'DD/MM/YYYY'), 147);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 137);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 137);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (18, 4537);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4538, 'ATTIVO', TO_DATE('10/04/2014', 'DD/MM/YYYY'), 'PRESSIONE', TO_DATE('10/04/2014', 'DD/MM/YYYY'),
85.043039, -131.243070, 727.66);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(657, 4538, TO_DATE('16/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(658, 4538, TO_DATE('29/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(659, 4538, TO_DATE('19/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(660, 4538, TO_DATE('28/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(661, 4538, TO_DATE('19/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(662, 4538, TO_DATE('27/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(663, 4538, TO_DATE('18/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(664, 4538, TO_DATE('14/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(665, 4538, TO_DATE('31/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(666, 4538, TO_DATE('19/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(667, 4538, TO_DATE('03/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.00);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(148, 4538, TO_DATE('17/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 148', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(138, 'Intervento simulato 138', 'RIUSCITO', TO_DATE('23/05/2014', 'DD/MM/YYYY'), 148);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 138);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 138);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(149, 4538, TO_DATE('17/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 149', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(139, 'Intervento simulato 139', 'RIUSCITO', TO_DATE('20/05/2014', 'DD/MM/YYYY'), 149);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 139);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 139);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 139);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (18, 4538);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4539, 'ATTIVO', TO_DATE('18/04/2014', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('18/04/2014', 'DD/MM/YYYY'),
23.175352, 164.390950, 577.17);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(668, 4539, TO_DATE('18/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -167.83);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(669, 4539, TO_DATE('23/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -50.42);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(670, 4539, TO_DATE('24/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 117.94);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(671, 4539, TO_DATE('14/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -67.44);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(672, 4539, TO_DATE('19/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 27.29);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(673, 4539, TO_DATE('23/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 53.83);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(674, 4539, TO_DATE('05/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -99.12);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(675, 4539, TO_DATE('09/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -156.25);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(676, 4539, TO_DATE('07/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 43.72);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(677, 4539, TO_DATE('28/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 68.97);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(678, 4539, TO_DATE('30/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -136.71);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(679, 4539, TO_DATE('28/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -126.25);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(680, 4539, TO_DATE('24/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -49.36);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(681, 4539, TO_DATE('20/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 57.57);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(682, 4539, TO_DATE('21/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -82.93);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(683, 4539, TO_DATE('11/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -34.13);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(684, 4539, TO_DATE('13/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 74.17);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(685, 4539, TO_DATE('08/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -100.84);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(150, 4539, TO_DATE('20/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 150', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(140, 'Intervento simulato 140', 'RIUSCITO', TO_DATE('27/06/2014', 'DD/MM/YYYY'), 150);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 140);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 140);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 140);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(151, 4539, TO_DATE('28/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 151', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(141, 'Intervento simulato 141', 'RIUSCITO', TO_DATE('03/06/2014', 'DD/MM/YYYY'), 151);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 141);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 141);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(152, 4539, TO_DATE('11/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 152', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(142, 'Intervento simulato 142', 'RIUSCITO', TO_DATE('19/06/2014', 'DD/MM/YYYY'), 152);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 142);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 142);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 142);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (18, 4539);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4540, 'ATTIVO', TO_DATE('12/04/2014', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('12/04/2014', 'DD/MM/YYYY'),
75.849282, -54.612983, 927.79);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(686, 4540, TO_DATE('23/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -112.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(687, 4540, TO_DATE('12/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 48.89);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(688, 4540, TO_DATE('28/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 74.21);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(689, 4540, TO_DATE('28/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -108.42);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(690, 4540, TO_DATE('06/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 7.85);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(691, 4540, TO_DATE('13/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -93.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(692, 4540, TO_DATE('01/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -25.95);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(693, 4540, TO_DATE('16/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -107.21);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(694, 4540, TO_DATE('01/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -51.26);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(695, 4540, TO_DATE('08/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 125.60);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(696, 4540, TO_DATE('20/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -126.28);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(697, 4540, TO_DATE('02/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -167.04);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(153, 4540, TO_DATE('13/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 153', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(143, 'Intervento simulato 143', 'RIUSCITO', TO_DATE('17/06/2014', 'DD/MM/YYYY'), 153);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 143);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 143);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 143);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(154, 4540, TO_DATE('21/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 154', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(144, 'Intervento simulato 144', 'RIUSCITO', TO_DATE('28/04/2014', 'DD/MM/YYYY'), 154);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 144);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 144);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (18, 4540);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4541, 'ATTIVO', TO_DATE('15/04/2014', 'DD/MM/YYYY'), 'RADIAZIONI', TO_DATE('15/04/2014', 'DD/MM/YYYY'),
-59.698477, 6.096657, 470.38);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(698, 4541, TO_DATE('07/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 57.78);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(699, 4541, TO_DATE('04/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 195.00);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(700, 4541, TO_DATE('28/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 173.66);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(701, 4541, TO_DATE('25/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 165.79);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(702, 4541, TO_DATE('30/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 127.31);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(703, 4541, TO_DATE('30/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 17.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(704, 4541, TO_DATE('05/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 71.30);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(705, 4541, TO_DATE('02/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 172.01);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(706, 4541, TO_DATE('18/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('18/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 183.91);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(707, 4541, TO_DATE('22/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 144.52);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(708, 4541, TO_DATE('20/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 69.60);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(709, 4541, TO_DATE('25/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 59.42);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(710, 4541, TO_DATE('19/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 63.83);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(711, 4541, TO_DATE('02/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 78.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(712, 4541, TO_DATE('01/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 95.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(713, 4541, TO_DATE('25/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 12.01);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(155, 4541, TO_DATE('11/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 155', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(145, 'Intervento simulato 145', 'RIUSCITO', TO_DATE('15/05/2014', 'DD/MM/YYYY'), 155);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 145);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 145);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 145);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(156, 4541, TO_DATE('01/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 156', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(146, 'Intervento simulato 146', 'RIUSCITO', TO_DATE('03/06/2014', 'DD/MM/YYYY'), 156);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 146);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 146);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(157, 4541, TO_DATE('01/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 157', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(147, 'Intervento simulato 147', 'RIUSCITO', TO_DATE('06/06/2014', 'DD/MM/YYYY'), 157);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 147);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 147);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (18, 4541);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 18, 10);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 18, 9);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('GEOLOGO', 18, 7);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('BIOLOGO', 18, 8);
INSERT INTO Missioni (codice, obiettivo, data_inizio, data_fine, stato) VALUES
(19, 'Obiettivo esplorazione missione 19', TO_DATE('17/11/2013', 'DD/MM/YYYY'), TO_DATE('19/07/2014', 'DD/MM/YYYY'), 'COMPLETATA');
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4542, 'ATTIVO', TO_DATE('04/11/2013', 'DD/MM/YYYY'), 'GAS', TO_DATE('04/11/2013', 'DD/MM/YYYY'),
76.703101, -2.965306, 729.64);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(714, 4542, TO_DATE('08/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(715, 4542, TO_DATE('03/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(716, 4542, TO_DATE('04/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(717, 4542, TO_DATE('12/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.06);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(718, 4542, TO_DATE('03/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(719, 4542, TO_DATE('25/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.08);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(720, 4542, TO_DATE('09/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.03);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(721, 4542, TO_DATE('03/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(722, 4542, TO_DATE('12/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(723, 4542, TO_DATE('05/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.05);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(724, 4542, TO_DATE('19/03/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/03/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(725, 4542, TO_DATE('05/11/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/11/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(726, 4542, TO_DATE('03/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 0.04);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(158, 4542, TO_DATE('10/11/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/11/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 158', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(148, 'Intervento simulato 148', 'RIUSCITO', TO_DATE('18/11/2013', 'DD/MM/YYYY'), 158);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 148);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 148);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 148);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(159, 4542, TO_DATE('22/03/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('22/03/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 159', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(149, 'Intervento simulato 149', 'RIUSCITO', TO_DATE('24/03/2014', 'DD/MM/YYYY'), 159);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 149);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 149);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 149);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(160, 4542, TO_DATE('29/11/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/11/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 160', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(150, 'Intervento simulato 150', 'RIUSCITO', TO_DATE('02/12/2013', 'DD/MM/YYYY'), 160);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 150);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 150);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(161, 4542, TO_DATE('07/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 161', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(151, 'Intervento simulato 151', 'FALLITO', TO_DATE('16/12/2013', 'DD/MM/YYYY'), 161);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 151);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 151);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4542;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (19, 4542);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4543, 'ATTIVO', TO_DATE('05/11/2013', 'DD/MM/YYYY'), 'RADIAZIONI', TO_DATE('05/11/2013', 'DD/MM/YYYY'),
-34.306336, 157.453795, 548.66);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(727, 4543, TO_DATE('15/02/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/02/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 113.71);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(728, 4543, TO_DATE('01/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 25.19);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(729, 4543, TO_DATE('11/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 137.85);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(730, 4543, TO_DATE('04/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 106.04);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(731, 4543, TO_DATE('25/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 116.31);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(732, 4543, TO_DATE('19/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 65.56);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(733, 4543, TO_DATE('29/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 67.27);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(734, 4543, TO_DATE('10/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 78.98);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(735, 4543, TO_DATE('09/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 46.11);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(736, 4543, TO_DATE('12/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('12/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 17.36);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(737, 4543, TO_DATE('20/11/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/11/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 188.15);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(738, 4543, TO_DATE('26/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 43.85);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(739, 4543, TO_DATE('05/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('05/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 41.23);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(740, 4543, TO_DATE('14/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 91.10);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(741, 4543, TO_DATE('25/02/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/02/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 124.75);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(742, 4543, TO_DATE('04/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 5.59);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(743, 4543, TO_DATE('23/11/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('23/11/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 189.14);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(744, 4543, TO_DATE('01/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 19.33);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(745, 4543, TO_DATE('01/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 87.75);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(162, 4543, TO_DATE('16/11/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('16/11/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 162', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(152, 'Intervento simulato 152', 'RIUSCITO', TO_DATE('23/11/2013', 'DD/MM/YYYY'), 162);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 152);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 152);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(163, 4543, TO_DATE('31/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 163', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(153, 'Intervento simulato 153', 'RIUSCITO', TO_DATE('08/01/2014', 'DD/MM/YYYY'), 163);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 153);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 153);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 153);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (19, 4543);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4544, 'ATTIVO', TO_DATE('18/10/2013', 'DD/MM/YYYY'), 'GEOLOGIA', TO_DATE('18/10/2013', 'DD/MM/YYYY'),
41.650755, -43.339583, 262.76);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(746, 4544, TO_DATE('11/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 12.74);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(747, 4544, TO_DATE('11/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 2.60);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(748, 4544, TO_DATE('19/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 87.71);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(749, 4544, TO_DATE('04/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('04/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 91.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(750, 4544, TO_DATE('30/10/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/10/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 57.47);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(751, 4544, TO_DATE('09/02/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/02/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 68.88);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(752, 4544, TO_DATE('21/10/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/10/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 44.22);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(753, 4544, TO_DATE('17/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 27.59);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(754, 4544, TO_DATE('01/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('01/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 31.88);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(755, 4544, TO_DATE('26/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 97.55);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(756, 4544, TO_DATE('19/10/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/10/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 58.82);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(757, 4544, TO_DATE('13/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('13/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 32.42);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(758, 4544, TO_DATE('09/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 26.85);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(759, 4544, TO_DATE('10/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 58.20);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(164, 4544, TO_DATE('06/11/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/11/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 164', 3);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(154, 'Intervento simulato 154', 'RIUSCITO', TO_DATE('10/11/2013', 'DD/MM/YYYY'), 164);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 154);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 154);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(165, 4544, TO_DATE('19/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('19/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 165', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(155, 'Intervento simulato 155', 'RIUSCITO', TO_DATE('29/01/2014', 'DD/MM/YYYY'), 165);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 155);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 155);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 155);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(166, 4544, TO_DATE('28/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 166', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(156, 'Intervento simulato 156', 'RIUSCITO', TO_DATE('07/02/2014', 'DD/MM/YYYY'), 166);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 156);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 156);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 156);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(167, 4544, TO_DATE('27/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('27/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 167', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(157, 'Intervento simulato 157', 'FALLITO', TO_DATE('28/06/2014', 'DD/MM/YYYY'), 167);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 157);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 157);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 157);
UPDATE Sensori SET stato = 'DISATTIVO' WHERE codice = 4544;
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (19, 4544);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4545, 'ATTIVO', TO_DATE('29/10/2013', 'DD/MM/YYYY'), 'RADIAZIONI', TO_DATE('29/10/2013', 'DD/MM/YYYY'),
-2.228140, -145.484179, 445.62);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(760, 4545, TO_DATE('28/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 123.52);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(761, 4545, TO_DATE('09/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 117.02);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(762, 4545, TO_DATE('29/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 128.76);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(763, 4545, TO_DATE('07/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('07/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 135.76);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(764, 4545, TO_DATE('08/12/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('08/12/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 142.29);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(765, 4545, TO_DATE('24/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('24/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 9.25);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(766, 4545, TO_DATE('26/03/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/03/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 100.24);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(767, 4545, TO_DATE('11/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('11/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 43.46);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(768, 4545, TO_DATE('25/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 141.65);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(769, 4545, TO_DATE('09/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('09/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 195.94);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(168, 4545, TO_DATE('28/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('28/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 168', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(158, 'Intervento simulato 158', 'RIUSCITO', TO_DATE('29/01/2014', 'DD/MM/YYYY'), 168);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 158);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 158);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 158);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(169, 4545, TO_DATE('20/11/2013', 'DD/MM/YYYY'),
TO_TIMESTAMP('20/11/2013 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 169', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(159, 'Intervento simulato 159', 'RIUSCITO', TO_DATE('22/11/2013', 'DD/MM/YYYY'), 169);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 159);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 159);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(170, 4545, TO_DATE('14/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 170', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(160, 'Intervento simulato 160', 'RIUSCITO', TO_DATE('16/01/2014', 'DD/MM/YYYY'), 170);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 160);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 160);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (19, 4545);
INSERT INTO Sensori (codice, stato, data_installazione, tipologia, data_ultimo_controllo, longitudine, latitudine, altitudine) VALUES
(4546, 'ATTIVO', TO_DATE('07/11/2013', 'DD/MM/YYYY'), 'TEMPERATURA', TO_DATE('07/11/2013', 'DD/MM/YYYY'),
13.242211, 70.621073, 165.78);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(770, 4546, TO_DATE('10/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('10/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -10.99);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(771, 4546, TO_DATE('03/06/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/06/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -167.96);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(772, 4546, TO_DATE('29/03/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('29/03/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -103.36);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(773, 4546, TO_DATE('31/05/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('31/05/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -88.07);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(774, 4546, TO_DATE('25/02/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('25/02/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 10.60);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(775, 4546, TO_DATE('03/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('03/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -133.99);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(776, 4546, TO_DATE('02/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('02/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 122.95);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(777, 4546, TO_DATE('17/03/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/03/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -17.34);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(778, 4546, TO_DATE('06/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('06/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -86.67);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(779, 4546, TO_DATE('30/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('30/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 17.37);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(780, 4546, TO_DATE('17/02/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('17/02/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 64.48);
INSERT INTO Rilevazioni (codice, sensore, data, ora, valore) VALUES
(781, 4546, TO_DATE('15/02/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('15/02/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), -36.42);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(171, 4546, TO_DATE('21/01/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('21/01/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 171', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(161, 'Intervento simulato 161', 'RIUSCITO', TO_DATE('31/01/2014', 'DD/MM/YYYY'), 171);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (9, 161);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (6, 161);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(172, 4546, TO_DATE('14/07/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('14/07/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 172', 2);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(162, 'Intervento simulato 162', 'RIUSCITO', TO_DATE('15/07/2014', 'DD/MM/YYYY'), 172);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 162);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (8, 162);
INSERT INTO Anomalie (codice, sensore, data, ora, causa, livello_priorita) VALUES
(173, 4546, TO_DATE('26/04/2014', 'DD/MM/YYYY'),
TO_TIMESTAMP('26/04/2014 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Problema simulato 173', 1);
INSERT INTO Interventi (codice, descrizione, esito, data_intervento, anomalia) VALUES
(163, 'Intervento simulato 163', 'RIUSCITO', TO_DATE('06/05/2014', 'DD/MM/YYYY'), 173);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (7, 163);
INSERT INTO Coinvolgimenti (equipaggio, intervento) VALUES (10, 163);
INSERT INTO Impiego_Sensori (missione, sensore) VALUES (19, 4546);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('COMANDANTE', 19, 6);
INSERT INTO Partecipazioni (ruolo, missione, membro) VALUES ('INGEGNERE', 19, 10);