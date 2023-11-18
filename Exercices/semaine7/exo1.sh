#!/usr/bin/env zsh

if [ $# -ne 1 ]
then 
    echo 'Ce programme demande un argument.'
else
    if [ -f $1 ]
    then 
        echo 'On a un fichier.'
    else
        echo "On n'a pas de fichier."
    exit
    fi
fi

fichier=$1 
### Pas de espace entre `=`, sinon marche pas pour rendre la valeur à la varaible

##egrep -o "\w+" $fichier | tr '[[:upper:]]' '[[:lower:]]' > candide_motisole.txt
## `"\w"` ne peut pas identifier des caractères diacrités

ggrep -o -P "\p{Latin}+" $fichier | tr '[[:upper:]]' '[[:lower:]]' | tr 'ÉÀÊ' 'éàê' > candide_motisole.txt