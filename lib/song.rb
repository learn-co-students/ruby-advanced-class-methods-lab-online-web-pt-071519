require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song=self.new
    song.save
      song
  end

  def self.new_by_name (song_name)
    new_song=self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name (song_name)
    new_song=self.create
    new_song.name=song_name
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|search_name|search_name.name==name}
  end

  def self.find_or_create_by_name(song)
      self.find_by_name(song) ||
      self.create_by_name(song)
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  
  end

  def self.new_from_filename (mp3_file)
    new_song=self.new
    new_song.artist_name=mp3_file.split(" - ")[0]
    new_song.name=mp3_file.split(" - ")[1].split(".")[0]
    new_song
  end

  def self.create_from_filename (mp3_file)
    new_song=self.new
    new_song.artist_name=mp3_file.split(" - ")[0]
    new_song.name=mp3_file.split(" - ")[1].split(".")[0]
    @@all<<new_song
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
