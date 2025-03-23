# Utiliser une image de base de Python
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier server.py du répertoire local vers le conteneur
COPY app/server.py /app/


# Exposer le port 8000
EXPOSE 8000

# Lancer le serveur Python
CMD ["python", "/app/server.py"]
