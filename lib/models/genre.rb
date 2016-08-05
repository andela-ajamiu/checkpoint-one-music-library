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


  def self.destroy_all
    @@all.clear
  end


  def self.create(name)
    Genre.new(name).save
  end


  def save
    @@all << self
    self
  end


  def artists
    @songs.each do |song|
      if !(@artists_store.include?(song.artist))
        @artists_store << song.artist
      end
    end
    @artists_store
  end

end
