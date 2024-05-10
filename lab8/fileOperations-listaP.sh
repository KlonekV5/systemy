#!/bin/bash

zad0() {
	finput=$1
	foutP=$2
	foutN=$3
	counter=0
	
	if [ ! -r $finput ]; then
		echo "brak uprawnien do odczytu pliku wejsciowego"
		exit -1
	fi
	
	if [ -e $foutP ]; then
		if [ ! -w $foutP ]; then
			echo "brakk uprawnien do zapisu pliku $foutP"
			exit -1
		fi
	fi
	echo > $foutP
	
	if [ -e $foutN ]; then
		if [ ! -w $foutN ]; then
			echo "brakk uprawnien do zapisu pliku $foutN"
			exit -1
		fi
	fi
	echo > $foutN
	
	while read line; do
		counter=$(($counter+1))
		
		if [ -z "$line" ]; then
			continue
		fi
		
		if [ $(($counter % 2)) -eq 0 ]; then
			echo "$counter $line" >> $foutP
		else
			echo "$counter $line" >> $foutN
		fi
		
	done < $finput
}

zad1() {
	if [ ! -d $1 ]; then
		echo "$1 not a directory" > /dev/stderr
		exit -1 
	fi
	
	if [ ! -w $1 ]; then
		echo "cannow write in $1" > /dev/stderr
		exit -1 
	fi
	
	if [ ! -r $2 ]; then
		echo "cannow read $2" > /dev/stderr
		exit -1 
	fi

	while read line; do
		mode=$(echo $line | cut -d: -f1)
		path="$1/$(echo $line | cut -d: -f2)"
		
		if [ $mode = "D" ]; then
			mkdir -p $path
		fi
		if [ $mode = "F" ]; then
			if [ ! -e $path ]; then
				mkdir -p $( dirname $path )
				touch $path
			fi
		fi
	done < $2
}

zad1 $@
