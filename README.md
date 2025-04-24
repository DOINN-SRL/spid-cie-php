# Installazione

### Create SPID Docker Network
```bash
docker network create spid-cie-php-network
```
se invece si tratta di un ambiente di staging:
```bash
docker network create staging-spid-cie-php-network
```

### Create .env file
```bash
nano .env
```
Ed inserire il contenuto

### Build & Run with docker compose
```bash
docker compose -f docker-compose.prod.yml -d --build
```
se invece si tratta di un ambiente di staging:
```bash
docker compose -f docker-compose.staging.yml -d --build
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


### Deploy Multipli
Per come sono strutturati attualmente i file di configurazione di docker e degli script di setup della libreria spid-cie-php, non è possibile runnare sia i container di prod che di staging dallo stesso progetto (ovvero dallo stessa cartella contenente il codice). È necessario fare un'altro git clone creando così un'altra cartella e lanciare nella prima il docker-compose.prod.yml e nella seconda il docker-compose.staging.yml.
Se i due ambienti hanno endpoint di callback differenti (come probabilmente è), si avranno dunque due file di spid-php-setup.json differenti (e probabilmente due configurazioni diverse per la php-session dentro il file .env) 