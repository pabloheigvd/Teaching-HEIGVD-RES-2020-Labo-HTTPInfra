FROM node:lts

COPY src/ /opt/app

WORKDIR /opt/app

# génère les dépendance à l'intérieur du container
RUN npm install

CMD ["node","index.js"]
