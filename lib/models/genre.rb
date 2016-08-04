class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artists_store = []
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
    Genre.new(name).save
  end


  def artists
    @songs.each do |song|
      @artists_store << song.artist unless @artists_store.include?(song.artist)
    end
    @artists_store
  end

end
