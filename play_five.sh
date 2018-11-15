#!/usr/bin/env bash
str1="down"

str2="down"

str3="down"

while [ 1 ]
      sleep 1
do
    #if [ "up" = "$(str1)" -a "up" = "$(st2)" -o "up" = "$(st3)" ];then
    if [ "up" = "$(str1)" && [["up" = "$(str2)" || "up" = "$(str3)" ]]];then
#    if [ "up" = "$(str1)" ];then
echo  123456 > ./test.txt

break;
    fi
done