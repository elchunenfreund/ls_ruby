<<<<<<< HEAD
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, sep = ', ', ender = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{ender} ")
  else
    arr[-1] = "#{ender} #{arr.last}"
    arr.join(sep)
  end
end

def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER} and the Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def risky_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def winning_square(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = winning_square(line, brd)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = risky_square(line, brd)
      break if square
    end
  end

  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  square ||= empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_winner(winner)
  case winner
  when 'Player'
    prompt 'Player won!'
  when 'Computer'
    prompt 'Computer won!'
  else
    prompt 'It\'s a tie!'
  end
end

def grand_total(player, computer)
  if player == 5
    prompt "You are the grand winner!"
    true
  elsif computer == 5
    prompt "You are the grand loser!"
    true
  end
end

# def player_first_loop(board) These two methods are not being used
#   loop do
#     display_board(board)
#     player_places_piece(board)
#     break if someone_won?(board) || board_full?(board)

#     computer_places_piece(board)
#     break if someone_won?(board) || board_full?(board)
#   end
# end

# def computer_first_loop(board)
#   loop do
#     computer_places_piece(board)
#     break if someone_won?(board) || board_full?(board)

#     display_board(board)
#     player_places_piece(board)
#     break if someone_won?(board) || board_full?(board)
#   end
# end

def place_piece!(brd, player)
  case player
  when 'player'
    player_places_piece(brd)
  when 'computer'
    computer_places_piece(brd)
  end
end

def alternate_player(player)
  case player
  when 'computer'
    'player'
  when 'player'
    'computer'
  end
end

loop do
  player_wins = 0
  computer_wins = 0
  loop do
    prompt 'Who should go first? (p for player, c for computer, r for random)'
    answer = gets.chomp.downcase
    board = initialize_board

    current_player = 'player' if answer.start_with?('p')

    current_player = 'computer' if answer.start_with?('c')

    current_player = ['player', 'computer'].sample if current_player.nil?

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    display_winner(detect_winner(board))

    if detect_winner(board) == 'Player'
      player_wins += 1
    elsif detect_winner(board) == 'Computer'
      computer_wins += 1
    end

    prompt "Score: Player #{player_wins}; Computer #{computer_wins}."
    sleep(1)

    break if grand_total(player_wins, computer_wins)
  end

  prompt 'Play again? (y or n)'
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing tic tac toe. Goodbye!"
=======
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, sep = ', ', ender = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{ender} ")
  else
    arr[-1] = "#{ender} #{arr.last}"
    arr.join(sep)
  end
end

def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER} and the Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def risky_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def winning_square(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = winning_square(line, brd)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = risky_square(line, brd)
      break if square
    end
  end

  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  square ||= empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_winner(winner)
  case winner
  when 'Player'
    prompt 'Player won!'
  when 'Computer'
    prompt 'Computer won!'
  else
    prompt 'It\'s a tie!'
  end
end

def grand_total(player, computer)
  if player == 5
    prompt "You are the grand winner!"
    true
  elsif computer == 5
    prompt "You are the grand loser!"
    true
  end
end

# def player_first_loop(board) These two methods are not being used
#   loop do
#     display_board(board)
#     player_places_piece(board)
#     break if someone_won?(board) || board_full?(board)

#     computer_places_piece(board)
#     break if someone_won?(board) || board_full?(board)
#   end
# end

# def computer_first_loop(board)
#   loop do
#     computer_places_piece(board)
#     break if someone_won?(board) || board_full?(board)

#     display_board(board)
#     player_places_piece(board)
#     break if someone_won?(board) || board_full?(board)
#   end
# end

def place_piece!(brd, player)
  case player
  when 'player'
    player_places_piece(brd)
  when 'computer'
    computer_places_piece(brd)
  end
end

def alternate_player(player)
  case player
  when 'computer'
    'player'
  when 'player'
    'computer'
  end
end

loop do
  player_wins = 0
  computer_wins = 0
  loop do
    prompt 'Who should go first? (p for player, c for computer, r for random)'
    answer = gets.chomp.downcase
    board = initialize_board

    current_player = 'player' if answer.start_with?('p')

    current_player = 'computer' if answer.start_with?('c')

    current_player = ['player', 'computer'].sample if current_player.nil?

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    display_winner(detect_winner(board))

    if detect_winner(board) == 'Player'
      player_wins += 1
    elsif detect_winner(board) == 'Computer'
      computer_wins += 1
    end

    prompt "Score: Player #{player_wins}; Computer #{computer_wins}."
    sleep(1)

    break if grand_total(player_wins, computer_wins)
  end

  prompt 'Play again? (y or n)'
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing tic tac toe. Goodbye!"
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
