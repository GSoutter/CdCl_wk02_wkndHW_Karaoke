

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

  def drink_in_stock(drink)
    return drink_stock(drink) > 0
  end

  def drink_remove(drink)
    return if drink_in_stock(drink) == false
    @drinks[drink] -= 1
  end

  def check_age(guest)
    return guest.age >= @age_limit
  end


  def find_guest(guest)
    for room in @rooms
      found_guest = room.find_guest(guest)
      if found_guest != nil
        return room, found_guest
      end
    end
    return nil, nil
  end


  def check_drunkeness(guest)
    return guest.drunkeness <= @drunk_limit
  end

  def drink_buy_tab(guest, drink)
    found = find_guest(guest)
    found_room = found[0]
    found_guest = found[1]
    return if found_guest == nil
    return if check_age(found_guest) == false
    return if check_drunkeness(found_guest) == false
    return if drink_in_stock(drink) == false
    drink_remove(drink)
    found_guest.drunk_increase(drink.units)
    found_room.tab_add(drink.price)
  end


  def check_out(room)
    tab_total = room.tab
    remaining_tab = room.tab_settle()
    if remaining_tab == nil
      room.remove_all_guests()
      @till +=tab_total
      return
    end
    tab_total -=remaining_tab
    @till += tab_total
    last_christmas = Song.new("Last Christmas", "Wham")
    room.change_song(last_christmas)
  end



end
