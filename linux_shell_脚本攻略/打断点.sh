#!/usr/bin/env bash

function DEBUG(){
[ "$_DEBUG" == "ON"  ]&& $@ ||:
}
for i in {1...10}
do
    DEBUG echo "i is $i"
done