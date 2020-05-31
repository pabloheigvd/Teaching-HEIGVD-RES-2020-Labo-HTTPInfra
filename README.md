# HTTP Infrastructure

```
Author : Sacha Perdrizat, Pablo Mercado
```

## Step 5: Dynamic reverse proxy configuration

Notre reverse proxy est actuellement configuré avec des adresses statique, ce qui signifie que les adresses doivent être manuellement inscrite sur notre fichier de configuration, cette tâche se doit d'être automatisé.

### Variables d'environnement à l'exécution
Nous pouvons utiliser des variable d'environnement que l'on va transférer à notre container et qui existerons toute la vie du container. Ces variables sont nommées: ```HTTP_STATIC``` et ```HTTP_DYNAMIQUE```.

### Configuration dynamique via script PHP

Pour inscrire les adresses dans notre fichier de configuration, nous allons utiliser un script PHP qui va se lancer lors de l'exécution du 3<sup>ème</sup> script (c.f. **Démonstration**).

```php
<VirtualHost *:80> 

  <?php
    $ip_static = getenv('HTTP_STATIC');
    $ip_dynamique = getenv('HTTP_DYNAMIQUE');
  ?>

  ServerName sacha.site.com

  # dynamic host
  ProxyPass "/persons/" "http://<?php print $ip_dynamique ?>/"
  ProxyPassReverse "/persons/" "http://<?php print $ip_dynamique ?>/"

  # static host
  ProxyPass "/" "http://<?php print $ip_static ?>/"
  ProxyPassReverse "/" "http://<?php print $ip_static ?>/"

</VirtualHost>
```

### Acceptation des paramètres d'environnement

Dans le fichier ```buildAndrun.sh```, on piocher les adresses IP des containers intéressant en exécution via:

```shell
ip_Static=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $staticContainerName)
ip_Dynamic=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $dynamicContainerName)

docker run -d -e HTTP_STATIC=${ip_Static}:80 -e HTTP_DYNAMIQUE=${ip_Dynamic}:3000 -p 8080:80 --name $containerName $imageName
```

### Démonstration

Soit on va dans les répertoires ```/stepX``` et lance individuellement les scripts ```buildAndRun.sh```. correspondants. Un navigateur va apparaître et afficher le contenu statique et dynamique à la fin du 3<sup>ème</sup> script. 

