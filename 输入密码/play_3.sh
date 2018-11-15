#!/usr/bin/env bash


echo -e '请输入密码'

stty -echo
read password

echo "this is your password ${password}"
stty echo
echo
echo Password read
