require 'pry'
class MP3Importer
  attr_accessor :path, :song, :artist 
  
  def initialize(path)
    @path = path 
    @song = song 
    @artist = artist 
  end 
  
  def files
    files = [ ]
   Dir.children(self.path).map do |file|
     files << file if file.length > 4
   end 
     files 
  end 
  
  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end 
  end 
  
end 