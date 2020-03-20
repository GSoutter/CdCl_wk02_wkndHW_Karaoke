

class Drink

  attr_reader :name, :price, :units


  def initialize(name, price, units)
    @units = units
    @price = price
    @name = name
  end
end
