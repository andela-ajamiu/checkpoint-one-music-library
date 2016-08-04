class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end


  def files
    Dir.glob(File.join(@path, '*.mp3')).map { |f| File.basename(f) }
  end  


  def import
    files.each { |file| Song.create_from_filename(file) }
  end
  
end
