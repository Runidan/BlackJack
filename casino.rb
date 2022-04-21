# frozen_string_literal: true

class Casino
  def initialize
    print 'Введите ваше имя:'
    name = gets.chomp
    @player = Player.new(name)
    @dialer = Dialer.new('Dealer')
    @bank = 0
  end

  def count_card(player)
    sum = 0
    card_price = { "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, J: 10, Q: 10, K: 10, A: 11 } 
    ctr_sum -> (plr) do
      plr.cards.each { |card| sum += card_price[card.rank] }
    end 
    ctr_sum.call(player)
    if sum > 21
      card_price[:A] = 1
      sum = 0
      ctr_sum.call(player)
    end
    sum
  end
end
