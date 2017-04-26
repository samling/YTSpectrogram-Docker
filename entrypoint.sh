#!/bin/bash

hash=$YTID
echo $hash

youtube-dl -x --audio-format flac -o "audio/%(id)s.%(ext)s" $hash

/usr/local/YTSpectrogram/YTSpectrogram $hash

