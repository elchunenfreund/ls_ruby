SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
BUST_VALUE = 21
DEALER_MAX = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
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
    sum -= 10 if sum > BUST_VALUE
  end

  sum
end

def busted?(cards)
  total(cards) > BUST_VALUE
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > BUST_VALUE
    :player_busted
  elsif dealer_total > BUST_VALUE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards, player, dealer)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    dealer += 1
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    player += 1
    prompt "Dealer busted! You win!"
  when :player
    player += 1
    prompt "You win!"
  when :dealer
    dealer += 1
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end

  # Display scores after updating
  prompt "The player score is #{player} and the dealer score is #{dealer}"

  # Return updated scores
  return player, dealer
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  grand_ending(answer)
  answer.downcase.start_with?('y')
end

def grand_ending(str)
  if str.downcase.start_with?('n')
    prompt "Thank you for playing Twenty-One! Good bye!"
  end
end

player_score = 0
dealer_score = 0

loop do
  loop do
    prompt "Welcome to Twenty-One!"

    # initialize vars
    deck = initialize_deck
    player_cards = []
    dealer_cards = []


    # initial deal
    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    prompt "Dealer has #{dealer_cards[0]} and ?"
    prompt "You have: #{player_cards[0]} and #{player_cards[1]}"
    prompt "for a total of #{total(player_cards)}."

    # player turn
    loop do
      player_turn = nil
      loop do
        prompt "Would you like to (h)it or (s)tay?"
        player_turn = gets.chomp.downcase
        break if ['h', 's'].include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'."
      end

      if player_turn == 'h'
        player_cards << deck.pop
        prompt "You chose to hit!"
        prompt "Your cards are now: #{player_cards}"
        prompt "Your total is now: #{total(player_cards)}"
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    if busted?(player_cards)
      player_score, dealer_score = display_result(dealer_cards, player_cards, player_score, dealer_score)
      play_again? ? next : break
    else
      prompt "You stayed at #{total(player_cards)}"
    end

    # dealer turn
    prompt "Dealer turn..."

    loop do
      break if total(dealer_cards) >= DEALER_MAX

      prompt "Dealer hits!"
      dealer_cards << deck.pop
      prompt "Dealer's cards are now: #{dealer_cards}"
    end

    if busted?(dealer_cards)
      prompt "Dealer total is now: #{total(dealer_cards)}"
      player_score, dealer_score = display_result(dealer_cards, player_cards, player_score, dealer_score)
      play_again? ? next : break
    else
      prompt "Dealer stays at #{total(dealer_cards)}"
    end

    # both player and dealer stays - compare cards!
    puts "=============="
    prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
    prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
    puts "=============="

    player_score, dealer_score = display_result(dealer_cards, player_cards, player_score, dealer_score)
    if player_score == 5
      prompt "You are the grand winner!"
      break
    elsif dealer_score == 5
      prompt 'You are the grand looser!'
      break
    end
  end
  break unless play_again?
end
