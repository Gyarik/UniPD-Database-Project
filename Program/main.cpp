#include <iostream>
#include "dependencies/include/libpq-fe.h"

using namespace std;

PGconn* tryConn(const char* host, const char* user, const char* db, const char* pass, const char* port);
void checkResults(PGresult* res, const PGconn* conn);

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

    int tuples = PQntuples(res);
    int fields = PQnfields(res);

    for(int i=0; i<fields; i++)
        cout << PQfname(res, i) << "\t\t";
    cout << endl;

    for(int i=0; i<tuples; i++) {
        for(int j=0; j<fields; j++)
            cout << PQgetvalue(res, i, j) << "\t\t";
        cout << endl;
    }

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