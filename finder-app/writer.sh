#!/bin/bash
writefile="$1";
writestr="$2";
filepath=$(dirname "$writefile")
if [[ -z "$writefile" ]];then
	echo "Please provide a valid file path."
    	exit 1;
elif [[ -z "$writestr" ]];then
	echo "No search string specified."
      	exit 1;
else
	if [[ -d "$filepath" ]];then
		echo "$writestr" > "$writefile"
	elif [[ ! -d "$filepath" ]];then
		mkdir "$filepath"
		echo "$writestr" > "$writefile";
	else
		echo "File could not be created";
		exit 1;
	fi;
fi;
