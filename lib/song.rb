class Song 
  attr_accessor :name, :artist, :path 
  @@all = []
  
  def initialize(name)
    @name = name 
    @artist = artist
    save
  end 
    
  def save
    @@all << self
  end
    
  def self.all
    @@all 
  end 
  
  def self.new_by_filename(filename)
    artist_name, song_name, extra = filename.split(" - ")
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
  end
  
end 