class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end


  def call
    Info.greetings
    while true
      Info.help
      input = gets.chomp.downcase.tr(" ", "_")
      break if input=="exit"
      send(input)
    end
  end


  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}".yellow
    end
  end


  def list_artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}".yellow
    end
  end


  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}".yellow
    end
  end


  def play_song
    puts "Please enter the song number:".yellow
    song_no = gets.chomp.to_i
    if song_no < 1 || song_no > Song.all.size
      puts "Please enter a song number between 1-#{Song.all.size}".red
      play_song
    else
      song = Song.all[song_no - 1]
      puts "Playing #{song}".yellow
    end
  end


  def list_artist
    puts "Please enter the artist\'s name:".yellow
    artist_name = gets.chomp
    artist = Artist.find_by_name(artist_name)
    display_list(artist)
  end


  def list_genre
    puts "Please enter the genre\'s name:".yellow
    genre_name = gets.chomp.downcase
    genre = Genre.find_by_name(genre_name)
    display_list(genre)    
  end


  def display_list(class_instance)
    if class_instance == nil
      puts "#{class_instance} does not exist".red
    else
      class_instance.songs.each.with_index(1) do |song, index|
      puts "#{index}. #{song}".yellow
      end
    end
  end

  def method_missing?(_method_name, *_args)
    puts "The command you entered is invalid"
  end  

end