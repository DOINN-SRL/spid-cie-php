# Installazione

### Create SPID Docker Network
```bash
docker network create spid-cie-php-network
```

### Create .env file
```bash
nano .env
```
Ed inserire il contenuto

### Build & Run with docker compose
```bash
docker compose -d --build
```

### Enter in the container
```bash
docker exec -it <container> bash
```

### Initialize first configuration
```bash
composer install
```
E seguire i passaggi mostrati a terminale


# Update
### Enter in the container
```bash
docker exec -it <container> bash
```

### Re-Generate files
```bash
composer cert-uninstall
```
```bash
composer install
```

# Note

### Sessione
Nell'env file bisogna indicare la tipologia di store per le sessioni di login spid, di default è *phpsession*, l'alternativa consigliata è *sql* che salva le sessioni su db. A questo punto bisogna settare sull'env il dsn (la stringa di connessione), lo username e la password del db. 

NB: se si utilizza postgres o mysql, controllare che siano installate le estensioni necessarie dentro il container php. Dunque aprire il file Dockerfile-php e controllare che pgsql o mysql siano correttamenti configurati.
Se il database si trova nello stesso server di questo servizio SPID e se si trova dentro un container docker, con la docker network creata nel primo passaggio è sufficiente usare il nome del container come host (a sua volta anche nel docker-compose.yml del database deve essere indicata la rete esterna spid-cie-php-network). Altrimenti utilizzare l'indirizzo ip del server che hosta il database.


### Public files
I file pubblici vengono generati nella cartella *./public*. 
Pertanto se si decide di cambiare percorso, fare attenzione e cambiare anche tutte le referenze *./public* nel codice. 


### Redirect
Rispetto al recirect POST definito dal parametro *redirect_uri* configurato nel file *spid-php-setup.json* è necessario creare sul proprio backend di riferimento anche l'endpoint POST *<redirect_uri>-error*, utilizzato durante i casi di errore.
