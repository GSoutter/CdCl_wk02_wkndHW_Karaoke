require("minitest/autorun")
require('minitest/reporters')

require_relative("../song.rb")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup
    @song1 = Song.new("A little respect", "Erasure")
  end

  def test_song_get_name
    assert_equal("A little respect", @song1.name)
  end

  def test_song_get_artist
    assert_equal("Erasure", @song1.artist)
  end

end
