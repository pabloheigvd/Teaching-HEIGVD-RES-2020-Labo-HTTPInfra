# HTTP Infrastructure

```
Author : Sacha Perdrizat, Pablo Mercado
```
## Step 2: Dynamic HTTP server with express.js

Nous allons maintenant implémenter un petit serveur HTTP avec nodejs

1. Regardons pour cela si une image existe déjà sur le dockerhub, il s'avère que c'est le cas ![](https://hub.docker.com/_/node/)

2. Créons à nouveau un dockerfile pour construire notre image, nous allons utiliser la dernière version stable de nodejs que nous pouvons atteindre via le TAG *lts*

```Dockerfile
# on va se baser sur la dernière image stable de nodeJS
FROM node:lts

# ici on détermine le repertoire de travail courant 
WORKDIR /opt/app

# cette commande sera lancé au démarrage de notre container
# elle va lancer le sript nommé index.js dans le repertoire courant
CMD ["node","./index.js"]
```

3. Maintenant créons notre petit programme NodeJs, nous allons commencer par initialiser un petit projet simple avec ``npm`` puis ensuite creer un petit serveur http à l'aide d'un framework javascript.

```bash

# on initialise le projet
$ npm init

# on install les package chance pour la génération de données aléatoire 
$ npm install --save chance

# on install expressJS pour l'implémentation simplifié d'un serveur HTTP
$ npm install --save express

```


```bash
# on lance notre container en jumelant les répertoire src
$ docker run -v $(pwd)/src:/opt/app res/http-dynamic-app

```


