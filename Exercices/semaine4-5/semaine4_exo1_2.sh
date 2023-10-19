##!/usr/bin/zsh
##Aller dans les dossiers traités
cd ./../../../ppe1/classification/ann

if [[ $1 =~ Location|Date|Hour|Organisation|Person|Product ]]
####besoin de espaces entre [[]] et entre =~
then
    ENTITE=$1
    for ANNEE in 2016 2017 2018
    do
        nombre=$(cat ./$ANNEE/*/* | grep $ENTITE | wc -l)
        #####n'oublie pas '()' et '$' pour donner la valeur à nb
        echo "Le nombre de $ENTITE en $ANNEE est de $nombre."
    done
else
    echo "erreur, fin du programme."
fi
