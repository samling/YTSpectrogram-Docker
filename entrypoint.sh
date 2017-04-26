#!/bin/bash

hash=$YTID
dbhost=$DB_HOST
dbuser=$DB_USER
dbpass=$DB_PASS
dbname=$DB_NAME

echo $hash
echo $dbhost
echo $dbuser
echo $dbpass
echo $dbname

youtube-dl -x --audio-format flac -o "audio/%(id)s.%(ext)s" $hash

/usr/local/YTSpectrogram/YTSpectrogram $hash

