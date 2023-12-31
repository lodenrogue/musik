#! /usr/bin/env bash

# Command line music player

AUDIO_DIRECTORY="$HOME/audio"

function play_album() {
    if [[ -z "$1" ]]; then
        echo "error: must provide at least partial album name to play"
        exit 1
    fi

    album_path=$(find "$AUDIO_DIRECTORY" -type d -iname "*$1*" -print -quit)

    if [[ -z "$album_path" ]]; then
        echo "error: no album found matching name $1"
        exit 1
    else
        mpv --playlist="$album_path" --display-tags=Artist,Album,Title
    fi

}

function play() {
    if [[ -z "$1" ]]; then
        echo "error: must provide at least partial song name to play"
        exit 1
    fi

    if [[ "$1" == "-b" ]]; then
        play_album "$2"
        exit 0
    fi

    song_path=$(find "$AUDIO_DIRECTORY" -type f -iname "*$1*" -print -quit)

    if [[ -z "$song_path" ]]; then
        echo "error: no song found matching name $1"
        exit 1
    else
        mpv "$song_path" --display-tags=Artist,Album,Title
    fi
}

function download() {
    if [[ -z "$1" ]]; then
        echo "error: must provide video id/url or playlist url"
        exit 1
    fi

    youtube-dl -x --audio-format mp3 --add-metadata "$1"
}

function list_songs() {
    for artist in $(ls "$AUDIO_DIRECTORY" | sort -n); do
        echo "$artist"

        for item in $(ls "$AUDIO_DIRECTORY/$artist" | sort -n); do
            item_path="$AUDIO_DIRECTORY/$artist/$item"

            if [[ -d "$item_path" ]]; then
                echo "    - $item"

                for song in $(ls "$item_path" | sort -n); do
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
    play "$2" "$3"
elif [[ "$1" == "download" ]]; then
    download "$2"
else
    list_songs
fi
