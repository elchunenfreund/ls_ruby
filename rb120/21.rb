class Card
  SUITS = ['H', 'D', 'S', 'C']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    suit_names = {
      'H' => 'Hearts',
      'D' => 'Diamonds',
      'S' => 'Spades',
      'C' => 'Clubs'
    }
    suit_names[@suit]
  end

  def ace?
    face == 'Ace'
  end

  def other_folks?
    guys = ['King', 'Queen', 'Jack']
    guys.include?(face)
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end

  def total
    total = 0
    cards.each do |card|
      total += card.face.to_i if card.face.to_i.is_a?(Integer)
      total += 11 if card.ace?
      total += 10 if card.other_folks?
    end

    # correct for Aces
    cards.select(&:ace?).count.times do
      total -= 10 unless total <= 21
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

class Participant
  include Hand

  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end

  def to_s
    name
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = name
  end

  def show_flop
    show_hand
  end
end

class Dealer < Participant
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts cards.first
    puts " ?? "
    puts ""
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def player_choice
    puts "Would you like to (h)it or (s)tay?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "Sorry, must enter 'h' or 's'."
    end
    answer
  end

  def player_stays?(answer)
    if answer == 's'
      puts "#{player} stays!"
      return true
    end
    false
  end

  def player_turn
    puts "#{player}'s turn..."

    loop do
      answer = player_choice
      break if player_stays?(answer)
      break if player.busted?

      # show update only for hit
      player.add_card(deck.deal_one)
      puts "#{player} hits!"
      player.show_hand
      break if player.busted?
    end
  end

  def dealer_stays?
    if dealer.total >= 17 && !dealer.busted?
      puts "#{dealer} stays!"
      return true
    end
    false
  end

  def dealer_turn
    puts "#{dealer}'s turn..."

    loop do
      break if dealer_stays?
      break if dealer.busted?
      # Dealer hits
      puts "#{dealer} hits!"
      dealer.add_card(deck.deal_one)
    end
  end

  def show_busted
    if player.busted?
      puts "It looks like #{player} busted! #{dealer} wins!"
    elsif dealer.busted?
      puts "It looks like #{dealer} busted! #{player} wins!"
    end
  end

  def show_cards
    player.show_hand
    dealer.show_hand
  end

  def show_result
    if player.total > dealer.total
      puts "It looks like #{player} wins!"
    elsif player.total < dealer.total
      puts "It looks like #{dealer} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def start
    loop do
      system 'clear'
      deal_cards
      show_flop

      player_turn
      if player.busted?
        show_busted
        if play_again?
          reset
          next
        else
          break
        end
      end

      dealer_turn
      if dealer.busted?
        show_busted
        if play_again?
          reset
          next
        else
          break
        end
      end

      # both stayed
      show_cards
      show_result
      play_again? ? reset : break
    end

    puts "Thank you for playing Twenty-One. Goodbye!"
  end
end

game = TwentyOne.new
game.start
