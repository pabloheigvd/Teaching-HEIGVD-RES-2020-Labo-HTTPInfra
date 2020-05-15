### Dockerfile1
# telecharge une image officielle pour faire tourner notre site web de contenu statique
FROM php:7.2-apache

# copie du site web template contenu dans le dossier 'content' dans l'image
#COPY content/ /var/www/html/

### ajout
COPY conf /etc/apache2

### Dockerfile2
# specify the node base image with your desired version node:<version>

# copie du site web template contenu dans le dossier 'content' dans l'image
#COPY src opt/app

# execute le script index.js avec la commande node après avoir cree l'image
#CMD ["node", "/opt/app/index.js"]

### 3rd part

# attention, run sudo apt-get install apache2

RUN a2enmod proxy proxy_http

RUN a2ensite 000-* 001-*
