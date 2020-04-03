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
    song_and_artist = filename.chomp(".mp3").split(" - ")
    song = Song.new(song_and_artist[1])
    song.artist_name = song_and_artist[0]
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    Artist.add_song(self)
  end 
  
end 