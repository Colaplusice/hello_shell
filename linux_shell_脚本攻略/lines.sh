#!/bin/bash
input="/Users/fjl2401"
while IFS= read -r var
do
  echo "$var"
done < "$input"