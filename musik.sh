#! /usr/bin/env bash

# Command line music player

AUDIO_DIRECTORY="$HOME/audio"

function play() {
    if [[ -z "$1" ]]; then
        echo "Error: Must provide at least partial song name to play"
        exit 1
    fi
    
    song_path=$(find "$AUDIO_DIRECTORY" -iname "*$1*")

    if [[ -z "$song_path" ]]; then
        echo "No song found matching name $1"
        exit 1
    else
        open "$song_path"
    fi
}

function list_songs() {
    for artist in $(ls "$AUDIO_DIRECTORY"); do
        echo "$artist"

        for song in $(ls "$AUDIO_DIRECTORY/$artist"); do
            echo "    - $song"
        done
        echo ""
    done
}

if [[ "$1" == "play" ]]; then
    play "$2"
else
    list_songs
fi
