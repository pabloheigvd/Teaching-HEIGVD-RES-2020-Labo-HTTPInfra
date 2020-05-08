# HTTP Infrastructure

```
Author : Sacha Perdrizat, Pablo Mercado
```

## Step 1: Static HTTP server with apache httpd
exécuter le script
```
./step1.sh
```

### exploration de l'image
obtenir le nom du container avec (disons NOM_C):
```
docker ps
```
On récupère l'adresse IP du contenair au champ IPAddress (ici 172.17.0.2)
```
docker inspect NOM_C
```
On vérifie que le serveur est correctement setup avec:

```
docker logs NOM_C
```

S'il n'y a qu'une erreur "Could not reliably determine the server's fully qualified domain name...", c'est que c'est ok.

<span style="color:red">nooo</span>

On tente de communiquer avec le serveur:

```
telnet 172.17.0.2 9090
```

Ici, j'ai une erreur...

On exécute ensuite

```
docker exec -it NOM_I /bin/bash
```
On se trouve dans var/www/html, on peut faire un ls et constater qu'il n'y a rien du tout.

On ouvre un navigateur et teste

## Step 2: Dynamic HTTP server with express.js

## Step 3: Reverse proxy with apache (static configuration)

## Step 4: AJAX requests with JQuery

## Step 5: Dynamic reverse proxy configuration

## Additional steps

