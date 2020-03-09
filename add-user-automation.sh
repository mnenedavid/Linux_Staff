#!/bin/bash
#
#This script creates a new user on the local system
#You must supply a username as an argument to the script
#Optionally, you can also provide a comment for the account as an argument
#A password will be automatically generated for the account
#The username, password and host for the account will be displayed


#make sure the script executes with superuser priviliges
if [[ "${UID}" - ne 0 ]]
then 
	echo "Please run with sudo or as root."
	exit 1
fi


#if they dont supply at least one argument then give them help
if [[ "${#}" -lt 1 ]]
then
	echo "Usage: ${0} USERNAME [COMMENT]..."
	echo "Create an account on the local system with the name of the USERNAME and a comments field of COMMENT."
	exit 1
fi


#The first parameter is assigned to the user name
USER_NAME="${1}"

#The rest of the parameters are for comments....hence we use shift to remove the first parameter and leaves the rest to comment
shift
COMMENT="${@}"

#Generate Password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

#Create the user with the password
useradd -c "${COMMENT}" -m ${USER_NAME}

#Check to see if the useradd command succeeded
if [[ "${?}" - ne 0 ]]
then
	echo "The creation of the username failed, kindly try again."
	exit 1
fi

#Set the password
echo "${USER_NAME}:${PASSWORD}" | chpasswd   #for ubuntu users

#Check to see if the password command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo "The creation of the password failed, kindly try again."
	exit 1
fi

#Force password change on next login
passwd -e ${USER_NAME}


#Display the username, password amd the host where the user was created
echo
echo 'Username:'
echo "${USER_NAME}"
echo
echo 'Password:'
echo "${PASSWORD}"
echo 
echo 'Host:'
echo "${HOSTNAME}"
exit 0
