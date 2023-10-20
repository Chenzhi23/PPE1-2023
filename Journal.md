# Journal de Chenzhi

## Séance 1_20 sep
Pour la première séance, je me suis familiarisé avec le systeme de fichier. Saisir comment identifier le chemin de quelques fichiers ciblés.
En même temps, je sais la grammaire du langage, comme la syntaxe d'une commande. En plus, j'essaies de bien connaître certaines commandes courantes, comme "pwd", "ls", "cd", "mkdir"...
Cependant, j'ai besoin de mieux me familiariser avec telles commandes, surtout celles sur les informations de ce fichiers.

## Séance 2_27 sep
Après la présentation proposée par les profs, je sais bien ranger les fichiers avec le terminal.
D'abord, je crée un dossier "ppe1"pour déposer les fichiers. Puis je me rend au dossier cible "ppe1" et crée des dossiers différents "txt", "ann", "img". Donc je déplace le fichier zip que je viens de télécharger dans le dossier cible.
Puis on crée des dossiers différents selon les types variants, les dates avec la commande "mkdir". L'étape prochaine, c'est de déplacer les fichiers à bien classer. J'utilise beaucoup de commandes comme "mv ~/ppe1/Fichiers/*Paris* ~/ppe1/classification/img/paris", "mv ~/ppe1/Fichiers/2016*.txt ~/ppe1/classification/txt/2016", "mv *_01_*.txt 01".
Bien sûr, je vérife souvent leur place à l'aide de "ls". Et pour illustrer le classement en arborescence, je commande comme "tree classification" (classification est un dossier).
Enfin, je tape "tree" afin d'atteindre le but de montrer l'arborescence du classement.

## Séance 3_4 oct
En ce cours, il est important de savoir comment corriger les erreurs en utilisant les commandes git reset/revert. Mais aujourd'hui on se concentre plutôt sur "git reset". "git reset" contient quelques options comme "HEAD", "--soft", "--hard". Et plus facilement et rapidement, nous pouvons utiliser SHA (le code de commit) pour "reset".

Nb: 
Des questions : 1. Comment utiliser "HEAD" ? Après "git reset HEAD^", la commande "git pull" ne marche pas quand même. Mais après "git reset --hard", la commande  "git pull" marche bien. Même si je sais "--hard" qui supprime tous les changements en notre ordinateur.
2. Quelle est la différence entre origin, main, origin/main ?

Réponse :
"git reset HEAD^", en effet, c'est "git reset --mixed HEAD^". Autrement dit : "git reset HEAD^" = "git reset --mixed HEAD^". Dans ce cas-là, on revient à la version du dépôt et annule la mise-en-place (add+commit), mais la modification reste encore dans le working directory.

Ajout de l'information :
N'oubliez pas de créer des tags après chaque séance. 
Il faut comprendre la différence entre "reset" et "revert".

## Séance 4_11 oct
Dans cette séance, on apprend à comprendre les mécanismes des pipelines et des scripts.
### Pipelines
D'abord, il nous faut comprendre l'entrée et la sortie en utilisant le chevron. Et il faut noter que le chevron simple va effacer le contenu qui est déjà existé dans un fichier. Donc, quand on veut ajouter plusieur éléments dans un seul fichier, il faut utiliser `>>` après le premier insertion (`>`).
Ensuite, il y a des ordres sévères pour la marche. Quand on veut prendre plusieurs commandes en une ligne de commande, il faut utiliser `|` afin de séparer les commandes différentes et prendre en compte l'ordre des commandes. Car l'ordre différent va sortir les résultats différents.
Et il faut se familiariser les commandes que l'on a déjà apprises avant.
### Scripts
1. Après la création d'un script, il faut le rendre exécutable. `chmod +x *.sh`
2. On peut ajouter des commentaires dans notre script en utiliser `#`. Dans ce cas-là, il nous aide à mémoriser des choses importantes ou indiquer quelques autres.
3. Les arguments et les variables sont des éléments importants dans les scripts. N'oublie pas à utiliser `$`. C'est le signal indispensable pour donner la valeur.
NB : `$1`,`$2` peuvent indiquer le premier et deuxième arguments pour le script.

## Séance 5_18 oct
Dans cette séance, on va plus loin dans le script.
### Instructions de contrôle
#### L'instruction `if`
1. Besoin de `[]` pour entourer les conditions.
2. Besoin de `[[]]` pour utiliser des expressions régulières.
3. En utilisant des expressions régulières, besoin de espaces entre `[[]]` et entre `=~`.
4. Séparer les différentes conditions avec `&&`.
5. N'oublie pas `-` pour les conditions sur les entiers.
6. N'oublie le langage `then`, `else`, `fi`.

#### Les boucles `for`
1. `for .. in ..`, `do -> done`
2. On peut sortir avec la commande `exit`.
3. La commande `expr` est une calculatrice.
4. N'oublie pas `$` pour citer la variable.
5. `N=$(expr $N+1)` pour plus(+).

#### Les boucles `while`
1. `while`, `do -> done`
2. On peut utiliser `read` pour inséser quelques choses en dedant, le contenu est l'argument que l'on tape. Il équivaut à `input` dans le python.
3. `read -r` pour ignorer `\` qui est utilisé souvent en `\n` pour sauter la ligne.
4. On peut l'utiliser avec la commande `if`.
5. On peut insérer des fichiers avec `<` en se situant après `done`. Et même si le fichier inséré ne se situe pas dans le même dossier que le script, on peut utiliser des chemins corrects pour citer les fichiers.
6. Pour terminer le programme, on utilise la commande `control + c`.

### Web
#### Connaissance sur HTML
1. C'est un langage de balisage pour affichier des pages web.
2. Il nous permet de structurer l'information, enrichir le texte.
3. Avec lui, nous pouvons dialoguer avec internet bien sûr à l'aide des outils intéressants.
4. Les codes comme `404` sont des HTTP réponses. Les différents codes nous permettent de savoir qu'est-ce que se passe-t-il pour le web.

#### Outils pour web
1. Deux outils utils (lynx et cURL) sont été introduits pour dialoguer avec internet.
2. Avec les outils, nous pouvons affichier des webpage en terminal dans notre ordinateur.
3. Pour `lynx`, `lynx -dump URL` pour récupérer le contenu textuel d'une page. En ajoutant `-nolist` pour retirer la liste des liens. Et sans les options, `lynx URL` peut nous montrer le webpage, et on peut faire des choses comme dans le navigateur.
4. Pour `curl`, il nous permet de récupérer des pages web. La commande est `curl -option URL`. Et les profs nous montrent de nombreuses options utiles comme `-i` (des informations concernant le web), `-L` (suit le redictions), `-o`, etc.
5. Après la pratique nous-même, nous trouvons que la correction de URL est nécessaire. Parce que le lien de web n'est pas toujours pareil. Comme `http` et `https`, c'est facile à les confondre.






