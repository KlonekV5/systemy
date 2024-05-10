#!/bin/bash

sort() {
	local -a tablica=()
	for element in "$@"; do
		tablica+=("$element")
	done
	
	local n=$#
	
	for ((i=0; i<n-1; i++)); do
		for ((j=0; j<n-i-1; j++)); do
			if ((tablica[j] > tablica[j+1])); then
				local temp=${tablica[j]}
				tablica[j]=${tablica[j+1]}
				tablica[j+1]=$temp
			fi
		done
	done
	
	echo "${tablica[@]}"	
	}

mnozenie() {
	if (( $#!=2 )); then
		echo "nalezy podac dokladnie 2 argumenty"
		exit -1
	fi
	if (( $1<1 )); then
		echo "argumenty musza byc dodatnie"
		exit -1
	fi
	if (( $2<1 )); then
		echo "argumenty musza byc dodatnie"
		exit -1
	fi
	
	local col=$2
	local row=$1
	local -a tablica
	
	for (( i=0; i<$row; i++ )); do
		for (( j=0; j<$col; j++ )); do
			local value=$(( (i+1)*(j+1) ))
			tablica[$(( i*col+j ))]=$value
		done
	done
	
	for (( i=0; i<row; i++ )); do
		for (( j=0; j<col; j++ )); do
			echo -n "${tablica[$(( i*col+j ))]} "
		done
		echo
	done

}

calka() {
	if (( $#<2 )); then
		echo "nalezy podac przynajmniej 2 argumenty"
		exit -1
	fi
	
	local values=("$@")
	local n=$#
	local sum=0
	for (( i=0; i<n-1; i++)); do
		local now=${values[i]}
		local next=${values[i+1]}
		local area=$(bc <<< "scale=5; 1 * (($now + $next) / 2)")
		sum=$(bc <<< "scale=5; $sum + $area")
	done

	echo "wartosc calki: $sum"
}

calka $@
#mnozenie $@
