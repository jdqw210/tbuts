#--!/bin/sh

#--if user calls script incorrectly, let them know how to call it:
if [ $# -ne 2 ];
then
	echo "Usage: $0 usernames.txt searchterm";
	exit -1
fi

#--ask user to confirm start of script, define variable $resp:
echo ""
read -p "twint batch user tweetgrabber & search, shall we begin? (y/n) " resp
echo ""

#--if user enters 'y', begin loops to read/search tweets and save them:
if [ "$resp" = "y" ]; then

	echo "Searching for $2 from the list $1..."
	
	#--create dir for search results text files:
	mkdir ~/tbuts/results
	
	#--define variable $lines as each line in a file $1, and start do loop:
	
	lines=$(cat $1)

	for line in $lines;
	
		do
		
			echo "searching username $line, searchterm is $2..."
			twint -s $2 -u $line >> ~/tbuts/results/$line-$2.txt
			echo "Output is ~/tbuts/results/$line-$2.txt"
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