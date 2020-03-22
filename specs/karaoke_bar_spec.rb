require("minitest/autorun")
require('minitest/reporters')

require_relative("../karaoke_bar.rb")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../drink.rb")



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class KaraokeBarTest < MiniTest::Test

  def setup()
    @song1 = Song.new("A little respect", "Erasure")
    @song2 = Song.new("Laid", "James")
    @guest1 = Guest.new("James", 20, 60, 0, @song1)
    @guest2 = Guest.new("Tyrone", 14, 60, 20, @song2)
    @guest3 = Guest.new("Richie Rich", 14, 10000, 20, @song2)
    @room1 = Room.new("Nearly 90s",  3, 30.00)
    @room2 = Room.new("Pop",  5, 20.00)
    @drink1 = Drink.new("Stoli", 3.50, 3)
    @drink2 = Drink.new("Red Strip", 2.50, 3)
    @drink3 = Drink.new("Gordons Gin", 4.50, 2)
    # add drinks hash. @drinks = Hash.new(0)


    @karaoke_bar = KaraokeBar.new("Annie are you", 1000.00, [@room1, @room2])


  end

  def test_Karaokoe_bar_getters
    assert_equal("Annie are you", @karaoke_bar.name)
    assert_equal(1000, @karaoke_bar.till)
  end

  def test_song_add_to_array
    @karaoke_bar.add_song(@song1)
    assert_equal(1, @karaoke_bar.songs_num)
  end

  def test_Karaoke_bar_guests_total
    assert_equal(0, @karaoke_bar.guests_total)
  end

  def test_Karaoke_bar_guests_total__add_guest
    @room1.add_guest(@guest1)
    assert_equal(1, @karaoke_bar.guests_total)
  end

  def test_Karaoke_bar_capacity_total
    assert_equal(8, @karaoke_bar.capacity_total)
  end

  def test_Karaokoe_bar_cash_in
    @karaoke_bar.cash_in(30)
    assert_equal(1030, @karaoke_bar.till)

  end

  def test_Karaokoe_bar_check_in_charge
    @karaoke_bar.check_in(@guest1)
    assert_equal(1, @karaoke_bar.guests_total)
    assert_equal(30, @guest1.wallet)
    assert_equal(1030, @karaoke_bar.till)
  end

  def test_Karaokoe_bar_check_in_too_many
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    @karaoke_bar.check_in(@guest3)
    assert_equal(8, @karaoke_bar.guests_total)
  end



  def test_Karaokoe_bar_drink_add
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_add(@drink1)
    assert_equal(2, @karaoke_bar.drink_stock(@drink1))
  end

  def test_Karaokoe_bar_drink_remove_added_then_removed
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_remove(@drink1)
    assert_equal(1, @karaoke_bar.drink_stock(@drink1))
  end

  def test_Karaokoe_bar_drink_remove_added_then_removed_three
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_remove(@drink1)
    @karaoke_bar.drink_remove(@drink1)
    @karaoke_bar.drink_remove(@drink1)
    @karaoke_bar.drink_remove(@drink1)
    assert_equal(0, @karaoke_bar.drink_stock(@drink1))
  end

  def test_Karaokoe_bar_check_guest_age__old
    assert_equal(true, @karaoke_bar.check_age(@guest1))
  end


  def test_Karaokoe_bar_check_guest_age__young
    assert_equal(false, @karaoke_bar.check_age(@guest2))
  end

  def test_Karaokoe_bar_check_guest_age__old
    assert_equal(true, @karaoke_bar.check_age(@guest1))
  end


  def test_Karaokoe_bar_check_guest_drunkeness__sober
    assert_equal(true, @karaoke_bar.check_drunkeness(@guest1))
  end

  def test_Karaokoe_bar_check_guest_drunkeness__drunk
    assert_equal(false, @karaoke_bar.check_drunkeness(@guest2))
  end

  def test_Karaoke_bar_guest_buys_drink
    @karaoke_bar.check_in(@guest1)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_buy_tab(@guest1, @drink1)

    assert_equal(1, @karaoke_bar.drink_stock(@drink1))
    assert_equal(30, @guest1.wallet)
    assert_equal(3.5, @room1.tab)
    assert_equal(3, @guest1.drunkeness)

  end

  def test_Karaoke_bar_guest_buys_drink_drunk
    @karaoke_bar.check_in(@guest1)
    @karaoke_bar.check_in(@guest2)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_buy_tab(@guest2, @drink1)

    assert_equal(2, @karaoke_bar.drink_stock(@drink1))
    assert_equal(30, @guest2.wallet)
    assert_equal(0, @room1.tab)
    assert_equal(20, @guest2.drunkeness)
    #felt like this check shouldn't work. Thought I was being safe making sure I was reference the variable but like arrays editing an object in one place will modify it everywhere.
    #is this only a problem with my test due to instance variables? Or will this be a problem everywhere.
    #example, Oject1(class a) within object2(class b) within object3(class c). You can write a function in 3 that will edit objectC without B
    #how do you safely have an array of objects without them being editible from anywhere.
  end

  def test_Karaokoe_bar_check_out_room
    @karaoke_bar.check_in(@guest1)
    @karaoke_bar.check_in(@guest2)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_buy_tab(@guest1, @drink1)
    @karaoke_bar.check_out(@room1)
    assert_equal(0, @karaoke_bar.guests_total)
    assert_equal(0, @room1.tab)
    assert_equal(1063.5, @karaoke_bar.till)
  end

  def test_Karaokoe_bar_check_out_room_cant_afford
    @karaoke_bar.check_in(@guest1)
    @karaoke_bar.check_in(@guest2)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_add(@drink1)
    @karaoke_bar.drink_buy_tab(@guest1, @drink1)
    @room1.tab_add(1000)

    @karaoke_bar.check_out(@room1)
    assert_equal(2, @karaoke_bar.guests_total)
    assert_equal(943.5, @room1.tab)
    assert_equal(1120, @karaoke_bar.till)
  end











end #test Class end
