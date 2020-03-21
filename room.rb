

class Room

  attr_reader :name, :capacity, :entry_fee, :tab, :song_playing

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @entry_fee = entry_fee
    @song_playing = nil
    @guests = []
    @tab = 0
  end

  def num_guests
    return @guests.length
  end

  def change_song(song)
    @song_playing = song
  end

  def add_guest(guest)
    @guests.push(guest)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end









end
