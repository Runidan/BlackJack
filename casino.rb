# frozen_string_literal: true
require_relative 'player'
require_relative 'dealer'

class Casino
  BID = 10

  def initialize
    print 'Введите ваше имя:'
    name = gets.chomp
    @player = Player.new(name)
    @dialer = Dealer.new('dealer')
    @bank = 0
  end

  def game
    i = true
    while i
      deck = Deck.new
      player_play(deck)
      dealer_play(deck)
      puts game_result
      i = next_round
      @player.no_card
      @dialer.no_card
    end
  end

  private
  def player_play(deck)
    @player.cash -= 10
    @bank += 10
    @player.add_card(deck)
    @player.add_card(deck)
    statistic(@player)
    puts "Eщё карту?\n1 - Ещё\n2 - Пас"
    @player.add_card(deck) if gets.chomp.to_i == 1
    statistic(@player)
  end

  def dealer_play(deck)
    @dialer.cash -= 10
    @bank += 10
    @dialer.add_card(deck)
    statistic(@dialer)
  end

  def statistic(player)
    print "Игрок: #{player.name} Карты: "
    player.show_card
    print " Стоимость: #{player.count_card}\n"
  end

  def game_result
    if @player.count_card > 21 || (@dialer.count_card <= 21 && @player.count_card < @dialer.count_card)
      @dialer.cash += @bank
      @bank = 0
      return 'Вы проиграли этот раунд'
    elsif @player.count_card > @dialer.count_card
      @player.cash += @bank
      @bank = 0
      return 'Вы выиграли этот раунд'
    else
      @player.cash += @bank / 2
      @dialer.cash += @bank / 2
      @bank = 0
      return 'Ничья'
    end
  end

  def next_round
    return false unless check_balanc
    puts "На вашем счету #{@player.cash} $\nХотите играть еще?\n1 - Да\n2 - Нет"
    return true if gets.chomp.to_i == 1
    puts "Всего доброго"
    false
  end

  def check_balanc
    if @player.cash < BID
      puts "На вашем счету недостаточно для новой ставки. Вы проиграли" 
      return false
    elsif @dialer.cash < BID
      puts "Поздарвляю, вы выграли!!!\nНа счету диллера недостаточно для новой ставки" 
      return false
    end
  end 
end
