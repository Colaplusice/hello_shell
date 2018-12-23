#!/bin/bash



pub_key_path=$(find /Users/icecola/.ssh -name *.pub -print -quit)

echo "${pub_key_path}"
file_name=$(cut -d '/' -f2 | "$pub_key_path")

echo "$file_name"
