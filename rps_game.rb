=begin 
Rock, Paper, Scissors is a game that is played by two players and each playesr gets a turn to choose one of three moves, rock, paper, 
scissors, the chosen moves will then be compared to see who wins acording to the following rules
- rock beats scissors
- scissors beats paper
- paper beats rock
If both players choose the same move its a tie

Nouns: player, move, rule
Verbs: choose, compare

Player
- choose

Move
Rule

- compare
=end
class Player
  attr_accessor :move, :name
  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      n = ''
      loop do 
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts 'Sorry, must enter a value.'
      end
      self.name = n
    else
      self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do 
        puts "Please choose between Rock, Paper, or Scissors:"
        choice = gets.chomp.downcase
        break if ['rock', 'paper', 'scissors'].include? choice
        puts 'Sorry invalid choice'
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class Move
  def initialize
  end
end

class Rule
  def initialize
  end
end

def compare(mave1, move2)
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def dispaly_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def dispaly_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Good Bye!"
  end

  def dispaly_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    
    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    end

    def play_again?
      answer = nil
      loop do
        puts "Would you like to play again (y/n)"
        answer = gets.chomp
        break if ['y', 'n'].include? answer.downcase
        puts "Sorry, must be y or n."
      end
      return true if answer == 'y'
      return false
    end
  end

  def play
    dispaly_welcome_message
    loop do
      human.choose
      computer.choose
      dispaly_winner
      break unless play_again?
    end
    dispaly_goodbye_message
  end
end

RPSGame.new.play
