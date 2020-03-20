require("minitest/autorun")
require('minitest/reporters')

require_relative("../karaoke_bar.rb")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup()

  end

end
