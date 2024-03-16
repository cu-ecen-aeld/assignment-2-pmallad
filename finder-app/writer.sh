#!/bin/bash
writefile="$1";
writestr="$2";
if [[ ! -d "$writefile" ]]; then
    echo "Please provide a valid file path."
    exit 1
fi;

if [[ -z "$writestr" ]]; then
    echo "No search string specified."
    
else
    grep -rn "$search_string" "$directory"
fi;
