##!/usr/bin/zsh
##Aller dans les dossiers traités
cd ./../../ppe1/classification/ann



ANNEE=$1
MOIS=$2
NB=$3


classement=$(cat ./$ANNEE/$MOIS/* | grep Location | cut -f 3 | sort | uniq -c | sort -nr | head -n $NB) 

echo "Les $NB lieux les plus cités sont : 
$classement"