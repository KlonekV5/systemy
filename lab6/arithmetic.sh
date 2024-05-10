#!/bin/bash


zad0() {
	if [ $(( $1 - $2 )) -eq 0 ]; then
	        echo "popdano nieprawidlowe zmienne"
	        exit -1
	    else
	        res1=$(( ($1 + $2) / ($1 - $2) ))
	        echo $res1
	fi
	}

zad1() {
	if [ $# -eq 1 ]; then
		if [ $1 -eq 1 ]; then
			echo 1
		elif [ $1 -eq 0 ]; then
			echo 1
		else
			res2=$(( $1 * $(zad1 $(( $1 - 2 ))) ))
			echo $res2
		fi
	else
		echo "podano nieporawne zmienne"
		exit -1
	fi
	}

zad2() {
	if [ $# -eq 1 ]; then
		res3=1
		for (( i=1; i<=$1; i+=2 )); do
			if [ $(( i )) -eq 1 ]; then
				echo ""
			elif [ $(( i )) -eq 0 ]; then
				echo ""
			else 
				res3=$(( $res3 * $i ))
			fi
		done
		echo $res3
	else
		echo "podano nieporawne zmienne"
		exit -1
	fi
	}

zad3() {
	res4=0
	for i in $@; do
		res4=$(( res4 + i ))
	done
	echo $res4
	}

#zad0 $@
#zad1 $@
zad2 $@
#zad3 $@
