require "pry"
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
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|current_song| current_song.name == song_name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    what_we_want = file_name.split(".").first
    artist_name, song_title = what_we_want.split(" - ")

    song = Song.new
    song.name = song_title
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    @@all = []
  end


end
