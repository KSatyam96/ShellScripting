#!/bin/bash

BASE="/home/kumar/Desktop/current/"

#Check if BASE folder exist.
if [ -d "$BASE" ]; then
	echo "${BASE} exists. Continue.."
else
	echo "${BASE} does not exist. EXIT"
	exit 1
fi

#Check if archive folder exit, if not create it.
if [ -d "${BASE}archive" ]; then
	echo "${BASE}archive exists. Continue.."
else
	echo "${BASE}archive doesn't exist. Creating..."
	( mkdir "$BASE"archive ) || exit 1
	echo "mkdir "$BASE"archive command successful"

fi


#Find the list of files larger than 400 KB, zip it and archive it.
echo "Find file lareger than 400 KB in ${BASE}"

for i in `find $BASE -maxdepth 1 -type f -size +400k`
do
#	if [ 1 == 1 ]
#	then
		echo "Archiving files $i"
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
		echo "Archived.."
#	fi
done

