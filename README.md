# HTTP Infrastructure

```
Author : Sacha Perdrizat, Pablo Mercado
```

## Step 3 : Static reverse proxy


Maintenat que nous disposons de deux container nous servant respectivement des fichiers statiques et des données json dynamique, nous allons utiliser un reverse proxy pour rediriger les requête dans l'optique d'avoir un seul serveur centra qui va rediriger les requêtes vers les bon container en s'appuyant sur les entête de la requêtes HTTP qu'il va recevoir.


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

Nous lui copions la configuration que voici

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

