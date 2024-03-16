#!/bin/bash
# This code is designed to find a word from files in a directory
#echo "Input a file path";
#read filesdir;
#echo "Input a word";
#read searchstr;
filesdir="$1"
searchstr="$2"
if [[ ! -d "$filesdir" ]] ||[[ -z {"$searchstr"} ]];then
	echo "Specify parameters";
	if [[ ! -d "$filesdir" ]];then
		echo "The specified path is not found";
		exit 1;
	else

		echo "Please give the string";
	fi;
else
	result=$(grep -rn "$searchstr" "$filesdir") 
	if [[  -n "$result" ]];then
		X=$(ls "$filesdir" | wc -l)
		Y=$(grep -rn  -c "$searchstr" "$filesdir")
		echo "$X is the number of files in the directory and all subdirectories and $Y is the number of matching lines found in respective files, where a matching line refers to a line which contains the word $searchstr";
	else
		echo "No mathes found"
	fi;
fi;	

