class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts 'Enter wat u wanna do: '
    input = ''
    while input != 'exit'
      input = gets.chomp.downcase
      # puts input
      menu(input)
    end
  end

  def menu(input)
    case input
    when 'list songs'
      list_songs

    when 'list artists'
      list_artists

    when 'list genres'
      list_genres

    when 'play song'
      play_song(gets.to_i)

    when 'list artist'
      list_artist(gets)

    when 'list genre'
      list_genre(gets)

    else
      puts 'dmhjddgd'

    end
  end

  def list_songs
    Song.all.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name.to_s }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name.to_s }
  end

  def play_song(song_no)
    song = Song.all[song_no - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist(artist)
    Song.all.each do |song|
      if song.artist.name == artist
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre(genre)
    Song.all.each do |song|
      if song.genre.name == genre
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end
