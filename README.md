# HTTP Infrastructure

```
Author : Sacha Perdrizat, Pablo Mercado
```

## Step 1: Static HTTP server with apache httpd
Soit on a réalisé une démo qui nécessite d'exécuter un seul fichier script. Pour voir la démo, il faut se placer dans le répertoire après clonage et exécuter le script dans le terminal:

```bash
./step1.sh
```

Il met en place l'image Docker avec ce Dockerfile de configuration:

```dockerfile
FROM php:7.2-apache

COPY content/ /var/www/html/
```

ou l'on va télécharger l'image officielle d'un serveur apache. Le contenu du site que notre serveur va afficher est copié depuis le dossier ```content```.

Le script crée une image de nom ```res/apache_php``` et son container (que l'on va run) est nommé ```res-labo4-step1```  Il occupe le port ```80``` .

A ce point, vous devriez avoir un exemple de site web avec du contenu statique, concluant la démo.

Afin de montrer où sont situés les fichiers apache de configuration dans un container en cours d'exécution, on s'assure que la démo tourne toujours et on exécute les commandes suivantes **dans une autre fenêtre du terminal**:

```bash
docker exec -it res-labo4-step1 /bin/bash
```

Le fichier de configuration du serveur ```apache2.conf``` est situé dans ```/etc/apache2```. On le vérifie au moyen de la commande:

```bash
cat /etc/apache2/apache2.conf
```

