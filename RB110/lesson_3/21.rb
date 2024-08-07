SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(str)
  puts "=> #{str}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def pick_card(deck)
  deck.delete(deck.sample)
end

def start_game(player, dealer, deck)
  2.times do
    player << pick_card(deck)
    dealer << pick_card(deck)
  end
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

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

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  return true if total(cards) > 21
end

def choose_winner(player, dealer)
  total(player) > total(dealer)
end

def display_winner(player, dealer)
  if choose_winner(player, dealer)
    prompt 'You are the winner'
  else
    prompt 'You are the looser'
  end
end

loop do
  player = []
  dealer = []
  deck = initialize_deck
  start_game(player, dealer, deck)
  # player turn
  answer = nil
  loop do
    prompt "Your hand is #{player} and the dealer's hand is #{dealer[0]} & some
    Your total is #{total(player)}"
    break if answer == 'stay' || busted?(player)
    prompt "hit or stay?"
    answer = gets.chomp
    player << pick_card(deck) unless answer == 'stay'
  end

  if busted?(player)
    prompt 'You busted and therefor lost!'
    break
  else
    puts "You chose to stay!"
  end

  # Dealer turn
  loop do
    break if total(dealer) >= 17
    dealer << pick_card(deck)
  end

  if busted?(dealer)
    prompt 'Dealer has busted you won'
  end
  prompt "your deck is #{player} and your total is #{total(player)},
  and the dealer's deck is #{dealer} and his total is #{total(dealer)}"
  display_winner(player, dealer) unless busted?(player) || busted?(dealer)
  prompt 'Do you want to play agian? (y or n)'
  answer = gets.chomp.downcase
  break unless answer == 'y'
end
