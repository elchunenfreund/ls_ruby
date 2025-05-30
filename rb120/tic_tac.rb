class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def risky_squares(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_identical_markers?(squares, marker)
        return line.select { |key| @squares[key].unmarked? }
      end
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end

  def two_identical_markers?(squares, marker)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 2
    markers.uniq.size == 1 && markers.first == marker
  end

  public

  def draw
    (1..9).each_slice(3) do |row|
      puts "     |     |"
      puts "  #{row.map { |key| @squares[key] }.join('  |  ')}  "
      puts "     |     |"
      puts "-----+-----+-----" unless row.last == 9
    end
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  COMPUTER_MARKER = "O"

  def initialize
    @board = Board.new
    @human = Player.new(choose_player_name, choose_player_marker)
    @computer = Player.new(computer_name_picker, COMPUTER_MARKER)
    @current_marker = @human.marker
    @player_grand_score = 0
    @computer_grand_score = 0
  end

  def play
    loop do
      display_welcome_message
      main_game
      grand_reset
      break unless play_again?
      display_goodbye_message
    end
  end

  private

  def main_game
    loop do
      display_board
      player_move
      display_result
      break if display_grand_winner
      display_grand_score
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def choose_player_name
    answer = nil
    puts "How would you like to be called?"
    loop do
      answer = gets.chomp
      break unless answer.empty?
      puts 'Please pick a valid name!!'
    end
    answer
  end

  def choose_player_marker
    marker = nil
    puts "What do you want your marker to be? (don't pick O, or more then one character)"
    loop do
      marker = gets.chomp
      break unless marker.empty? || marker == 'O' || marker.split.size > 1
      puts "Please pick a valid marker (don't pick O, or more then one character)"
    end
    marker
  end

  def computer_name_picker
    ['TicBot', 'TacMaster', 'X-Otron', 'ToeMatic', 'GridGuru', 'TicTacAI', 'VictoryBot'].sample
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!, #{human.name}!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye #{human.name}!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "#{human.name} is a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def joinor(arr, spacer = ', ', delimiter = 'or')
    if arr.size == 1
      arr[0]
    elsif arr.size == 2
      "#{arr[0]} #{delimiter} #{arr[1]}"
    else
      arr[-1] = "#{delimiter} #{arr.last}"
      arr.join("#{spacer}")
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def defense_move
    risky = board.risky_squares(human.marker)
    if risky && !risky.empty?
      board[risky.sample] = COMPUTER_MARKER
      true
    else
      false
    end
  end

  def offense_move
    winning = board.risky_squares(COMPUTER_MARKER)
    if winning && !winning.empty?
      board[winning.sample] = COMPUTER_MARKER
      true
    else
      false
    end
  end

  def computer_moves
    return if offense_move || defense_move
    board[board.unmarked_keys.sample] = COMPUTER_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
      @player_grand_score += 1
    when computer.marker
      puts "Computer won!"
      @computer_grand_score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_grand_score
    puts "#{human.name} score: #{@player_grand_score}, #{computer.name} score: #{@computer_grand_score}"
  end

  def display_grand_winner
    if @player_grand_score >= 5
      puts "Congratulations, you're the grand winner!"
      return true
    elsif @computer_grand_score >= 5
      puts "#{computer.name} is the grand winner. Better luck next time!"
      return true
    end
    false
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def grand_reset
    reset
    @player_grand_score = 0
    @computer_grand_score = 0
  end
  
  def reset
    board.reset
    @current_marker = human.marker
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play

