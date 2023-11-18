#!/usr/bin/env zsh

fichier=$1
nb=$2

if [ -z $2 ]
then 
    nb=25
fi

## egrep -o "\w+" $fichier | tr '[[:upper:]]' '[[:lower:]]' > exo3_bigramme1.txt改进后如下所示：
ggrep -o -P "\p{Latin}+" $fichier | tr '[[:upper:]]' '[[:lower:]]' | tr 'ÉÀÊ' 'éàê' > exo3_bigramme1.txt

paste exo3_bigramme1.txt <(tail -n +2 exo3_bigramme1.txt) > exo3_bigrammes2.txt
# paste exo3_bigramme1.txt <(tail -n +2 exo3_bigramme1.txt)实际上等于
# paste exo3_bigramme1.txt $变量.txt     （tail -n +2 exo3_bigramme1.txt > $变量.txt）  
## `tail -n +2`不等于 `tail -n 2` : 一个是剪切到第二行，一个是剪切倒数两行


cat exo3_bigrammes2.txt | sort | uniq -c | sort -nr | head -n $nb > exo3_FrequenceBigrammes.txt
