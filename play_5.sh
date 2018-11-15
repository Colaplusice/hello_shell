#!/usr/bin/env bash


awk '$2 ~ // {print $2,$4}' a.txt