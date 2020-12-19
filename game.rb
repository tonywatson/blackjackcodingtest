require_relative "models/blackjack"

g = BlackJack.new(1, 1)
g.first_deal
g.show_hands
g.await_player_action
