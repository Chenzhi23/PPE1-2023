##!/usr/bin/zsh
##Donner la permission d'opérer les fichiers à ce script 
#chmod +x semaine4.sh
##Aller dans les dossiers traités
cd ./../../ppe1/classification/ann
##Compter le nombre de Location par année et les faire entrer dans un fichier
echo "Locations en 2016" > reponses.txt
cat ./2016/*/* | grep Location | wc -l >> reponses.txt
echo "Locations en 2017" >> reponses.txt
cat ./2017/*/* | grep Location | wc -l >> reponses.txt
echo "Locations en 2018" >> reponses.txt
cat ./2018/*/* | grep Location | wc -l >> reponses.txt
##Afficher le résultat
cat reponses.txt

#########################################################
##Pas de arguments inséreés, donc pas besoin d'amélioration. Et voici les scripts ci-dessous plus profonde :
Exercice 1 : [ici](/Exercices/semaine4_exo1.sh) et [ici](/Exercices/semaine4_exo1_2.sh)

Exercice 2 : [ici](/Exercices/semaine4_exo2.sh)


