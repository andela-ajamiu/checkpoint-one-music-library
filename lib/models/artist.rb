class Artist < Base
  @@all = []

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist ||= self
  end

  def genres
    @genres_store = []
    @songs.each do |song|
      @genres_store << song.genre unless @genres_store.include?(song.genre)
    end
    @genres_store
  end
end