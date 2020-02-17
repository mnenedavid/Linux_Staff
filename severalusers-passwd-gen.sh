#!/bin/bash

#This script generates a random passwd for each user specified on the command line.

#Display what the user typed on the command line.

echo "You executed this command: ${0}"

#Display the path and filename of the script.
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."

#Display how many arguments were passed in. (paramteres are usually inside the script while arguments they are outside the script)
NUMBER_OF_PARAMETERS="${#}"
echo "You supplied ${NUMBER_OF_PARAMETERS} argument(s) on the command line."

#Ensure the user supplies atleast one argument.
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then 
	echo "Usage: ${0} USER_NAME [USER_NAME]..."
	exit 1
fi

#Generate & display a password for each inputtedd username parameter
for USER_NAME in "${@}"   # ($@....whataever number of arguments inputted, it shall be captured......$* can not be used in this case where we have double quoation as it shall capture the several arguments as one thing)
do 
	PASSWORD=$(date +%s%N | sha256sum | head -c48)
	echo "${USER_NAME}: ${PASSWORD}"
done

