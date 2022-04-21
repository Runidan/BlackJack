# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def add_card(deck)
    @cards << deck.take_card
  end

  def add_card(deck)
    @cards << deck.take_card
    @cards << deck.take_card
    if count_card >= 17
      @cards << deck.take_card
    end
  end
end
