class Genre < Base
  @@all = []

  def artists
    @artists_store = []
    @songs.each do |song|
      @artists_store << song.artist unless @artists_store.include?(song.artist)
    end
    @artists_store
  end
end