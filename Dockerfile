# # Utiliser une image Node officielle comme image de base
# FROM node:18

# # Définir le répertoire de travail dans le conteneur
# WORKDIR /app

# # Copier le fichier package.json et package-lock.json dans le répertoire de travail
# COPY package*.json ./

# # Supprimer node_modules s'il existe pour garantir une installation propre
# RUN rm -rf node_modules

# # Installer les dépendances de l'application, y compris bcrypt et @prisma/client
# RUN npm install

# # Copier le reste de l'application dans le répertoire de travail
# COPY . .

# # Copier le fichier .env
# COPY .env .

# # Télécharger docker-compose-wait
# ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
# RUN chmod +x /wait

# # Générer le client Prisma
# RUN npx prisma generate

# # Exposer le port sur lequel l'application sera accessible
# EXPOSE 3000

# # Commande pour démarrer l'application
# CMD /wait && npx prisma migrate deploy && npx prisma generate && node server.js

# Use Node.js version 16.13 (or a compatible version with Prisma)
FROM node:16.13

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy all application files into the container
COPY . .

# Expose the port used by the Node.js application
EXPOSE 4500

# Command to start the Node.js application
CMD ["npm", "start"]
