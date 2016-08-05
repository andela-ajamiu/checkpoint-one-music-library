# Ruby Music Library 
<a href="https://codeclimate.com/github/andela-ajamiu/checkpoint-one-music-library"><img src="https://codeclimate.com/github/andela-ajamiu/checkpoint-one-music-library/badges/gpa.svg" /></a>
<a href="https://codeclimate.com/github/andela-ajamiu/checkpoint-one-music-library"><img src="https://codeclimate.com/github/andela-ajamiu/checkpoint-one-music-library/badges/issue_count.svg" /></a>
<a href="https://travis-ci.org/andela-ajamiu/checkpoint-one-music-library"><img src="https://api.travis-ci.org/andela-ajamiu/checkpoint-one-music-library.svg?branch=master" /></a>

A command line Music Library application implemented with ruby. The application accepts a file path to the music mp3 files, parses them and is able to display, search, create and 'play' the music. The application uses the specified path to import music files with names having the format below:

```sh
    Artist-Name - Song-Name - Genre-Name.mp3
```
It then gives the user the ability to list the various songs, artists or genres, play a specific song or search via song, artist or genre

## Getting Started

1.  Clone this repositoy:
    ```sh
    $ git clone https://github.com/andela-ajamiu/checkpoint-one-music-library.git
    ```

2.  Navigate into the cloned repository folder:

    ```sh
    $ cd checkpoint-one-music-library
    ```

3.  Install Dependecies:
    ```sh
    $ bundle install
    ```

## Usage
Still in the checkpoint-one-music-library folder, run:
```sh
$ bin/musiclibrary
```

## List of commands
*  list songs - Displays All Imported Songs  
*  list genres - Displays All Genres from Imported Songs  
*  list artists - Displays All Artists from Imported songs  
*  play song - Play a particular Song with Song number  
*  list artist - Displays Songs with artist name  
*  list genre - Displays Songs with specified genre name  
   

## Example command usage:
1. `list songs`:
    
    ```bash
     ♯ ~ list songs
    1. Action Bronson - Larry Csonka - indie
    2. Adele - Rolling In the Deep - folk
    3. Adele - Someone Like You - country
    4. AraabMuzik - Streetz Tonight - folk
    5. ASAP Rocky - Peso - dance
    6. Atlas Sound - Mona Lisa - pop
    7. Azealia Banks - 212 - hip-hop
    8. Battles - Ice Cream (Feat. Matias Aguayo) - rock
    9. Beyonce - 1+1 - house
    ...
    ```
2. `play song` e.g. enter "1" for the first song:
    
    ```bash
     ♯ ~ play song
    Please enter the song number.
    1
    Playing Action Bronson - Larry Csonka - indie

    ```
3. `list artist` e.g enter "Adele":
    
    ```bash
     ♯ ~ list artist
    Please enter the artist name.
    Adele
    Adele - Rolling In the Deep - folk
    Adele - Someone Like You - country
    ```

## Dependecies
gem 'rspec'<br>
gem 'pry'<br>
gem 'require_all'<br>
gem 'colorize'<br>
you can also refer to the Gemfile for list of dependencies.


## Running Tests
1. Make sure "rspec" is installed by running:
    ```sh
        $ bundle show rspec
    ```
    If a path is listed, then rspec is installed.

2. Run rspec through bundle:
    ```sh
        $ bundle exec rspec spec
    ```