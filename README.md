# Progetto Database UniPD A.A. 2021-22
Se vedete robe brutte è perché dobbiamo far felice il professore &#128128;&#128684;
## Compilazione
A giudicare dai progetti dell'anno scorso il programma dovrebbe funzionare per Windows (🤢) quindi per ora lo faccio funzionare solo per quello.

Requisiti:  
- GCC
- PostgreSQL 14  

Il bin di PostgreSQL contiene già le librerie e i dll necessari per far funzionare libpq.  
Nella cartella `Program` deve essere inclusa la cartella `dependencies` con all'interno altre due cartelle, `include` e `lib`.  
In `include` devono essere presenti `libpq-fe.h`, `pg_config_ext.h` e `postgres_ext.h`, mentre in `lib` devono esserci `libpq.dll` e `libpq.lib` (tutte le risorse menzionate possono essere trovate nella cartella di installazione di PostgreSQL).

Comando per la compilazione:
```
g++ main.cpp -L dependencies\lib -lpq -o program
```
Comando per l'esecuzione:
```
.\program [HOST] [USERNAME] [DBNAME] [PASSWORD] [PORT]
``` 

![]([[[https://www.google.com/url?sa=i&url=https%3A%2F%2Ftenor.com%2Fview%2Fi-love-lean-meme-lean-cat-loves-lean-purple-drank-gif-24893809&psig=AOvVaw387dVZGavSXABxGv5hfvRp&ust=1653231930339000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOCk9oHv8PcCFQAAAAAdAAAAABAD](https://tenor.com/view/i-love-lean-meme-lean-cat-loves-lean-purple-drank-gif-24893809)](https://tenor.com/view/i-love-lean-meme-lean-cat-loves-lean-purple-drank-gif-24893809)](https://github.com/Gyarik/UniPD-Database-Project/blob/master/i-love-lean-meme-lean.gif))
