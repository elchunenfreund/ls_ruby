module Hand
  @hand = []
end

class Player < Participant
end

class Dealer < Participant
end

class Participant
  include Hand
  def initialize
    @hand = Hand.new
  end

  def hit
    Game::deck.deal
    puts "You choose to hit, your total is #{total}"
  end

  def stay
    puts "You choose to stay"
  end

  def busted?
    total > 21
  end

  def total
    values = hand.map {hand[1]}.sum

    sum = 0
    values.each do |value|
      if value == "A"
        sum += 11
      elsif value.to_i == 0 # J, Q, K
        sum += 10
      else
        sum += value.to_i
      end
    end

    values.select { |value| value == "A" }.count.times do
      sum -= 10 if sum > 21
    end
  end
end

class Deck
  attr_accessor :cards

  SUITS = ['H', 'D', 'S', 'C']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  BUST_VALUE = 21
  DEALER_MAX = 17

  def initialize
    @cards = SUITS.product(VALUES).shuffle
  end

  def deal(player)
    player.hand << cards.pop
  end
end

class Card
  def initialize
  end
end

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def deal_cards
    2.times do
      player.deal
      dealer.deal
    end
  end

  def show_initial_cards
    puts "Your hand is #{player.hand}"
  end

  def player_turn
    puts "Would you like to hit or stay (h/s)"
    answer = gets.chomp
    case answer
    when 'h'
      player.hit
    when 's'
      player.stay
    end
    if player.busted?
      puts "you busted, sorry"
    end
  end

  def dealer_turn
    loop do
      unless dealer.total > 17
        dealer.deal
      end
    end
    if dealer.busted?
      puts "the Dealer busted, you won!!"
    end
  end

  def start
    deal_cards
    show_initial_cards
    loop do
      player_turn
      break if player.busted?
      dealer_turn
      break if dealer.busted?
      show_result
    end
  end
end

Game.new.start


