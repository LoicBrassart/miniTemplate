#!/bin/bash

LOG_FILE="/home/wns_student/apps/hooksTriggers.log"
if [ ! -f "$LOG_FILE" ]; then
  touch $LOG_FILE
  chown wns_student:wns_student $LOG_FILE
fi
# Vérification des arguments
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: hooksTriggers.sh <repository.name> <repository.ref> (got $1 / $2)" >> $LOG_FILE
  exit 1
fi

REPO_NAME=$1
REPO_REF=$2

if [ ! -d "$REPO_NAME" ]; then
  echo "$REPO_NAME: Cette app n'existe pas" >> $LOG_FILE
  exit 2
fi

# Exécution des commandes sous l'utilisateur wns_student avec redirection globale des logs
su - wns_student << EOF >> $LOG_FILE 2>&1
  if [ "$REPO_REF" == "refs/heads/dev" ]; then
    echo "$REPO_NAME: Déploiement automatisé de la branche dev..."
    cd $REPO_NAME/dev && git pull && make dev
    echo "  Done."
  elif [ "$REPO_REF" == "refs/heads/staging" ]; then
    echo "$REPO_NAME: Déploiement automatisé de la branche staging..."
    cd $REPO_NAME/staging
    echo "  TODO: deploy staging"
    echo "  Done."
  elif [ "$REPO_REF" == "refs/heads/main" ]; then
    echo "$REPO_NAME: Déploiement automatisé de la branche main..."
    cd $REPO_NAME/main
    echo "  TODO: deploy main"
    echo "  Done."
  else
    echo "$REPO_NAME: Aucune action définie pour la branche $REPO_REF"
  fi
EOF