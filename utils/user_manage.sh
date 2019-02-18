#!/bin/bash

function usage()
{
    echo "usage"
}


if [ $UID -ne 0 ];
then
    echo Run "$0" as root
    exit 2
fi


case $1 in
    -adduser) echo 1
    ;;
    2|3) echo 2 or 3
    ;;
    *) echo default
    ;;
esac


