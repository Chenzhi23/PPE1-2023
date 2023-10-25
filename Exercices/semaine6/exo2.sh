#!/usr/bin/env bash

if [ $# -ne 1 ]
then 
    echo "ce programme demande un argument"
else
    if [ -f $1 ]
    then 
        echo "on a un fichier"
    else
        echo "on a pas de fichier"
        exit
    fi
fi



fichier_urls=$1
ligne=0
while read -r line
do
    ligne=$( expr $ligne + 1 )
    ####besoin de espace entre `+` et `1`; à côté de `+`
    code=$(curl -Ils $line | grep -e "^HTTP/" | grep -Eo "[0-9]{3}")
    charset=$(curl -I -s $line | grep -e "charset" | grep -Eo "UTF-[0-9]{1,2}|ISO-8859-[0-9]{1,2}")
    echo -e "$ligne\t$line\t$code\t$charset"
done < $fichier_urls