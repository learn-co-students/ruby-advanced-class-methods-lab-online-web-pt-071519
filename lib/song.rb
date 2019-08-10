require 'pry'
class Song
  attr_accessor :name, :artist_name
  def self.create
   magic_carpet_ride = Song.new
   magic_carpet_ride.save 
   magic_carpet_ride
  end
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  def self.create_by_name(name)
      eruption = Song.new
    eruption.name = name 
    eruption.save
    eruption
    end
      @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
  end
  def self.find_by_name(name)
    self.all.detect{|song|song.name == name}
  end
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song  
    else
    song = self.create_by_name(name)
    return song 
    end
  
  end
  def self.alphabetical
    self.all.sort_by{|song|song.name}
  end  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    song_name = parts[1].gsub(".mp3","")
    artist_name = parts[0]
    song = Song.new 
    song.name = song_name
    song.artist_name = artist_name
    return song
  end
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    song_name = parts[1].gsub(".mp3","")
    artist_name = parts[0]
    song = Song.new 
    song.name = song_name
    song.artist_name = artist_name
    song.save
    return song
  end
  def self.destroy_all
    self.all.clear
  end

end