#!/bin/bash

shopt -s globstar
IFS=$'\n' # Input Field Separator

function run_upload () {
for FILENAME_I in `find . -maxdepth 1 -type f \( -iname \*.mp4 -o -iname \*.mkv -o -name \*webm \)`
do
gdrive upload --delete --no-progress --parent 19ibim8go9Y6D9LgFdTbHqz1NcXbcavgD $FILENAME_I
done
}

count=`find . -maxdepth 1 -type f \( -iname \*.mp4 -o -iname \*.mkv -o -iname \*.webm \)| wc -l`
if [ $count -ge 1 ]
    then
    run_upload
fi

exit 0
