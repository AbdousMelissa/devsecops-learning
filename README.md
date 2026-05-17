# DevSecOps Learning - Semaine 1

Apprentissage intensif DevSecOps. Ce repository contient les bases : Linux, Git, CI/CD et conteneurs Docker.

---

## 📁 Structure du projet

```
devsecops-learning/
├── test.sh                      # Script bash de test
├── Dockerfile                   # Conteneurisation du script
├── .github/workflows/
│   └── ci-devsecops.yml        # Pipeline CI/CD (GitHub Actions)
├── README.md                    # Documentation (ce fichier)
├── .gitignore                   # Fichiers à exclure du repo
└── .git/                        # Repository Git
```

---

## 🚀 Quick Start

### Prérequis

- Docker (version 20.10+)
- Git
- Bash (ou WSL sur Windows)

### 1️⃣ Cloner le repository

```bash
git clone https://github.com/votre-username/devsecops-learning.git
cd devsecops-learning
```

### 2️⃣ Builder l'image Docker localement

```bash
docker build -t devsecops:latest .
```

Explications :
- `-t devsecops:latest` : nomme l'image "devsecops" avec le tag "latest"
- `.` : utilise le Dockerfile du répertoire courant

### 3️⃣ Lancer un conteneur

**Option A : Mode simple (exécution unique)**
```bash
docker run --rm devsecops:latest
```

**Option B : Mode interactif (avec bash)**
```bash
docker run --rm -it devsecops:latest bash
```
Tapez `exit` pour quitter.

**Option C : Mode détaché (en arrière-plan)**
```bash
docker run -d --name monconteneur devsecops:latest bash -c "while true; do sleep 3600; done"
docker logs -f monconteneur
docker stop monconteneur
```

### 4️⃣ Inspecter et nettoyer

```bash
# Voir les images locales
docker images

# Voir les conteneurs (en cours)
docker ps

# Voir tous les conteneurs (y compris arrêtés)
docker ps -a

# Supprimer un conteneur
docker rm monconteneur

# Supprimer une image
docker rmi devsecops:latest
```

---

## 📋 Contenu des fichiers

### `test.sh`

Script bash simple qui :
- Accepte un paramètre (nom)
- Affiche le répertoire courant
- Cherche les fichiers `.txt`

**Utilisation locale :**
```bash
chmod +x test.sh
./test.sh "Mon Nom"
```

### `Dockerfile`

Conteneurisation du script avec :
- **Base** : `ubuntu:22.04`
- **Workdir** : `/app`
- **Installation** : ShellCheck pour linter les scripts bash
- **CMD** : Exécute `test.sh` avec le paramètre "Docker User"

**Anatomie du Dockerfile :**
```dockerfile
FROM ubuntu:22.04           # Image de base
WORKDIR /app                # Répertoire de travail dans le conteneur
COPY test.sh /app/          # Copier le script
RUN chmod +x /app/test.sh   # Permissions
RUN apt-get update && ...   # Installer ShellCheck
CMD ["bash", "test.sh", ...]# Commande au démarrage
```

### `.github/workflows/ci-devsecops.yml`

Pipeline CI/CD qui s'exécute à chaque `push` ou `pull_request` sur `main`.

**Jobs :**

1. **build** - Validation et tests basiques
   - Echo de test
   - Affichage de messages

2. **docker-build** - Construction de l'image Docker
   - Setup QEMU (multi-architecture)
   - Setup Buildx (builder amélioré)
   - Build de l'image `my-image-from-ci:latest`

3. (Optionnel) **docker-build-and-test** - Build + test du conteneur
   - Build l'image
   - Lance un conteneur
   - Exécute des tests de smoke tests
   - Nettoie après

---

## 🔧 Workflow CI/CD (GitHub Actions)

Le pipeline s'exécute automatiquement quand vous :
- Poussez vers `main` : `git push origin main`
- Créez une Pull Request sur `main`
- Lancez manuellement : Actions tab → Workflow → Run workflow

**Vous pouvez voir les résultats dans l'onglet Actions de votre repo GitHub.**

---

## 🛠️ Commandes Git essentielles

```bash
# Vérifier le statut
git status

# Ajouter les modifications
git add .

# Commiter
git commit -m "feat: add Dockerfile and README"

# Pousser vers GitHub
git push origin main

# Voir l'historique
git log --oneline
```

---

## 📚 Concepts Semaine 1

- **Linux** : Commandes de base, permissions, processus
- **Git** : Clone, commit, branch, push
- **CI/CD** : Pipeline automatisé, GitHub Actions
- **Docker** : Image, conteneur, Dockerfile, build/run

---

## 🎯 Prochaines étapes (Semaine 2+)

- [ ] Ajouter tests plus avancés (pytest, Jest)
- [ ] Implémenter ShellCheck dans le pipeline CI
- [ ] Ajouter Trivy (scanner de vulnérabilités)
- [ ] Pousser l'image vers Docker Hub / GitHub Container Registry
- [ ] Créer un workflow GitOps
- [ ] Ajouter Kubernetes (Minikube / Kind)

---

## 🔐 Sécurité basique

- Le `.gitignore` exclut les fichiers sensibles
- Aucun secret/password ne doit être commité
- Utiliser GitHub Secrets pour les credentials (Docker Hub, etc.)

---

## 📖 Ressources

- [Docker Docs](https://docs.docker.com/)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)

---

## ✅ Checklist de démarrage

- [ ] Cloner le repo
- [ ] Builder l'image : `docker build -t devsecops:latest .`
- [ ] Lancer un conteneur : `docker run --rm devsecops:latest`
- [ ] Vérifier les logs
- [ ] Pousser les modifications : `git push origin main`
- [ ] Vérifier le workflow dans Actions

---

**Auteur** : DevSecOps Learner  
**Date** : Mai 2026  
**Niveau** : Semaine 1 (Fondamentaux)
