require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    variable_song = self.new 
    variable_song.save
    variable_song
  end 
# def name=(name) 
#   @name = name 
# end 

# def name 
#   @name
# end 
 def self.new_by_name(song_name)
   song_by_name = self.new 
   song_by_name.name = song_name 
   song_by_name
 end
   def self.create_by_name(song_name)
   song_by_name = self.create 
   song_by_name.name = song_name 
   song_by_name
 end
 
 def self.find_by_name(title)
  # binding.pry
 self.all.find {|song| song.name == title }
 
 end
 
 def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end
   
   def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    # binding.pry
    self.class.all << self
  end

end
