#!/usr/bin/env bash

##### Pourquoi ne pas utiliser cat ?
##### Quand on a besoin des arguments de la commande, il faut utiliser `read`. 


if [ $# -ne 1 ]
then 
    echo "ce programme demande un argument"
    exit
else
    if [ -f $1 ]
    then
    echo "on a bien un fichier"
    else
        echo "on a pas de fichier"
        exit
    fi
fi


fichier_urls=$1
ligne=0
while read -r line
##### rend la valeur demandé par 'read' à la variable 'line' (pas besoin de '$' pour 'line')
do
    ligne=$( expr $ligne + 1 )
    ####besoin de espace entre `+` et `1`; à côté de `+`
    echo -e "$ligne\t$line"
    ##pour accepter `-t` pour tabulation, besoin de `-e` (option)
    ###besoin de `""` pour adjuster `-e`
done < $fichier_urls

