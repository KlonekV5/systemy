#!/bin/bash
mkdir -p $1
ln -s /etc/passwd $1/passwd
wc -l /etc/passwd # -l --> lines of file
du -h /etc/passwd # size of file
head /etc/passwd # print first 10 lines
tail -n 5 /etc/passwd # -n --> number of last lines

user_group=`groups | cut -d ' ' -f 1`
grep ^$user_group /etc/group | cut -d ':' -f4

touch $1/F1.csv.unsorted
for l in `cat /etc/passwd | tr ' ' '_'`; do
	user=`echo $l | cut -d ':' -f1` 
	shell=`echo $l | cut -d ':' -f7` 
	echo "$shell,$user" >> $1/F1.csv.unsorted
done
sort $1/F1.csv.unsorted > $1/F1.csv

cat /etc/group | cut -d: -f3 | uniq | sort -n > $1/F2.csv

#10
#11

dd if=/etc/passwd of=$1/passwdPiece bs=1 count=20 skip=10

