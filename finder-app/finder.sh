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
	elif [[ -z {"$searchstr"} ]];then
		echo "Please give the string";
		exit 1;
	fi;
else
	result=$(grep -rn "$searchstr" "$filesdir") 
	if [[  -n "$result" ]];then
		X=$(ls "$filesdir" | wc -l)
		Y=$(grep -rn  -c "$searchstr" "$filesdir" | wc -l)
		echo "The number of files are ${X} and the number of matching lines are ${Y}";
	else
		echo "No matches found"
	fi;
fi;	

