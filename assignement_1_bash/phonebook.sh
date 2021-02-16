#!/bin/bash
clear

if ! [ -f phonebook.sh ]
then
	touch phonebook.sh
fi

case $1 in
#insert new name and number
"-i")
	read -p "Enter new contact's name: " name
	read -p "Enter new contact's number: " number
	echo -n $name >> phonebook.sh
	echo -e "\t\t"$number >> phonebook.sh
;;
"-v")
	cat phonebook.sh
;;
#search by name
"-s")
	read -p "Enter contact's name to search for:" sname
	#-i option makes the grep ignore case sensitivity
	#-w is for exact match	
	ret=$(grep -i -w -ci "$sname" phonebook.sh)
	if [ $ret == 0 ]
	then 
		echo -e "No Record !"
	else
		grep -i -w "$sname" phonebook.sh
	fi	
;;
#delete all records
"-e")
#	>phonebook.txt
	rm phonebook.sh
	touch phonebook.sh
;;
#delete line
"-d")
	read -p "Enter a line to delete: " DLine
	sed -i -e  "/\<${DLine}\>/d" phonebook.sh
;;
*)
#guide if user doesn't enter an option
	echo -e "phonebook help:"
	echo -e "[OPTIONS]"
	echo -e "-i\tto insert new name and number"
	echo -e "-v\tview all saved contacts details"
	echo -e "-s\tsearch by contact name"
	echo -e "-e\tDelete all records"
	echo -e "-d\tDelete only one contact name"
;;
esac
