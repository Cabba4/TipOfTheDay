#!/bin/bash

# Script to show tips on each login/new terminal open

# DATE=$(date -I)

# Read current tip
#cat 1 > .curtip


HOMEDIR=$HOME/scripts

_showTip()
{
	NUM=$(<$HOMEDIR/.curtip )
#NUM=1
# Counting number of files in Tips folder and storing to variable

	LAST=$(ls -rv $HOMEDIR/Tips/ | head -1 | cut -d . -f1)

# Another way ls *.txt | wc -l

# Reads file 1.txt
	if [ -f "$HOMEDIR/Tips/$NUM.txt" ]; then
#	echo "I reached here"
		cat $HOMEDIR/Tips/$NUM.txt
	else
		echo "Tip doesnt exist"
	fi

# Adds one to NUM variable
	NUM=`expr $NUM + 1`

	echo $NUM>$HOMEDIR/.curtip
	if [ $NUM -gt $LAST ];
		then NUM=1 echo "1" > $HOMEDIR/.curtip
	fi
}


_main()
{
	_showTip
	echo "Show another Tip? Y/N "
	read input
	if [[ $input == 'Y' || $input == 'y' ]]; 
	then _main
	fi	
}

_main
######################### EOF

