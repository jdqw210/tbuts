#!/bin/sh

# tell user that they have started the twint batch user tweetgrabber and search script
echo "TBUTS INIT..."
echo""

# ask user to confirm start of script, define variable $RESP
read -p "twint batch user tweetgrabber search, shall we begin? (y/n) " RESP
echo ""
echo "This script reads from a file containing a list of usernames"
echo "to loop through. It uses twint (open source twitter intelligence"
echo "tool), so make sure you have that in working order before"
echo "you begin. GLHF"

# if user enters 'y', begin loops to read/search tweets and save them
if [ "$RESP" = "y" ]; then

	read -p "input name of .txt file to read from..." FILENAME
	read -p "input search term to use across accounts..." SEARCH

	# define variable $LINES as each line in a file $FILENAME, and start do loop
	
	LINES=$(cat $FILENAME)

	for LINE in $LINES;
	
		do
		
			echo "searching username $LINE, searchterm is $SEARCH..."
			twint -s $SEARCH -u $LINE >> ~/$LINE-$SEARCH.txt
			echo "complete, output is ~/$LINE-$SEARCH.txt"
			echo ""
					
		#--loop complete:
		done

	#--let user know the script has finished:
	echo "tbuts task complete."
	echo ""
			
else

	echo "exiting..."
	exit -1
	
fi