#!/bin/bash

file $1 #1
wc -l $1 #2
wc -m $1 #3
du -h $1 #4
grep $2 $1 | wc -l #5

NUM1=$(grep $2 $1 | wc -l)
NUM2=$(cat $1 | wc -l)
echo $(($NUM2 - $NUM1)) #6
head -n5 $1 | tail -n1 | cat #7
