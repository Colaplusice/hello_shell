#!/usr/bin/env bash

start=$(date +%s)
commands;
statements;

end=$(date +%s)
differ=$((end-start))

echo 花费的时间为 $differ
