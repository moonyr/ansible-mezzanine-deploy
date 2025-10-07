#!/bin/bash
set -e  # stoppe le script dès qu'une commande échoue

# Vérification qu'un argument est fourni
if [ $# -ne 1 ]; then
    echo "Usage: $0 <nom_du_playbook.yml>"
    exit 1;
fi

PLAYBOOK="$1"

# Vérification que le fichier existe
if [ ! -f "$PLAYBOOK" ]; then
    echo "Le fichier '$PLAYBOOK' n'existe pas."
    exit 1;
fi

echo "🔍 Vérification syntaxe Ansible..."
ansible-playbook --syntax-check "$PLAYBOOK"

echo "🧹 Vérification bonnes pratiques Ansible..."
ansible-lint "$PLAYBOOK"

echo "📑 Vérification syntaxe YAML..."
yamllint "$PLAYBOOK"

echo "✅ Toutes les vérifications sont passées avec succès."

