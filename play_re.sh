#!/usr/bin/env bash

file="thisfile.txt"
echo "filename: ${file%.*}"
echo  ${file##*.}