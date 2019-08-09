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
    new_song = self.new

    new_song.save
    @@all << new_song
    new_song
  end

def self.new_by_name(song_title)
  new_song = self.new(name)
  new_song.name = song_title
end

def self.create_by_name(song_title)
  new_song = self.new
  new_song.name = name
  @@all << new_song
end

def self.find_by_name(song_title)
  @@all.find {|x| x == song_title}
end

def find_or_create_by_name(song_title)
    @@all.find do |x|
      if x == song_title
        name
      else
        nil
      end
    end
  end

end
