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
    song_name, artist_name, extra = filename.chomp(".mp3").split(" - ")
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end 
  
end 