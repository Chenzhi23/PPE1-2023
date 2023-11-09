#!/usr/bin/env zsh

fichier=$1
nb=$2

if [ -z $2 ]
then 
    nb=25
fi

if [ $# -eq 1 ]
then 
    echo "On a un argument."
else
    if [ $# -eq 2 ]
    then
        echo "On a deux arguments."
    else
        echo "On demande un ou deux arguments."
        exit
    fi
fi


egrep -o "\w+" $1 | tr '[[:upper:]]' '[[:lower:]]' | sort | uniq -c | sort -nr | head -n $nb