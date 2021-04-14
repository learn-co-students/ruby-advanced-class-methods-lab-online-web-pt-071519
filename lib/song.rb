require 'pry'
# https://repl.it/@corbincornelius/Advanced-Class-Properties
class Song
  attr_accessor :name, :artist_name
  @@all = []

  #Song.all #=> ["song_1", "song_2"]
  def self.all
    @@all
  end

  #instance.save pushes instance to @@all array
  def save
    # self.class is Song
    # self.class.all == Song.all
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    song
  end

  def self.find_by_name(song_title)
    # binding.pry
    self.all.find do |song|
      song.name == song_title
    end
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    #file = "Thundercat - For Love I Come.mp3"
    # binding.pry
    segment = file.split(" - ")
    artist_name = segment[0]
    title = segment[1].split(".")
    song_title = title[0]

    song = self.new
    song.name = song_title
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    #file = "Thundercat - For Love I Come.mp3"
    # binding.pry
    segment = file.split(" - ")
    artist_name = segment[0]
    title = segment[1].split(".")
    song_title = title[0]

    song = self.create
    song.name = song_title
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
