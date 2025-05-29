class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (spock? && (other_move.rock? || other_move.scissors?)) ||
      (lizard? && (other_move.spock? || other_move.paper?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :moves

  def initialize
    set_name
    @moves = []
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts 'Sorry, must enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose between Rock, Paper, Scissors, Lizard, or Spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts 'Sorry invalid choice'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing my awesome game!!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    human.moves << human.move.to_s
    puts "#{computer.name} chose #{computer.move}."
    computer.moves << computer.move.to_s
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      @human.score += 1
    elsif computer.move > human.move
      puts "#{computer.name} won!"
      @computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_grand_winner
    if human.score >= 5
      puts "You are the grand winner"
    elsif computer.score >= 5
      puts "You are a very grand loser"
    else
      true
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    main_game_loop
    display_goodbye_message
  end

  private

  def main_game_loop
    loop do
      reset_scores
      play_rounds
      break unless play_again?
    end
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def play_rounds
    loop do
      play_one_round
      break unless display_grand_winner
    end
    moves_tracker
  end

  def moves_tracker
    puts "would you like to see all moves (y/n)"
    answer = gets.chomp.downcase
    return unless answer == 'y'
    puts "Your moves are #{human.moves}"
    puts "The computers moves are #{computer.moves}"
  end

  def play_one_round
    human.choose
    computer.choose
    display_moves
    display_winner
    display_score
  end
end

RPSGame.new.play
