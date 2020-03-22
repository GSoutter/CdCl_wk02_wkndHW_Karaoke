

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


  def tab_add(amount)
    @tab += amount
  end

  def find_guest(guest)
    return @guests.find  {|x| x == guest}
  end

  def tab_settle()
    for guest in @guests
      if guest.wallet >= @tab
        guest.spend(@tab)
        @tab = 0
        return
      else
        @tab -= guest.wallet
        guest.spend(guest.wallet)
      end
    end
    return @tab
  end

  def remove_all_guests()
    @guests = []
  end

  def change_song_check(song)
    change_song(song)
    woo_return = ""
    for guest in @guests
      if guest.song_fav == song
        woo_return += guest.woo
      end
    end
    return woo_return

  end





end #class end
