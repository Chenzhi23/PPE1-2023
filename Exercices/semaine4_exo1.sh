##!/usr/bin/zsh
##Aller dans les dossiers traités
cd ./../../ppe1/classification/ann


ANNEE=$1
ENTITE=$2
nombre=$(cat ./$ANNEE/*/* | grep $ENTITE | wc -l)

echo "Le nombre de $ENTITE en $ANNEE est de $nombre."
