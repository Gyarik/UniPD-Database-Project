#include <iostream>
#include "dependencies/include/libpq-fe.h"

using namespace std;

PGconn* tryConn(const char* host, const char* user, const char* db, const char* pass, const char* port);
PGresult* paramExec(PGconn* conn, string queries[], int input);
void checkResults(PGresult* res, const PGconn* conn);
void separateLines(int fields, int* maxLen);
void prettyPrint(PGresult* res);

int main(int argc, char* argv[]) {
    if(argc < 6) {
        cout << "Devono esserci almeno 6 argomenti!";
        exit(1);
    }

    PGconn* conn = tryConn(argv[1], argv[2], argv[3], argv[4], argv[5]);
    PGresult* res = nullptr;
    int input;

    string queries[6] = {

        "SELECT COUNT(*) as moduli, dipendente.id_dip, cognome, nome, citta, provincia \
         FROM assegnazione JOIN dipendente ON assegnazione.id_dip = dipendente.id_dip \
		 JOIN sede ON dipendente.id_sede = sede.id_sede \
         WHERE provincia = $1::varchar \
         GROUP BY dipendente.id_dip, cognome, nome, citta, provincia \
         ORDER BY moduli DESC;",

        "SELECT COUNT (*) as Contratti, S.id_sede, C.data_firma \
         FROM Contratto as C JOIN Dipendente as D ON C.id_dip = D.id_dip \
         JOIN Sede as S ON D.id_sede = S.id_sede \
         GROUP BY S.id_sede, C.data_firma \
         HAVING C.data_firma < $1::date;",

        "SELECT d.tipologia, -1* ROUND(AVG(t.saldo), 2) AS \"Stipendio medio per ruolo\" \
         FROM Dipendente as d JOIN Retribuzioni as r ON d.id_dip = r.id_dip \
         JOIN Transazione as t ON t.id_trz = r.id_trz \
         GROUP BY d.tipologia;",

        "SELECT v.esito , d.id_dip, d.nome, d.cognome \
         FROM Dipendente as d JOIN Valutazione as v ON d.id_dip = v.id_dip \
         GROUP BY v.esito, d.id_dip, d.nome, d.cognome \
         HAVING v.esito = 'FALSE' AND COUNT(d.id_dip) > 3 \
         UNION \
         SELECT v.esito, d.id_dip, d.nome, d.cognome \
         FROM Dipendente as d JOIN Valutazione as v ON d.id_dip = v.id_dip \
         GROUP BY v.esito,d.id_dip, d.nome, d.cognome \
         HAVING v.esito = 'TRUE' AND COUNT(d.id_dip) > 1;",

        "DROP VIEW IF EXISTS stipendi_uscite; \
         DROP VIEW IF EXISTS max_stipendio_per_sede; \
         CREATE VIEW max_stipendio_per_sede as \
         SELECT t.id_sede, MIN(t.saldo) as massimo_saldo \
         FROM Transazione as t JOIN Retribuzioni as r ON t.id_trz = r.id_trz \
         GROUP BY t.id_sede, t.tipo_trz \
	     HAVING t.tipo_trz = 'Stipendio'; \
         CREATE VIEW stipendi_uscite as \
         SELECT t.id_sede, s.via, s.citta, SUM(t.saldo) as Uscite_Totali, -1* ms.massimo_saldo as Stipendio_Massimo \
         FROM max_stipendio_per_sede as ms JOIN Transazione as t ON ms.id_sede = t.id_sede \
         JOIN Sede as s ON s.id_sede = t.id_sede \
         GROUP BY t.id_sede, s.via, s.citta, t.tipo_trz, ms.massimo_saldo \
	     HAVING t.tipo_trz = 'Uscita' \
	     ORDER BY SUM(t.saldo); \
         SELECT * FROM stipendi_uscite;",

        "SELECT p.nome_prog, a.id_modulo, COUNT(*) as numero_dip \
         FROM Progetto as p JOIN Modulo as m ON p.id_prog = m.id_prog \
         JOIN Assegnazione as a ON a.id_modulo = m.id_modulo \
         GROUP BY p.nome_prog, a.id_modulo \
         HAVING COUNT(*) >= $1::integer;"

    };

    do {
        cout << "[1] Conta i moduli assegnati a tutti i dipendenti di una provincia" << endl;
        cout << "[2] Conta i contratti firmati in tutte le sedi prima di una certa data" << endl;
        cout << "[3] Calcola lo stipendio medio per categoria di dipendente" << endl;
        cout << "[4] Stampa nome e cognome dei dipendenti che hanno valutato positivamente piu di un progetto o negativamente piu di tre" << endl;
        cout << "[5] Classifica delle sedi che hanno le uscite maggiori" << endl;
        cout << "[6] Nomi dei progetti e moduli in cui vi lavorano almeno N dipendenti" << endl;
        cout << "[7] Esci" << endl;
        cout << "Seleziona l'opzione: ";
        cin >> input;

        switch(input) {
            case 1:
                cout << "Parametro = Provincia" << endl;
                res = paramExec(conn, queries, input);
                checkResults(res, conn);
                prettyPrint(res);
                PQclear(res);
                break;
            case 2:
                cout << "Parametro = Data (Formato: AAAA-MM-GG)" << endl;
                res = paramExec(conn, queries, input);
                checkResults(res, conn);
                prettyPrint(res);
                PQclear(res);
                break;
            case 3:
                res = PQexec(conn, queries[input-1].c_str());
                checkResults(res, conn);
                prettyPrint(res);
                PQclear(res);
                break;
            case 4:
                res = PQexec(conn, queries[input-1].c_str());
                checkResults(res, conn);
                prettyPrint(res);
                PQclear(res);
                break;
            case 5:
                res = PQexec(conn, queries[input-1].c_str());
                checkResults(res, conn);
                prettyPrint(res);
                PQclear(res);
                break;
            case 6:
                cout << "Parametro = N dipendenti" << endl;
                res = paramExec(conn, queries, input);
                checkResults(res, conn);
                prettyPrint(res);
                PQclear(res);
                break;
            case 7:
                break;
            default:
                cout << "Errore di input!" << endl;
                break;
        }

    } while(input != 7);

    PQfinish(conn);

    return 0;
}

PGconn* tryConn(const char* host, const char* user, const char* db, const char* pass, const char* port) {
    char conninfo[256];
    sprintf(conninfo, "host=%s user=%s dbname=%s password=%s port=%d",
            host, user, db, pass, atoi(port));

    PGconn* conn = PQconnectdb(conninfo);

    if(PQstatus(conn) != CONNECTION_OK) {
        cout << "Errore: " << PQerrorMessage(conn);
        PQfinish(conn);
        exit(1);
    }

    cout << "Connessione avvenuta con successo" << endl;

    return conn;
}

PGresult* paramExec(PGconn* conn, string queries[], int input) {
    PGresult* stmt = PQprepare(conn, "queryParam" + input, queries[input-1].c_str(), 1, NULL);
    string parametro;
    cout << "Inserire il parametro: ";
    cin >> parametro;
    const char* param = parametro.c_str();
    return PQexecPrepared(conn, "queryParam" + input, 1, &param, NULL, 0, 0);
}

void checkResults(PGresult* res, const PGconn* conn) {
    if(PQresultStatus(res) != PGRES_TUPLES_OK) {
        cout << "Inconsistent results!" << PQerrorMessage(conn) << endl;
        PQclear(res);
        exit(1);
    }
}

void separateLines(int fields, int* maxLen) {
    for(int i=0; i<fields; i++) {
        cout << '+';
        for(int j=0; j<maxLen[i]+2; j++)
            cout << '-';
    }
    cout << '+' << endl;
}

void prettyPrint(PGresult* res) {
    // n. tuple
    int tuples = PQntuples(res);
    // n. campi
    int fields = PQnfields(res);
    // array di supporto per salvare le colonne della query
    string query[tuples + 1][fields];

    for(int i=0; i<fields; i++)
        query[0][i] = PQfname(res, i);

    for(int i=0; i<tuples; i++) {
        for(int j=0; j<fields; j++)
            query[i+1][j] = PQgetvalue(res, i, j);
    }

    // Trova l'elemento piu' lungo per ogni colonna
    int maxLen[fields];
    for(int i=0; i<fields; i++) {
        maxLen[i] = 0;
        for(int j=0; j<tuples+1; j++) {
            int size = query[j][i].size();
            maxLen[i] = size > maxLen[i] ? size : maxLen[i];
        }
    }

    // Stampa il risultato della query
    separateLines(fields, maxLen);
    for(int i=0; i<fields; i++) {
        cout << "| ";
        cout << query[0][i];
        for(int j=0; j<maxLen[i]-query[0][i].size()+1; j++)
            cout << ' ';
        if(i == fields-1)
            cout << '|';
    }
    cout << endl;
    separateLines(fields, maxLen);
    for(int i=1; i<tuples+1; i++) {
        for(int j=0; j<fields; j++) {
            cout << "| ";
            cout << query[i][j];
            for(int k=0; k<maxLen[j]-query[i][j].size()+1; k++)
                cout << ' ';
            if(j == fields-1)
                cout << '|';
        }
        cout << endl;
    }
    separateLines(fields, maxLen);
}