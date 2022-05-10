#include <iostream>
#include "dependencies/include/libpq-fe.h"

using namespace std;

PGconn* tryConn(const char* host, const char* user, const char* db, const char* pass, const char* port);
void checkResults(PGresult* res, const PGconn* conn);
void dividePrint(int fields, int* maxLen);
void queryPrint(PGresult* res);

int main(int argc, char* argv[]) {
    if(argc < 6) {
        cout << "Devono esserci almeno 6 argomenti!";
        exit(1);
    }

    PGconn* conn = tryConn(argv[1], argv[2], argv[3], argv[4], argv[5]);

    // TODO: Placeholder code, will be replaced
    cout << "Query di esempio" << endl;

    PGresult* res = PQexec(conn, "SELECT * FROM progetto");
    checkResults(res, conn);

    // Print placeholder query
    queryPrint(res);

    PQclear(res);
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

void checkResults(PGresult* res, const PGconn* conn) {
    if(PQresultStatus(res) != PGRES_TUPLES_OK) {
        cout << "Inconsistent results!" << PQerrorMessage(conn) << endl;
        PQclear(res);
        exit(1);
    }
}

void dividePrint(int fields, int* maxLen) {
    for(int i=0; i<fields; i++) {
        cout << '+';
        for(int j=0; j<maxLen[i]+2; j++)
            cout << '-';
    }
    cout << '+' << endl;
}

void queryPrint(PGresult* res) {
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
    dividePrint(fields, maxLen);
    for(int i=0; i<fields; i++) {
        cout << "| ";
        cout << query[0][i];
        for(int j=0; j<maxLen[i]-query[0][i].size()+1; j++)
            cout << ' ';
        if(i == fields-1)
            cout << '|';
    }
    cout << endl;
    dividePrint(fields, maxLen);
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
    dividePrint(fields, maxLen);
}