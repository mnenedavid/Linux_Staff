#!/bin/bash

#fibonacci_series

#Static input for N
echo "Enter Number: "
read N
#first Number of the Fibonacci_series
a=0

#Second Number of the Fibonacci_series
b=1

echo "The Fibonacci Series is: "
for (( i=0; i<N; i++))
do
	echo "$a"
	fn=$((a+b))
	a=$b
	b=$fn
	
done
#end of for loop
