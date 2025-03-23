# Serveur HTTP Minimaliste avec Docker

Ce projet met en place un serveur HTTP minimaliste en utilisant uniquement les bibliothèques standards de Python, le tout conteneurisé avec Docker.

## Structure du projet

```
basic-docker-project/
├── app/
│   ├── server.py
├── .github/
│   ├── workflows/
│   │   ├── docker-publish.yml
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## Prérequis

- Docker
- Docker Compose (optionnel)
- Compte DockerHub
- Compte GitHub (pour l'automatisation CI/CD)

## Exécution sans Docker Compose

1. Construire l'image Docker :
```bash
docker build -t simple-http-server .
```

2. Exécuter le conteneur :
```bash
docker run -p 8000:8000 simple-http-server
```

3. Accéder à l'application dans le navigateur à l'adresse : http://localhost:8000

## Exécution avec Docker Compose

1. Démarrer l'application :
```bash
docker-compose up
```

2. Accéder à l'application dans le navigateur à l'adresse : http://localhost:8000

## Arrêt de l'application

- Si vous utilisez Docker sans Docker Compose, appuyez sur `Ctrl+C` dans le terminal où le conteneur s'exécute.
- Si vous utilisez Docker Compose, exécutez :
```bash
docker-compose down
```

## Pousser l'image vers DockerHub

### 1. Création d'un compte DockerHub

Si vous n'avez pas déjà un compte, créez-en un sur [DockerHub](https://hub.docker.com/).

### 2. Connexion à DockerHub en ligne de commande

```bash
docker login
```

Entrez votre nom d'utilisateur et votre mot de passe lorsque vous y êtes invité.

### 3. Construction de l'image avec le tag approprié

Remplacez `votre-nom-utilisateur` par votre nom d'utilisateur DockerHub :

```bash
docker build -t votre-nom-utilisateur/simple-http-server:latest .
```

Vous pouvez aussi utiliser d'autres tags comme `v1.0` pour suivre les versions :

```bash
docker build -t votre-nom-utilisateur/simple-http-server:v1.0 .
```

### 4. Pousser l'image vers DockerHub

```bash
docker push votre-nom-utilisateur/simple-http-server:latest
```

Si vous avez utilisé d'autres tags :

```bash
docker push votre-nom-utilisateur/simple-http-server:v1.0
```

### 5. Vérification

Après avoir poussé l'image, vous pouvez la vérifier sur votre compte DockerHub. L'image peut maintenant être téléchargée depuis n'importe quel environnement avec Docker installé en utilisant :

```bash
docker pull votre-nom-utilisateur/simple-http-server:latest
```

## Automatisation CI/CD avec GitHub Actions

Ce projet inclut une automatisation qui construit et pousse l'image Docker vers DockerHub à chaque push sur la branche principale.

### Configuration des secrets GitHub

Pour que l'automatisation fonctionne, vous devez configurer deux secrets dans votre dépôt GitHub :

1. Accédez à votre dépôt GitHub
2. Cliquez sur "Settings" > "Secrets" > "New repository secret"
3. Ajoutez les secrets suivants :
   - `DOCKERHUB_USERNAME` : Votre nom d'utilisateur DockerHub
   - `DOCKERHUB_TOKEN` : Votre token d'accès DockerHub (à créer sur DockerHub dans Account Settings > Security > Access Tokens)

### Fonctionnement

Lorsque vous poussez du code sur la branche principale de votre dépôt GitHub :

1. GitHub Actions est déclenché
2. Le workflow se connecte à DockerHub en utilisant vos identifiants sécurisés
3. L'image Docker est construite
4. L'image est taguée et poussée vers DockerHub

### Récupération de l'image depuis DockerHub

Une fois que l'image est poussée sur DockerHub par le workflow CI/CD, vous pouvez la télécharger depuis n'importe quel environnement avec :

```bash
docker pull votre-nom-utilisateur/simple-http-server:latest
```

Pour exécuter l'image téléchargée :

```bash
docker run -p 8000:8000 votre-nom-utilisateur/simple-http-server:latest
```