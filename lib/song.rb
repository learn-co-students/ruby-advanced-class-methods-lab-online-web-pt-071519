require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
def self.create
  song = self.new 
  song.save
  song
end 

def self.new_by_name(name) 
  song  = self.new 
  song.name = name 
  song 
end 

def self.create_by_name(name)
  song = self.create 
  song.name = name 
  song 
end 

def self.find_by_name(name)
 @@all.find{|song| song.name == name} 
  #@@all.each do |song|
    #if song.name == name 
     # return song
end 

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
end 

def self.alphabetical
  @@all.sort_by{|x| x.name}
end 

def self.new_from_filename(file_name)
  new_song = self.new 
  new_song.name = file_name.split(" - ")[1].split(".")[0]
  new_song.artist_name = file_name.split(" - ")[0]
  new_song
end 

def self.create_from_filename(file_name)
@@all << self.new_from_filename(file_name)
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
