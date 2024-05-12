#!/bin/bash

stats() {
	statsFile=$1
	outFile=$2
	
	if [ ! -f $statsFile ]; then
		echo "$statsFile nie istnieje lub nie jest plikiem"
		exit -1
	fi
	
	if [ ! -r $statsFile ]; then
		echo "brak uprawnien do odczytu $statsFile"
		exit -1
	fi
	
	if [ ! -f $outFile ]; then
		if [ ! -w $(dirname $outFile) ]; then
			echo "brak uprawnien do stworzenia pliku w $(dirname $outfile)"
			exit -1
		fi
		echo -n > $outFile
	fi
	
	if [ ! -w $outFile ]; then
		echo "brak uprawnien do zapisu $outFile"
		exit -1
	fi
	
	declare -A tablica
	
	string=$(cat $statsFile)
	length=${#string}
	for ((i = 0; i < length; i++)); do
	  	char="${string:i:1}"
	    	tablica[$char,0]=$char
	    	tablica[$char,1]=0
	done
	
	for ((i = 0; i < length; i++)); do
	    char="${string:i:1}"
	    tablica[$char,0]=$char
	    tablica[$char,1]=$(( ${tablica[$char,1]} + 1 ))
	done
	
	rm -f temp
	touch temp
	
	for ((i = 0; i < length; i++)); do
	    char="${string:i:1}"
	    echo "$char" >> temp
	done	

	unik=$(cat temp | sort | uniq | tr -d "\n")
	len2=${#unik}
	for ((i = 0; i < len2; i++)); do
		char="${unik:i:1}"
	   	echo -n "${tablica[$char,0]} : "
	   	echo "${tablica[$char,1]}"
	done
	
}


stats $@
