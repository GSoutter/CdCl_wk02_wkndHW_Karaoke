

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



  def guests_total
    total = 0
    for room in @rooms
      total += room.num_guests
    end
    return total
  end

  def capacity_total
    total = 0
    for room in @rooms
      total += room.capacity
    end
    return total
  end



end
