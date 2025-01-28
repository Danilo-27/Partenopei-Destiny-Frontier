import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import oracledb

# Funzione per connettersi al database
def connessione_db():
    try:
        connection = oracledb.connect(
            user="data_analyst", password="data_analyst", host="DaniloPC", port=1521, service_name="xepdb1"
        )
        return connection
    except oracledb.DatabaseError as e:
        print("Errore durante la connessione:", e)
        return None

# Funzione per ottenere i dati dal database
def get_data(connection):
    query = "SELECT * FROM ADMIN1.dati_membri"
    cursor = connection.cursor()
    cursor.execute(query)
    rows = cursor.fetchall()
    columns = [col[0] for col in cursor.description]
    return pd.DataFrame(rows, columns=columns)

# Analisi avanzata dei membri del team
def analisi_membri(df):
    analysis = pd.DataFrame({
        'CODICE_MEMBRO': df['CODICE_MEMBRO'],
        'Tasso_Successo': ((df['NUM_INTERVENTI_RIUSCITI'] / df['NUM_INTERVENTI']) * 100).round(2),
        'Efficienza': (df['NUM_INTERVENTI_RIUSCITI'] / df['MEDIA_DURATA_MISSIONI']).round(2),
        'Complessità_Score': (df['MEDIA_DURATA_MISSIONI'] * df['NUMERO_RUOLI']).round(2)
    })

    # Rimozione dei dati non validi
    analysis = analysis.dropna()
    analysis = analysis[~(analysis['Tasso_Successo'].isna()) & (analysis['Efficienza'] > 0)]

    # Normalizzazione dei dati
    scaler = StandardScaler()
    scaled_features = scaler.fit_transform(analysis[['Tasso_Successo', 'Efficienza', 'Complessità_Score']])
    
    kmeans = KMeans(n_clusters=3, random_state=42)
    analysis['Cluster'] = kmeans.fit_predict(scaled_features)

    return analysis, kmeans, scaled_features

# Esporta i risultati in un file CSV
def esporta_risultati_csv(analysis, filename="risultati_analisi.csv"):
    try:
        analysis.to_csv(filename, index=False)
        print(f"Risultati salvati con successo nel file {filename}")
    except Exception as e:
        print(f"Errore durante il salvataggio del file: {e}")


# Uso delle funzioni
connection = connessione_db()
if connection:
    df = get_data(connection)
    df = df.fillna(df.mean())
    analysis, kmeans, scaled_features = analisi_membri(df)
    esporta_risultati_csv(analysis)
    connection.close()
