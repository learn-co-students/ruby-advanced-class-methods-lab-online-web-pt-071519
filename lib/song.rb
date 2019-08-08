require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    split_file = filename.split(" - ")
    song = self.new
    song.artist_name = split_file[0]
    song.name = split_file[1].delete_suffix(".mp3")
    song
  end
  
  def self.create_from_filename(filename)
    split_file = filename.split(" - ")
    song = self.create
    song.artist_name = split_file[0]
    song.name = split_file[1].delete_suffix(".mp3")
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end

end