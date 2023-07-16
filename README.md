# Musik

List and play music from the command line

## Set up

Add music files to a directory named audio in your home directory with the following structure

```
artist_name/song_name.extension
```

For example:

```
audio
├── avett-brothers
│   └── ballad_of_love_and_hate.mp3
└── ren-x-chinchilla
    ├── chalk_outlines.mp3
    └── how_to_be_me.mp3
```

## Usage

### List songs grouped by artist:

```
sh musik.sh
```

Output:

```
avett-brothers
    - ballad_of_love_and_hate.mp3

ren-x-chinchilla
    - chalk_outlines.mp3
    - how_to_be_me.mp3

```

### Play a song

You only need to give a partial name of the song you want to play

```
sh musik.sh play ballad
```

## Change the default audio directory

Change this line in the script:

```
AUDIO_DIRECTORY="$HOME/audio"
```
