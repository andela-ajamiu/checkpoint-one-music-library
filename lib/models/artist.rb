class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres_store = []
  end


  def self.all
    @@all
  end


  def self.destroy_all
    @@all.clear
  end


  def self.create(name)
    Artist.new(name).save
  end


  def save
    @@all << self
    self
  end


  def add_song(song)
    if !(@songs.include?(song))
      @songs << song
    end
    song.artist ||= self
  end


  def genres
    @songs.each do |song|
      if !(@genres_store.include?(song.genre))
        @genres_store << song.genre
      end
    end
    @genres_store
  end
  
end