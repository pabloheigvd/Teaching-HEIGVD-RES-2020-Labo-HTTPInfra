# HTTP Infrastructure

```
Author : Sacha Perdrizat, Pablo Mercado
```

## Step 5: Dynamic reverse proxy configuration

Notre reverse proxy est actuellement configuré avec des adresses statique, ce qui signifie que les adresses doivent être manuellement inscrite sur notre fichier de configuration, cette tâche se doit d'être automatisé.

### Variables d'environnement à l'exécution
Nous pouvons utiliser des variable d'environnement que l'on va transférer à notre container et qui existerons toute la vie du container durant.

### script PHP

Pour générer les adresses dans notre fichier de configuration nous allons utiliser un script PHP ainsi (simple d'utilisation et déjà disponible sur notre container).
