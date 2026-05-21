# 1. Image de base
FROM python:3.11-slim

# 2. Répertoire de travail
WORKDIR /app

# 3. Copier les fichiers
COPY requirements.txt /app/

# 4. Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py /app/

EXPOSE 8080

# 5. Commande par défaut exécuté au démarrage du conteneur
CMD ["python", "app.py"]