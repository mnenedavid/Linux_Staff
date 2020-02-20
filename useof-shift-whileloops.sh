#!/bin/bash
#use of shift and while loops
while [[ "${#}" -gt 0 ]]
do
	echo "Number of Parameter: ${#}"
	echo "Parameter 1: ${1} "
	echo "Parameter 2: ${2}"
	echo "Parameter 3: ${3}"
	echo
	shift #.....(shift positional parameters....1,2,3.....1 is removed, 2 is shifted to 1 and 3 is shifted to 2)
	#..Purpose of use...user supply information as arguments to script....or when data supplied has multiple words
done
