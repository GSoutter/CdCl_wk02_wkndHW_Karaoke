

class KaraokeBar

  attr_reader :name, :till

  def initialize(name, till, rooms)
    @name = name
    @till = till
    @rooms = rooms
    @drinks = Hash.new(0)
    @songs = []
  end

  def songs_num
    return @songs.length
  end

  def add_song(song)
    @songs.push(song)
  end



end
