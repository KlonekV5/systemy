#!/bin/bash

mkdir -p $2/ #1

find $1 -type f -name '*.txt' #2

find $1 -type d -name '[ABb]*' #3

find $1 -type f -perm -a+x -name '*.sh' #4

find $1 -type f -user man -empty #5

find $1 -type l #6

find $1 -type f -size -1M -group man #7

find $1 -type f -executable -perm '-2000' -or -perm '-4000'

find $1 -type d -perm -1000 #9

find $1 -type f -cmin -60 #10

find /dev -type d,c #11

find $1 -type d -empty -exec rm -r {} \; #12

find $1 -type f -size +10M -exec mv {} $2 \; #13

find $1 -maxdepth 1 -type d -name 'Z*' -exec cp -r {} $2 \; #14


