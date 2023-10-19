##!/usr/bin/zsh
cd ./../../../ppe1/classification/ann

if [[ $1 =~ 201[678] && $2 =~ 0[1-9]|1[012] && $3 -ge 1 ]]
###séparer les différentes conditions avec '&&'
###n'oublie pas '-' pour les conditions sur les entiers
then
    ANNEE=$1
    MOIS=$2
    NB=$3
    classement=$(cat ./$ANNEE/$MOIS/* | grep Location | cut -f 3 | sort | uniq -c | sort -nr | head -n $NB) 

    echo "Les $NB lieux les plus cités sont : 
$classement"
else
    echo "erreur, fin du programme"
fi