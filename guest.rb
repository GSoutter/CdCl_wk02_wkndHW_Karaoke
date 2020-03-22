

class Guest

  attr_reader :name, :age, :wallet, :drunkeness, :song_fav

  def initialize(name, age, wallet, drunkeness, song_fav)
    @name = name
    @age = age
    @wallet = wallet
    @drunkeness = drunkeness
    @song_fav = song_fav
  end


  def spend(money)
    @wallet -= money
  end

  def woo
    return "#{@name} goes Woooo"
  end

  def afford(amount)
    return @wallet >= amount
  end

  def drunk_increase(amount)
    @drunkeness += amount
  end








end
