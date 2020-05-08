# HTTP Infrastructure

```
Author : Sacha Perdrizat, Pablo Mercado
```
## Step 2: Dynamic HTTP server with express.js

Nous allons maintenant implémenter un petit serveur HTTP avec nodejs

1. Regardons pour cela si une image existe déjà sur le dockerhub, il s'avère que c'est le cas ![](https://hub.docker.com/_/node/)

2. Créons à nouveau un dockerfile pour construire notre image, nous allons utiliser la dernière version stable de nodejs que nous pouvons atteindre via le TAG lts

```dockerfile
FROM node:lts
```

3. 