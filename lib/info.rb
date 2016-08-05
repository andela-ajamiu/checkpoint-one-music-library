class Info

  def self.greetings
    puts <<-GREETINGS.cyan
      =============================================================
                        Welcome to Ruby Music Library
      =============================================================
      GREETINGS
  end


  def self.help
    puts <<-HELP.green
      =============================================================
                          List of available commands
      =============================================================
      "list songs" - To display all the Songs available in the library
      "list artists" - To display all Artists with one or more songs
      "list genres" - To display all the Genres of the songs
      "play song" - To play a specific Song with song number
      "list artist" - To display all Songs that belongs to an artist
      "list genre" - To display all songs that belongs to a genre
      "exit" - To exit the application
      HELP
    puts "Please enter any of the commands above....".cyan
  end

end