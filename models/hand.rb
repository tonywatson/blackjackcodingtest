class Hand
  def initialize
    @cards = Array.new
  end

  def cards
    @cards
  end

  #methods
  def aces
    self.cards.select { |card| card.name == "ace" }.count
  end

  def bust? 
    return (self.total > 21 && (self.total + self.secondary_total - self.aces) > 21)
  end

  def has_21?
    return (self.total + self.secondary_total - self.aces) == 21
  end

  def secondary_total
    self.cards.map(&:secondary_value).inject(0, &:+)
  end

  def total
    self.cards.map(&:value).inject(0, &:+)
  end
end
