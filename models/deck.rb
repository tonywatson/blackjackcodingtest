require_relative "card"

class Deck
  def initialize
    @cards = Array.new
    for name in self.names
      for suit in self.suits
        secondary_value = 0
        value = (name.is_a? String) ? 10 : name

        if name == "ace"
          secondary_value = 11
          value = 1
        end

        card = Card.new(name, suit, secondary_value, value)
        # puts card.face
        @cards << card
      end
    end

    self.shuffle
  end

  def cards
    @cards
  end

  def deal(orientation)
    unless @cards.size == 0
      card = @cards.shift
      card.set("orientation", orientation)

      return card
    end
  end

  def names
    numbers = self.values
    family = %w{jack queen king ace}

    numbers + family
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def suits
    %w{club diamond heart spade}
  end

  def values
    return *(2..10)
  end
end
