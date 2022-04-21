# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :cash

  def initialize(name)
    @cards = []
    @name = name
    @cash = 100
  end

  def add_card(deck)
    @cards << deck.take_card
  end

  def count_card
    sum = 0
    card_price = { "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, J: 10, Q: 10, K: 10, A: 11 } 
    carts_sum = -> { @cards.each { |card| sum += card_price[card.rank] } }
    carts_sum.call
    if sum > 21
      card_price[:A] = 1
      sum = 0
      carts_sum.call
    end
    sum
  end

  def show_card
    @cards.each { |card| print "#{card.string} " }
  end

  def no_card
    @cards.clear
  end
end
