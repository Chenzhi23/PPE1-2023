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
    code=$(curl -s -I -L -w  "%{http_code}" -o /dev/null $line)
    ####code=$(curl -Is -L $line | grep -e "^HTTP/" | grep -Eo "[0-9]{3}")      (version ancienne)
    charset=$(curl -s -I -L -w  "%{content_type}" -o /dev/null $line ｜ grep -P -o "charset=\S+" | cut -d"=" -f2 | tail -n 1)
    ### `grep -P -o "charset=\K\S+"` marche aussi à la place de `grep -P -o "charset=\S+" | cut -d"=" -f2`
    ####charset=$(curl -I -s $line | grep -e "charset" | grep -Eo "UTF-[0-9]{1,2}|ISO-8859-[0-9]{1,2}") (version ancienne)
    echo -e "$ligne\t$line\t$code\t$charset"
done < $fichier_urls

####### curl -s -I -L -w  "%{http_code}" -o /dev/null fr.wikipedia.org/wiki/Robot_d%27indexation
####这个 curl 命令执行了多个选项来获取有关给定 URL fr.wikipedia.org/wiki/Robot_d%27indexation 的信息，并以一种紧凑的格式返回 HTTP 响应状态码。让我为你详细解释每个选项：
#-s：这个选项表示 "silent" 或 "quiet" 模式，它告诉 curl 在执行请求时不显示进度条或错误信息。这对于只关心输出的特定信息而不想看到额外的输出非常有用。
#-I：这个选项告诉 curl 仅发送一个 HEAD 请求，而不获取页面的主体内容。HEAD 请求仅获取关于资源的元数据，如响应标头（headers），而不是实际的页面内容。这对于获取仅HTTP响应状态码的情况非常有用。
#-L：如前面解释过的，这个选项告诉 curl 跟随 HTTP 重定向。如果请求返回一个重定向响应，curl 将自动请求重定向目标的 URL。
#-w "%{http_code}"：这个选项告诉 curl 在请求完成后以特定格式输出信息。-w 后面的字符串 "%{http_code}" 指示 curl 输出的内容应该是 HTTP 响应的状态码。
#-o /dev/null：这个选项指示 curl 将响应的内容输出到 /dev/null，即将其丢弃。由于我们只关心状态码而不关心响应内容，所以将其输出到 /dev/null 可以避免将内容显示在终端上。
#最终，这个 curl 命令将向指定的 URL 发送一个 HEAD 请求，跟随重定向，然后输出HTTP响应的状态码。这是一个快速获取网页的状态信息的方式，特别适用于自动化脚本或监控任务。
