

class KaraokeBar

  attr_reader :name, :till

  def initialize(name, till, rooms)
    @name = name
    @till = till
    @rooms = rooms
    @drinks = Hash.new(0)
    @songs = []
    @age_limit = 18
    @drunk_limit = 16

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

  def cash_in(amount)
    @till += amount
  end


  def check_in(guest)
    for room in @rooms
      if (room.capacity > room.num_guests) && guest.afford(room.entry_fee)
        room.add_guest(guest)
        guest.spend(room.entry_fee)
        cash_in(room.entry_fee)
        return
      end
    end
  end

  def drink_stock(drink)
    return @drinks[drink]
  end

  def drink_add(drink)
    @drinks[drink] += 1
  end

  def drink_remove(drink)
    return if drink_stock(drink) < 1
    @drinks[drink] -= 1
  end

  def check_age(guest)
    return guest.age >= @age_limit
  end


  def check_drunkeness(guest)
    return guest.drunkeness <= @drunk_limit
  end

  

















end
