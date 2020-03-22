require("minitest/autorun")
require('minitest/reporters')

require_relative("../karaoke_bar.rb")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../drink.rb")



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup()
    @song1 = Song.new("A little respect", "Erasure")
    @song2 = Song.new("Laid", "James")
    @guest1 = Guest.new("James", 20, 60, 0, @song1)
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

  def test_Karaokoe_bar_check_guest_age
    assert(true, @karaoke_bar.check_age(@guest1))
  end





#"adds to karaoke_bar class: func drink_add, func drink_stock, func drunk_remove, func check in guest (with free check)"

end
