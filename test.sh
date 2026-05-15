#!/bin/bash
echo "Hi everyone!"
#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./script.sh <nom>"
  exit 1
fi

nom="$1"
echo "Bonjour, $nom !"
echo "Ton dossier courant est : $(pwd)"

for fichier in *.txt; do
  echo "Fichier trouvé : $fichier"
done
