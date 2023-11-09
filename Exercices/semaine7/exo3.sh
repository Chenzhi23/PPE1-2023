#!/usr/bin/env zsh

fichier=$1
nb=$2

if [ -z $2 ]
then 
    nb=25
fi

egrep -o "\w+" $fichier | tr '[[:upper:]]' '[[:lower:]]' > exo3_bigramme1.txt


paste exo3_bigramme1.txt <(tail -n +2 exo3_bigramme1.txt) > exo3_bigrammes2.txt


cat exo3_bigrammes2.txt | sort | uniq -c | sort -nr | head -n $nb > exo3_FrequenceBigrammes.txt
