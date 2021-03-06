require 'pry'

class Artist
  attr_accessor :name, :song
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end 
  
  def songs
    Song.all.select {|songs| songs.artist == self}
  end 
  
  def add_song(song)
    song.artist = self
  end 
  
  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end

  def self.find(name)
    self.all.detect { |artist| artist.name == name }
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def print_songs
    self.songs.each {|song| puts song.name}
  end 
  
end 