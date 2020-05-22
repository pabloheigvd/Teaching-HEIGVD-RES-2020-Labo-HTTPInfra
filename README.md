# HTTP Infrastructure

```
Author : Sacha Perdrizat, Pablo Mercado
```

## Step 3 : Static reverse proxy


Maintenant que nous disposons de deux container nous servant respectivement des fichiers statiques et des données JSON dynamique, nous allons utiliser un reverse proxy pour rediriger les requête dans l'optique d'avoir un seul serveur centra qui va rediriger les requêtes vers les bon container en s'appuyant sur les entête de la requêtes HTTP qu'il va recevoir.


**Je préciser que pour cette partie j'ai un peu modifié les images docker, désormais les fichiers source seront copié dans le container lors de la création de l'image ce qui évitera de spécifier un répertoire à jumeler au lancement.**


### 1. Configuration du reverse proxy avec apache

Apache pouvant faire office de reverse proxy nous allons préparer un nouveau container apache spécialement

```Dockerfile
# A Dockerfile for our reverse proxy
FROM php:7.2-apache

RUN apt-get update -y && apt-get install -y vim

COPY conf/ /etc/apache2

RUN a2enmod proxy proxy_http && service apache2 restart

RUN a2ensite 000-* 001-*
```

Nous lui copions la configuration que voici.

**Attention les addresses ip des container devront être adaptées**

```conf
<VirtualHost *:80>

  ServerName sacha.site.com

  # dynamic host
  ProxyPass "/persons/" "http://172.17.0.2:3000/"
  ProxyPassReverse "/persons/" "http://172.17.0.2:3000/"

  # static host
  ProxyPass "/" "http://172.17.0.4/"
  ProxyPassReverse "/" "http://172.17.0.4/"

</VirtualHost>
```
Pour tester cette configuration après avoir lancé nos containers nous pouvons utiliser la console et ``netcat``

```bash
# notre reverse proxy est publié sur la machine hôte via le port 8080
$ nc -C localhost 8080
GET / HTTP/1.1
HOST: sacha.site.com
# second retour à la ligne ici
# il nous suivra la réponse du serveur statique

# Maintenant pour le serveur dynamique
$ nc -C localhost 8080
GET /persons HTTP/1.1
HOST: sacha.site.com
# second retour à la ligne ici
# il nous suivra la réponse du serveur dynamique soit le fichier JSON avec les personnes

```
