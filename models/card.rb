class Card
  def initialize(name, suit, secondary_value, value)
    @name, @suit, @secondary_value, @value = name, suit, secondary_value, value
  end

  def name
    @name
  end

  def orientation
    @orientation
  end

  def suit
    @suit
  end

  def secondary_value
    @secondary_value
  end

  def value
    @value
  end

  # methods
  def face
    unless self.orientation == "up"
      return "face down"
    end

    "#{name} #{suit}"
  end

  def set(string, value)
    var_name = "@#{string}"
    self.instance_variable_set(var_name, value)
  end
end
