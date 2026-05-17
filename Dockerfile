# 1. Image de base
FROM ubuntu:22.04

# 2. Répertoire de travail
WORKDIR /app

# 3. Copier les fichiers
COPY test.sh /app/

# 4. Permissions (si nécessaire) exécuté au build (ex: installer des packages)
RUN chmod +x /app/test.sh
RUN apt-get update && apt-get install -y shellcheck

# 5. Commande par défaut exécuté au démarrage du conteneur
CMD ["bash", "test.sh", "Docker User"]