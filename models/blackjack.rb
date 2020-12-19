require_relative "deck"
require_relative "hand"
require_relative "player"

class BlackJack
  def initialize(num_of_players, num_of_decks)
    @dealer = Player.new("Dealer")
    @decks = Array.new
    @players = Array.new

    while num_of_players > 0
      @players << Player.new("Player #{num_of_players}")

      num_of_players -= 1
    end

    while num_of_decks > 0
      @decks << Deck.new

      num_of_decks -= 1
    end

    @deck = @decks[0]
  end

  def dealer
    @dealer
  end

  def deck
    @deck
  end

  def decks
    @decks
  end

  def players
    @players
  end

  def await_player_action
    if self.check_win?
      self.deal_again
      self.await_player_action
    end

    for player in self.players
      puts "#{player.name} Hit or Hold?"
      option = gets

      puts

      if option.downcase.chomp.eql? "hit"
        self.deal(player)
        self.show_hands
      end

      self.await_player_action
    end
  end

  def check_win?
    for player in self.players
      if player.has_21? && !dealer.has_21?
        player.set("points", player.points + 1)
        puts "#{player.name} wins 1 point"
        return true
      elsif player.bust?
        dealer.set("points", dealer.points + 1)
        puts "#{player.name} bust"
        self.deal_again
      end
    end
    return false
  end

  def clear_hands
    dealer.set("hand", Hand.new)
    for player in self.players
      player.set("hand", Hand.new)
    end
  end

  def deal(player_hit)
    unless player_hit
      for player in @players
        # deal to player card face up
        player.hand.cards << @deck.deal("up")
      end
      return
    end

    player_hit.hand.cards << @deck.deal("up")
  end

  def deal_again
    puts "", "Deal again? (y/n)"
    option = gets

    if option.chomp.eql? "y"
      puts
      self.clear_hands
      self.first_deal
      self.show_hands
    else
      puts "Game over!"
      return
    end
  end

  def first_deal
    # deal to self face down
    @dealer.hand.cards << @deck.deal("down")
    self.deal(false)

    # deal to all face up
    @dealer.hand.cards << @deck.deal("up")
    self.deal(false)
  end

  def show_hands
    puts self.dealer
    puts self.players
  end
end
