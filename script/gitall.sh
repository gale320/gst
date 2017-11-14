#!/bin/sh
echo `pwd`
currentDir=`pwd`
outFile="/tmp/gale.txt"

echo "" > $outFile

for file_a in ${currentDir}/*; do  
    temp_file=`basename $file_a`  
    echo $temp_file >> $outFile
done 

for line in `cat $outFile`
do
   if [ -d $line ]; then
 	cd $line
	git pull
	cd ../
   fi
done
