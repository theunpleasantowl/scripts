cd ~/Services
if [ ! -f $(pwd)/wan.txt ]; then
    echo "" > wan.txt  ; sed -i "s/^.*/\n\n\n\n\n/" $(pwd)/wan.txt
fi

wan="$(wget ipecho.net/plain -O - -q)"
oldwan="$(sed -n 5p wan.txt)"

if [ "$wan" != "$oldwan" ]; then
	sed -i "5s/^.*/$wan/" $(pwd)/wan.txt
	msmtp -a default theunpleasantowl@gmail.com < wan.txt 
fi
