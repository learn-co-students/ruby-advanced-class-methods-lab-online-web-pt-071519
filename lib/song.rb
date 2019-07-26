require 'pry'
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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    # binding.pry
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
end
