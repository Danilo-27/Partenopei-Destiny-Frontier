# Progetto di Basi di Dati: Agenzia Spaziale

## Descrizione del Progetto
Questo progetto è stato sviluppato come parte del corso di **Basi di Dati** presso l'Università degli Studi di Napoli Federico II (A.A. 2024/2025). L'obiettivo principale è stato la progettazione e implementazione di un database per la gestione delle missioni e delle operazioni di un'agenzia spaziale. Il sistema si concentra su diverse entità chiave, tra cui missioni, sensori, robot, anomalie, interventi e membri dell'equipaggio.

---

## Struttura del Progetto

### 1. Specifiche sui Dati
Il database gestisce le seguenti informazioni:
- **Missioni**: dettagli come data di inizio, data di fine, obiettivi e stato.
- **Membri dell'equipaggio**: dati personali, ruolo e codice identificativo.
- **Sensori**: posizione, tipologia, stato operativo, date di installazione e controllo.
- **Robot**: identificativo e tipologia.
- **Rilevazioni**: valori registrati dai sensori.
- **Anomalie**: eventi problematici generati dai sensori, con priorità e cause.
- **Interventi**: operazioni eseguite per risolvere anomalie.
- **Report**: descrizioni dello stato delle missioni.

### 2. Progettazione del Database
Il progetto include:
- **Progettazione Concettuale**: modello ER con associazioni molte-a-molte (es. partecipazione a missioni).
- **Progettazione Logica**: trasformazione degli schemi concettuali in relazioni.
- **Progettazione Fisica**: creazione di tabelle, vincoli, sequenze e indici per ottimizzare le performance.

### 3. Gestione del Progetto
- **Concorrenza**: protocollo di locking a due fasi (2PL) per garantire coerenza.
- **Affidabilità**: utilizzo di log, checkpoint e configurazioni RAID 5 per sicurezza e ripristino.

### 4. Operazioni sulla Base Dati
- **Query**: interrogazioni per estrarre informazioni sulle missioni, anomalie e sensori.
- **Viste**: rappresentazioni aggregate e filtrate dei dati.
- **Trigger**: automazione per aggiornamenti e gestione degli stati.
- **Stored Procedure**: funzioni avanzate per analisi e gestione (es. analisi dell'efficienza dei membri).

### 5. Sicurezza
- Ruoli definiti per utenti:
  - **DBA**: gestione completa.
  - **Supervisor**: controllo operativo e accesso esteso.
  - **Membri dell'equipaggio**: accesso limitato tramite web-app.
  - **Data Analyst**: permessi di sola lettura per l'analisi.

### 6. Web Application
L'applicazione web, sviluppata con Oracle APEX, offre:
- **Pagine interattive**: login, dashboard, visualizzazione missioni, anomalie, interventi e report.
- **Modello 3D**: rappresentazione spaziale della Luna con sensori interattivi.

### 7. Clustering dei Dati
Analisi avanzata per identificare gruppi di membri in base a:
- Tasso di successo.
- Efficienza operativa.
- Complessità delle operazioni.

L'implementazione utilizza Python, Pandas e KMeans per il clustering.

---

## Requisiti
- **Database**: Oracle Database.
- **Linguaggi**: SQL, PL/SQL, Python.
- **Strumenti**: Oracle APEX, Oracle SQL Developer, Pandas, Scikit-learn.

## Autori
- **Danilo Cioffi** (N46007095)
- **Francesco Ardolino** (N46007168)
- **Paolo Altucci** (N46007260)

Università degli Studi di Napoli Federico II  
Corso di Laurea in Ingegneria Informatica

---

## Risorse
Per ulteriori dettagli, consulta la [documentazione completa](./Basi_di_Dati-4.pdf) inclusa nel repository.
