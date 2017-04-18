#!/bin/bash

hash="$(printf "$1" | cut -d'=' -f2)"

youtube-dl -x --audio-format flac -o "audio/%(id)s.%(ext)s" $hash

/usr/local/YTSpectrogram/YTSpectrogram $hash
