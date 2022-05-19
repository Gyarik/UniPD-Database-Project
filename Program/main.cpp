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
    string parametro;
    const char* param = nullptr;

    string queries[3] = {

        "SELECT COUNT(*) as moduli, dipendente.id_dip, cognome, nome, citta, provincia \
         FROM assegnazione JOIN dipendente ON assegnazione.id_dip = dipendente.id_dip \
		 JOIN sede ON dipendente.id_sede = sede.id_sede \
         WHERE provincia = $1::varchar \
         GROUP BY dipendente.id_dip, cognome, nome, citta, provincia \
         ORDER BY moduli DESC",

        "SELECT COUNT (*) as Contratti, S.id_sede, C.data_firma \
         FROM Contratto as C JOIN Dipendente as D ON C.id_dip = D.id_dip \
         JOIN Sede as S ON D.id_sede = S.id_sede \
         GROUP BY S.id_sede, C.data_firma \
         HAVING C.data_firma < $1::date",

        "SELECT * FROM progetto"
    };

    do {
        cout << "[1] Conta i moduli assegnati a tutti i dipendenti di una provincia" << endl;
        cout << "[2] Conta i contratti firmati in tutte le sedi prima di una certa data" << endl;
        cout << "[3] Test" << endl;
        cout << "[6] Esci" << endl;
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
            case 6:
                break;
            default:
                cout << "Errore di input!" << endl;
                break;
        }

    } while(input != 6);

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
    PGresult* stmt = PQprepare(conn, "queryParam", queries[input-1].c_str(), 1, NULL);
    string parametro;
    cout << "Inserire il parametro: ";
    cin >> parametro;
    const char* param = parametro.c_str();
    return PQexecPrepared(conn, "queryParam", 1, &param, NULL, 0, 0);
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