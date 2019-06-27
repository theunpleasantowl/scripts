if [ ! -f $(pwd)/wan.txt ]; then
    printf "To: email@gmail.com\nFrom: sainsbury\nSubject:---NEW WAN---\n\n\n" > wan.txt
fi

wan="$(dig +short myip.opendns.com @resolver1.opendns.com)"
oldwan="$(sed -n 5p wan.txt)"

if [ "$wan" != "$oldwan" ]; then
	sed -i "5s/^.*/$wan/" $(pwd)/wan.txt
	msmtp -a default email@gmail.com < wan.txt
fi
