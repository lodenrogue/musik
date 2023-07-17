#! /usr/bin/env bash

# Command line music player

AUDIO_DIRECTORY="$HOME/audio"

function play() {
    if [[ -z "$1" ]]; then
        echo "Error: Must provide at least partial song name to play"
        exit 1
    fi

    song_path=$(find "$AUDIO_DIRECTORY" -type f -iname "*$1*" -print -quit)

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

        for item in $(ls "$AUDIO_DIRECTORY/$artist"); do
            item_path="$AUDIO_DIRECTORY/$artist/$item"

            if [[ -d "$item_path" ]]; then
                echo "    - $item"

                for song in $(ls "$item_path"); do
                    echo "        * $song"
                done
            else
                echo "    * $item"
            fi
        done
        echo ""
    done
}

if [[ "$1" == "play" ]]; then
    play "$2"
else
    list_songs
fi
