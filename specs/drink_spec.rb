require("minitest/autorun")
require('minitest/reporters')

require_relative("../drink.rb")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Stoli", 3.50, 3)
  end

  def test_drink_get_name
    assert_equal("Stoli", @drink1.name)
  end

  def test_drink_get_price
    assert_equal(3.50, @drink1.price)
  end

  def test_drink_get_units
    assert_equal(3, @drink1.units)
  end

end
