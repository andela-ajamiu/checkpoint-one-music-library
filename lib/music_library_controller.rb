class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to Ruby Music Library"
    while true
      puts "Enter your choice:"
      input = gets.chomp.downcase.tr(' ', '_')
      break if input=="exit"
      send input
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

  def play_song
    puts "Please enter the song number: "
    song_no = gets.chomp.to_i
    song = Song.all[song_no - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "Please enter the artist\'s name: "
    artist_name = gets.chomp
    Song.all.each do |song|
      if song.artist.name == artist_name
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    puts "Please enter the artist\'s name: "
    genre_name = gets.chomp
    Song.all.each do |song|
      if song.genre.name == genre_name
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end