#!/bin/bash

# Script to show tips on each login/new terminal open

# Read current tip

HOMEDIR=/opt/totd/TipOfTheDay

_isTrue()
{
	STATUS=$(<$HOME/.TOTD)
	if [ $STATUS == '1' ]; then
		echo "Already Disabled!"
		exit 0
	else
		echo "1" > $HOME/.TOTD
	fi
}

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


_run()
{
	_showTip
	echo "Show another Tip? Y/N  Or Disable Totd type 'disable'"
	read input
	if [[ $input == 'Y' || $input == 'y' ]]; 
	then _main
	elif [ $input == 'disable' ]; then
	_isTrue
	else
	echo "Have a great day ahead!"	
	fi	
}

_main()
{
	clear
	if [ ! -f "$HOME/.TOTD" ]; then
		echo "0" > $HOME/.TOTD
	fi
	STATUS=$(<$HOME/.TOTD)
	if [ $STATUS == '0' ]; then
		_run
	else
		exit 0
	fi
}

_main
######################### EOF

