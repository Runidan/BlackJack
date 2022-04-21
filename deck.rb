# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = []
    rank = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    suit = %w[♥ ♦ ♣ ♠]
    rank.each do |r|
      suit.each { |s| @deck << Card.new(r, s) }
    end
  end

  def take_card
    rnd = Random.new
    @deck.delete_at(rnd.rand(0...@deck.size))
  end
end
