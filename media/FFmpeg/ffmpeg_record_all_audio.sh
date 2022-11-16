#!/bin/bash

# Requiring exactly one argument for the audio file name. If not, exit.
[ ! $# -eq 1 ] && echo 'Requiring exactly one argument for the audio file name' && exit

NAME=${1}.mp3
SAVE_AT=${HOME}/audio

#echo "ffmpeg -f pulse -i default ${SAVE_AT}/${NAME}"
ffmpeg -f pulse -i default ${SAVE_AT}/${NAME}
