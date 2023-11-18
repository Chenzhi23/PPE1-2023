#!/usr/bin/env zsh

fichier=$1
nb=$2

if [ -z $2 ]
then 
    nb=25
else
    if [[ ! $2 =~ ^[1-9][0-9]*$ ]]
    ##这个命令是防止有第二个argument，但是他不是数字就不能被tail或者head识别
    ### 需要 `^[1-9][0-9]*$` 否则上面的命令有缺陷（即第二个argument时adada01dasda也行得通）
    ###`^` 匹配输入字符串的开始位置 ; `$` 匹配输入字符串的结束位置
    ##区别：
    #^ 和 $ 用于匹配整个字符串的开头和结尾，而 \b 用于匹配单词的边界。
    #^ 和 $ 可以确保整个字符串的开头和结尾匹配，而 \b 用于匹配单词的开始或结束位置。
    #\b 不匹配任何实际字符，只匹配位置，而 ^ 和 $ 匹配字符串的实际字符。
    #举例说明：
    #^word 匹配以 "word" 开头的字符串。
    #word$ 匹配以 "word" 结尾的字符串。
    #\bword\b 匹配包含独立单词 "word" 的字符串。

    then 
        echo "donnez moi un chiffre"
        exit
    ## 这里需要exit就是在有问题之后直接exit，而不是等到后面报错
    fi
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

## version ancienne (mon propre)
##egrep -o "\w+" $1 | tr '[[:upper:]]' '[[:lower:]]' | sort | uniq -c | sort -nr | head -n $nb


ggrep -o -P "\p{Latin}+" $1 | tr '[[:upper:]]' '[[:lower:]]' | tr 'ÉÀÊ' 'éàê' | sort | uniq -c | sort -n | tail -n $nb