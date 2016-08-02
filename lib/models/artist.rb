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


  def save
    @@all << self
    self
  end


  def self.destroy_all
    @@all.clear
  end


  def self.create(name)
    Artist.new(name).save
  end


  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist ||= self
  end


  def genres
    @songs.each do |song|
      @genres_store << song.genre unless @genres_store.include?(song.genre)
    end
    @genres_store
  end
  
end