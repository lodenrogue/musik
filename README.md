# Musik

List and play music from the command line

## Set up

### Prerequisites

- mpv
- youtube-dl

On Mac they can be installed with:

```
brew install mpv
brew install youtube-dl
```

### Add music files

Add music files to a directory named audio in your home directory with the following structure

```
artist-name/song_name.extension

or

artist-name/album-name/song_name.extension
```

For example:

```
audio
├── avett-brothers
│   └── ballad_of_love_and_hate.mp3
├── ed-sheeran
│   └── divide
│       ├── castle_on_the_hill.mp3
│       ├── dive.mp3
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
    * ballad_of_love_and_hate.mp3

ed-sheeran
    - divide
        * caste_on_the_hill.mp3
        * dive.mp3

ren-x-chinchilla
    * chalk_outlines.mp3
    * how_to_be_me.mp3

```

### Play a song

You only need to give a partial name of the song you want to play

```
sh musik.sh play ballad
```

### Play an album

You only need to give a partial name of the album you want to play

```
sh musik.sh play -b divide
```

### Download a song

```
sh musik.sh download videoid
```

## Change the default audio directory

Change this line in the script:

```
AUDIO_DIRECTORY="$HOME/audio"
```
