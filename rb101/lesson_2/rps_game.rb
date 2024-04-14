VALID_CHIOCES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('Congratz man, you won!!')
  elsif win?(computer, player)
    prompt('You lost to a computer, dummy')
  else
    prompt("It's a tie")
  end
end

choice = ''

loop do
  loop do
    prompt("Choose one: #{VALID_CHIOCES.join(', ')}")
    choice = gets.chomp

    if VALID_CHIOCES.include?(choice.downcase)
      break
    else
      prompt("thats not a valid choice.")
    end
  end

  computer_choice = VALID_CHIOCES.sample

  prompt("You chose #{choice}, and the computer choose #{computer_choice}.")

  display_result(choice, computer_choice)

  prompt('Do you want to play again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing, Goodbye!")
