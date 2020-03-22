require("minitest/autorun")
require('minitest/reporters')

require_relative("../guest.rb")
require_relative("../song.rb")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup()

    @song1 = Song.new("A little respect", "Erasure")
    @guest1 = Guest.new("James", 20, 60, 0, @song1)
  end

  def test_Guest_getters
    assert_equal("James", @guest1.name)
    assert_equal(20, @guest1.age)
    assert_equal(60, @guest1.wallet)
    assert_equal(0, @guest1.drunkeness)
    assert_equal(@song1, @guest1.song_fav)
  end

  def test_Guest_wallet_spend
    @guest1.spend(40)
    assert_equal(20, @guest1.wallet)
  end

  def test_guest_woo
    assert_equal("James goes Woooo", @guest1.woo)
  end

  def test_guest_afford__true
    assert(@guest1.afford(10))
  end

  def test_guest_afford__false
    assert_equal(false, @guest1.afford(70))
  end









end
