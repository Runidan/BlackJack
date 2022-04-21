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

  def game
    deck = Deck.new
    player_play(deck)
    @dialer.add_card(deck)
    statistic(@dialer)
  end

  private
  def player_play(deck)
    @player.add_card(deck)
    @player.add_card(deck)
    statistic(@player)
    puts "Eщё карту?\n1 - Пас\n2 - Ещё"
    @player.add_card(deck) if gets.chomp.to_i == 2
    statistic(@player)
  end

  def statistic(player)
    print "Игрок: #{player.name} Карты: "
    player.show_card
    print " Стоимость: #{player.count_card}\n"
  end
end
