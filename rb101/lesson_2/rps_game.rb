VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

def prompt(message)
  puts "=> #{message}"
end

MOVES = { rock: ["scissors", "lizard"],
          paper: ['rock', 'spock'],
          scissors: ['paper', 'lizard'],
          lizard: ['paper', 'spock'],
          spock: ['scissors', 'rock'] }

def win?(hash, first, second)
  hash[first.to_sym].include?(second)
end

def choose_winner(array, player, computer)
  if win?(array, player, computer)
    'player'
  elsif win?(array, computer, player)
    'computer'
  else
    prompt("It's a tie")
  end
end

choice = ''
player_wins = 0
computer_wins = 0

loop do
  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp

      if VALID_CHOICES.include?(choice.downcase)
        break
      else
        prompt("thats not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}, and the computer choose #{computer_choice}.")

    result = choose_winner(MOVES, choice, computer_choice)

    case result
    when 'player'
      player_wins += 1
    when 'computer'
      computer_wins += 1
    end

    prompt("Player wins: #{player_wins}, Computer wins: #{computer_wins}")

    if player_wins == 3
      prompt('you are the grand winner')
      break
    elsif computer_wins == 3
      prompt('you are the grand looser')
      break
    end
  end

  player_wins = 0
  computer_wins = 0

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing, Goodbye!")
