class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end


  def self.all
    @@all
  end


  def self.destroy_all
    @@all.clear
  end


  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).save
  end


  def self.new_from_filename(filename)
    filename_array = filename.gsub(/.mp3/, "").split(" - ")
    artist = filename_array[0]
    song = filename_array[1]
    genre = filename_array[2]
    Song.new(song,
             Artist.find_or_create_by_name(artist),
             Genre.find_or_create_by_name(genre))
  end


  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end


  def save
    @@all << self
    self
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end


  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end