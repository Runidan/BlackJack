# frozen_string_literal: true

class Player
  attr_accessor :cash, :cards

  def initialize(name)
    @cards = []
    @name = name
    @cash = 100
  end
end
