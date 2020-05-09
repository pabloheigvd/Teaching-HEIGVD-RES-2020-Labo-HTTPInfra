# specify the node base image with your desired version node:<version>
FROM node:10
# https://github.com/nodejs/docker-node/blob/master/README.md#how-to-use-this-image

# copie du site web template contenu dans le dossier 'content' dans l'image
COPY src opt/app

# execute le script index.js avec la commande node après avoir cree l'image
CMD ["node", "/opt/app/index.js"]
