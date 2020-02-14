#!/bin/bash
#This script generates a list of random passwords

#A random number as a passwd

PASSWORD="${RANDOM}"
echo "${PASSWORD}"

#Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"


#Use the current date/time as the passwd generation
PASSWORD=$(date +%s)
echo "${PASSWORD}"

#use nanoseconds to generate passwd
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

#A better password generation with Hash crypting function
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"


#An even stronger passwd generation
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

#Append special character to the password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"


