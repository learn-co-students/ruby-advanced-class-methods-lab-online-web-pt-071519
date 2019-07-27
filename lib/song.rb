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
    new_song = Song.new 
    new_song.save
    new_song
  end   
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end  
  
  def self.create_by_name(song_name)
    song = self.create 
    song.name = song_name
    song
  end  
  
  def self.find_by_name(song_name)
    self.all.find{ |s| s.name == song_name}
  end  
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical
    self.all.sort_by{ |s| s.name}
  end 
  
  def self.new_from_filename(filename)
    file_parts = filename.split(" - ")
    artist_name = file_parts[0]
    song_name = file_parts[1].gsub(".mp3", "")
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end 
  
    def self.create_from_filename(filename)
    file_parts = filename.split(" - ")
    artist_name = file_parts[0]
    song_name = file_parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    @@all.clear
  end   
end
