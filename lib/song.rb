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
    @song = self.new
    @@all << @song
    @song
  end
  
  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end
  
  def self.create_by_name(name)
    @song = self.new_by_name(name)
    @song.save
    @song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}

  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      @song = name
      @song
    else
      @song = self.create_by_name(name)
      @song = name
      @song 
    end
    self.find_by_name(name) || self.create_by_name(name)

  end
  
  def self.alphabetical
    @songs_alpha = @@all.sort_by{|song| song.name}
    @songs_alpha
    
  end
  
  def self.new_from_filename(name)
    song = self.new
    song.artist_name = (name.split(" - ")[0])
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song
  end
  
  def self.create_from_filename(name)
# binding.pry    
    song = self.new
    song.artist_name = (name.split(" - ")[0])
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    @@all << song
    song
    
  end
  
  def self.destroy_all
    @@all = @@all.clear
    
  end

end
