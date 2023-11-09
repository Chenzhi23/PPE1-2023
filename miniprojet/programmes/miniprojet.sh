#!/usr/bin/env zsh



if [ $# -ne 1 ]
then 
    echo "ce programme demande un argument"
fi



echo "<html>" > ./../tableaux/tableau-fr.html

echo "<head>" >> ./../tableaux/tableau-fr.html
echo "<meta charset="UTF-8"/>" >> ./../tableaux/tableau-fr.html
echo "</head>" >> ./../tableaux/tableau-fr.html

echo "<body>" >> ./../tableaux/tableau-fr.html
echo "<table>" >> ./../tableaux/tableau-fr.html
echo "<tr><th>Ligne</th><th>URL</th><th>Code</th><th>Encodage</th></tr>" >> ./../tableaux/tableau-fr.html

fichier_urls=$1
ligne=0
while read -r line
do
    ligne=$( expr $ligne + 1 )
    code=$(curl -s -I -L -w  "%{http_code}" -o /dev/null $line)
    charset=$(curl -s -I -L -w  "%{content_type}" -o /dev/null $line ｜ grep -P -o "charset=\S+" | cut -d"=" -f2 | tail -n 1)

    echo "<tr>" >> ./../tableaux/tableau-fr.html
    echo "<th>$ligne</th><th>$line</th><th>$code</th><th>$charset</th>" >> ./../tableaux/tableau-fr.html
    echo "</tr>" >> ./../tableaux/tableau-fr.html

done < $fichier_urls


echo "</table>" >> ./../tableaux/tableau-fr.html
echo "</body>" >> ./../tableaux/tableau-fr.html


echo "</html>" >> ./../tableaux/tableau-fr.html