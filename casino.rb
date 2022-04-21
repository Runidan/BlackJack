# frozen_string_literal: true
require_relative 'player'
require_relative 'dealer'

class Casino
  def initialize
    print 'Введите ваше имя:'
    name = gets.chomp
    @player = Player.new(name)
    @dialer = Dealer.new('dealer')
    @bank = 0
  end



  private

end
