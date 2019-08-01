require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    song.save 
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    @@all << song
    song
    #binding.pry
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
    #binding.pry
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song 
      song 
    else 
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical 
    @@all.sort_by {|a| a.name }
    #binding.pry
  end
  
  def self.new_from_filename(filename)
    rows = filename.split(" - ")
    artist = rows[0]
    row = rows[1].partition('.')
    title = row[0]
    song = self.new 
    song.name = title 
    song.artist_name = artist
    song
    #binding.pry
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song 
    song
  end
  
  def self.destroy_all 
    @@all.clear
  end

end

























