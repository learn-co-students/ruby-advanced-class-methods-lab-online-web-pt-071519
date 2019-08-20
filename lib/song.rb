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
    song = Song.new
    self.all << song
    song
  end  
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name    
    song
  end
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name  
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    data = nil
    self.all.each do |song| 
      if song.name == name
        data = song
      end
    end
    data
  end
  
  def self.find_or_create_by_name(name)
    data = self.find_by_name(name)
    if data
      data
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
   data= self.all.map.sort_by {|lava| lava.name}
    data
  end
  
  def self.new_from_filename(filename)
    song = Song.new
    change = filename.split(" - ")
    change[1] = change[1].chomp(".mp3")
    song.name = change[1]
    song.artist_name = change[0]
    song
    
  end
  
  def self.create_from_filename(filename)
    song = Song.new
    change = filename.split(" - ")
    change[1] = change[1].chomp(".mp3")
    song.name = change[1]
    song.artist_name = change[0]
    self.all << song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
