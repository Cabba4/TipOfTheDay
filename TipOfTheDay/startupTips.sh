#!/bin/bash

# Script to show tips on each login/new terminal open

# DATE=$(date -I)

# Read current tip
NUM=$(<.curtip )

# Counting number of files in Tips folder and storing to variable

LAST=$(ls -rv Tips/ | head -1 | cut -d . -f1)

# Another way ls *.txt | wc -l


# Reads file 1.txt
cat Tips/$NUM.txt

# Adds one to NUM variable
NUM=`expr $NUM + 1`

echo $NUM> .curtip
if [ $NUM -gt $LAST ]
	then NUM=1 echo "1" > .curtip
fi


######################### EOF

