require("minitest/autorun")
require('minitest/reporters')

require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup()
    @song1 = Song.new("A little respect", "Erasure")
    @song2 = Song.new("Laid", "James")
    @guest1 = Guest.new("James", 20, 60, 0, @song1)
    @room1 = Room.new("Nearly 90s",  3, 30.00)

  end

  def test_room_getters
    assert_equal("Nearly 90s", @room1.name)
    assert_equal(3, @room1.capacity)
    assert_equal(30.00, @room1.entry_fee)
    assert_equal(0, @room1.tab)
  end

  def test_room_number_of_guests
    assert_equal(0, @room1.num_guests)
  end




end
