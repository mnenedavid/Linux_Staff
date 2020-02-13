#!/bin/bash
#
#This script creates a new user on the local system
#You will be prompted to enter the username (login), the person name and a password
#Display the username, password and host for the account


#Make sure the script is being executed with superuser privileges 
if [[ "${UID}" -ne 0 ]]
then 
  echo 'Please run with sudo or as root.'
  exit 1
fi

#Get the username (login)
read -p 'Enter the username to create: ' USER_NAME

#Get the real name (comment field)
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

#Get the password
read -p 'Enter the password to use for the account: ' PASSWORD

#Create account
useradd -c "${COMMENT}" -m ${USER_NAME}


#Check to see if the useradd command succeeded
# We dont want to tell the user that the account was created when it was not
if [[ "${?}" -ne 0 ]] 
then
	echo 'The account could not be created....Sorry try again.'
	exit 1
fi

#Set the password
#echo ${PASSWORD} | passwd --stdin ${USER_NAME} --used in centos
echo "${USER_NAME}:${PASSWORD}" | chpasswd   #for ubuntu users

if [[ "${?}" -ne 0 ]]
then
	echo 'The password for the account could not be set.'
	exit 1
fi


#force password change on next login
passwd -e ${USER_NAME}

# Display the username, password amd the host where the user was created
echo
echo 'Username:'
echo "${USER_NAME}"
echo
echo 'Password:'
echo "${PASSWORD}"
echo 
echo 'Host:'
echo "${HOSTNAME}" 





