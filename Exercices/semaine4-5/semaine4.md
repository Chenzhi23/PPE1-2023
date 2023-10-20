# Séance 4_11 oct

## Exercices de pipelines :
D'abord, pour arriver au dossier où on va traiter :
`cd ./ppe1/classification/ann`
1. Compter le nombre d'annotation par année (2016, 2017 et 2018)
`cat ./2016/*/* | wc -l`
Résultat : 8944
`cat ./2017/*/* | wc -l`
Résultat : 7179
`cat ./2018/*/* | wc -l`
Résultat : 7561

2. Limiter ce comptage aux lieux (Location)
`cat ./2016/*/*.ann | grep Location | wc -l`
Résultat : 2968
`cat ./2017/*/*.ann | grep Location | wc -l`
Résultat : 2466
`cat ./2018/*/*.ann | grep Location | wc -l`
Résultat : 3110

3. Sauvegarder ces résultats dans un (seul) fichier
`echo 'Location en 2016' > reponses.txt`
`cat ./2016/*/* | grep Location | wc -l >> reponses.txt`
`echo 'Location en 2017' >> reponses.txt`
`cat ./2017/*/* | grep Location | wc -l >> reponses.txt`
`echo 'Location en 2018' >> reponses.txt`
`cat ./2018/*/* | grep Location | wc -l >> reponses.txt`
`cat reponses.txt`
Résultat : Location en 2016
    2968
Location en 2017
    2466
Location en 2018
    3110 

4. Établir le classement des lieux les plus cités :
`cat ./*/*/* | grep Location | cut -f 3 | sort | uniq -c | sort -nr | head`
Résultat : 699 France
 297 Paris
 188 États-Unis
 139 Burundi
 111 Russie
 106 Rio
  88 Syrie
  83 Italie
  78 Champs-Élysées
  76 Turquie

5. Trouver les annotations les plus fréquentes pour votre mois de naissance, toutes années confondues :
`cat ./*/03/* | cut -f 3 | sort | uniq -c | sort -nr | head`

## Exercices de scripts
1. Écrire un script qui donne le nombre de Location par année : [ici](/Exercices/semaine4.sh)

2. Exercice 1 : [ici](/Exercices/semaine4-5/semaine4_exo1.sh) et [ici](/Exercices/semaine4-5/semaine4_exo1_2.sh)

3. Exercice 2 : [ici](/Exercices/semaine4-5/semaine4_exo2.sh)