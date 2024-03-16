#!/bin/bash
writefile="$1";
writestr="$2";
filepath=$(dirname "$writefile")
if [[ -z "$writefile" ]];then
	echo "Please provide a valid file path."
    	exit 1;
elif [[ -z "$writestr" ]];then
	echo "No search string specified."
      
else
	if [[ -d "$filepath" ]];then
		echo "$writestr" > "$writefile"
	else
		mkdir "$filepath"
		echo "$writestr" > "$writefile";
	fi;
fi;
