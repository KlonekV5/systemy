#!/bin/bash
mkdir $1 #1
mkdir $1/A1/A11 $1/B1/B11 $1/C -p #2
touch $1/A1/t1.txt $1/B1/B11/f1.csv $1/C/ccc.txt
ln /etc/passwd $1/A1/passwd -s #3 -s -->link symboliczny
readlink $1/A1/passwd #4 
ln $1/B1/B11/f1.csv $1/B1/F2.csv #5 domyslnie link twardy
chmod 600 $1/B1/F2.csv #6 rwxrwxrwx --> 421421421
sudo chown :man $1/B1/F2.csv #7 y:x --> grupa x, uzytkownik y
sudo chgrp man $1/C/ #8
chmod -x $1/C/ #9 
chmod 555 $1/B1/ #10
chmod 333 $1/A1/ #11
chmod +t $1/C/ #12 +t --> sticky bit
touch $1/C/scr1.sh #13
chmod u+x,g+x $1/C/scr1.sh # user group other
chmod u+s,g+s $1/C/scr1.sh #14 u+s --> SUID g+s --> SGID
tree --inodes #15 inodes --> indentyfikator pliku na dysku
