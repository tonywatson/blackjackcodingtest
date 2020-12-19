require_relative "hand"

class Player
  def initialize(name)
    @hand = Hand.new
    @name = name
    @points = 0
  end

  def hand
    @hand
  end

  def name
    @name
  end

  def points
    @points
  end

  def bust?
    self.hand.bust?
  end

  def has_21?
    self.hand.has_21?
  end

  def total
    self.hand.total
  end

  def set(string, value)
    var_name = "@#{string}"
    self.instance_variable_set(var_name, value)
  end

  def to_s
    puts "#{self.name} (#{self.points} point#{self.points == 1 ? "" : "s"}): "
    self.hand.cards.each { |card| puts card.face }
    "\r\n"
  end
end
