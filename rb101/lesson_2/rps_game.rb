VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

def prompt(message)
  puts "=> #{message}"
end

MOVES = { rock: ['scissors', 'lizard'],
          paper: ['rock', 'spock'],
          scissors: ['paper', 'lizard'],
          lizard: ['spock', 'paper'],
          spock: ['scissors', 'rock'] }

def win?(hash, first, second)
  hash[first.to_sym].include?(second)
end

def display_result(array, player, computer)
  if win?(array, player, computer)
    'player'
  elsif win?(array, computer, player)
    'computer'
  else
    prompt("It's a tie")
  end
end

choice = ''
player_score = 0
computer_score = 0

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

    result = display_result(MOVES, choice, computer_choice)

    case result
    when 'player'
      player_score += 1
    when 'computer'
      computer_score += 1
    end

    prompt("Your score is #{player_score}; computer score is #{computer_score}")

    if player_score == 3
      prompt('you are the grand winner')
      break
    elsif computer_score == 3
      prompt('you are the grand looser')
      break
    end
  end

  prompt('Do you want to play again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

  player_score = 0
  computer_score = 0
end

prompt("Thank you for playing, Goodbye!")
