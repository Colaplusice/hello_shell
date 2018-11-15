#!/usr/bin/env bash

gen_protos(){

for i in `seq 1 $#`
do
echo $i is $1
shift
done

}
Action=$1
case $Action in
    gen_protos) gen_protos $# ;;
*)
esac



