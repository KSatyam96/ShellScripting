#!/bin/bash
#Take input from user and check if the input is only Alphanumeric

echo "Enter your text."
read VAR

echo -e "\nYou have entered."
echo $VAR

exp=$( echo $VAR | sed -e 's/[^[:alnum:]]//g' )

if [ $exp != $VAR ]
then
	echo -e "\nYour entered text is not only alphanumeric."
else
	echo -e "\nYour entered text is alphanumeric."
fi
