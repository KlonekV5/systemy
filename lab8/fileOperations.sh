#!/bin/bash

zad0() {
	fin=$1
	fout1=$2
	fout2=$3
	
	if [ ! -r $fin ]; then
		echo "brak uprawnien do odczytu pliku wejsciowego"
		exit -1
	fi
	if [ -e $fout1 ]; then
		if [ ! -w $fout1 ]; then
			echo "brakk uprawnien do zapisu pliku $fout1"
			exit -1
		fi
	fi
	if [ -e $fout2 ]; then
		if [ ! -w $fout2 ]; then
			echo "brak uprawnien do zapisu pliku $fout2"
			exit -1
		fi
	fi
	echo -n > $fout1
	echo -n > $fout2
	
	while read line; do
		chk=$RANDOM
		if [ $(($chk % 2)) -eq 0 ]; then
			echo "$line" >> $fout1
		else
			echo "$line" >> $fout2
		fi
		
	done < $fin
}

zad1() {
	if [ ! -d $1 ]; then
		echo "$1 nie jest katalogiem"
		exit -1	
	fi
	
	if [ ! -w $1 ]; then
		echo "brak uprawnien do zapisu w $1"
		exit -1	
	fi
	
	if [ ! -r $2 ]; then
		echo "brak uprawnien do odczytu $2"
		exit -1	
	fi
	
	while read line; do
		mkdir -p "$1/$line"
		for (( i=0; i<10; i++ )); do
			file="$1/$line/F$i"
			touch $file
		done
	done < $2
}

zad1 $@
