#!/bin/bash
mkdir -p $1 #1
grep -w $(whoami) /etc/passwd | cat #2

touch $1/F1.csv
for line in $(cat /etc/passwd | tr " " "-"); do
	USER=$(echo $line | cut -d: -f1)
	HOME=$(echo $line | cut -d: -f6)
	SHELL=$(echo $line | cut -d: -f7)
	echo "$USER,$HOME,$SHELL" >> $1/F1.csv
	
done
cat $1/F1.csv | tr "-" " " | sort -fr > $1/F1.csv.temp
mv $1/F1.csv.temp $1/F1.csv	#3
	
touch $1/F2.csv
cat /etc/passwd | cut -d: -f7 | rev | sort | uniq | rev > $1/F2.csv #4
	
touch $1/F3.txt
cat /etc/passwd | cut -d: -f1 | tr "a-z" "A-Z" > $1/F3.txt #5

touch $1/F4.txt
cat /etc/passwd | grep -B4 -A4 -w man > $1/F4.txt #6

touch $1/differences.txt
diff -y /etc/passwd $1/F4.txt > $1/differences.txt #7
