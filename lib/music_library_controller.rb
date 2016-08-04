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
      send(input)
    end
  end


  def list_songs
    Song.all.each.with_index(1) { |song, index|
      puts "#{index}. #{song}" }
  end

  def list_artists
    Artist.all.each { |artist| puts "#{artist.name}" }
  end

  def list_genres
    Genre.all.each { |genre| puts "#{genre.name}" }
  end

  def play_song
    puts "Please enter the song number: "
    song_no = gets.chomp.to_i
    song = Song.all[song_no - 1]
    puts "Playing #{song}"
  end

  def list_artist
    puts "Please enter the artist\'s name: "
    artist_name = gets.chomp
    artist = Artist.find_by_name(artist_name)
    display_list(artist)    
  end

  def list_genre
    puts "Please enter the genre\'s name: "
    genre_name = gets.chomp
    genre = Genre.find_by_name(genre_name)
    display_list(genre)    
  end

  def display_list(class_instance)
    if class_instance
      class_instance.songs.each { |song| puts "#{song}" }
    else
      puts 'Name not Available'.red
    end
  end

end