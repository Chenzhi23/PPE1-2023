##!/usr/bin/zsh
##Aller dans les dossiers traités
cd ./../../../ppe1/classification/ann

if [[ $1 =~ 201[678] && $2 =~ Location|Date|Hour|Organisation|Person|Product ]]
then
    ANNEE=$1
    ENTITE=$2
    nombre=$(cat ./$ANNEE/*/* | grep $ENTITE | wc -l)
    echo "Le nombre de $ENTITE en $ANNEE est de $nombre."
else
    echo "erreur, fin du programme."
fi