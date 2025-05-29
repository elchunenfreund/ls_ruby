def reverse!(arr)
  right_index = -1
  left_index = 0
  while left_index < arr.size / 2
    arr[right_index], arr[left_index] = arr[left_index], arr[right_index]
    left_index += 1
    right_index -= 1
  end
  arr
end

# list = [1, 2, 3, 4]
# result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = [1, 2, 3, 4, 1]
# result = reverse!(list)
# p result == [1, 4, 3, 2, 1] # true
# p list == [1, 4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

def reverse(arr)
  new_arr = []
  counter = arr.size
  until counter <= 0
    new_arr << arr[counter -1]
    counter -= 1
  end
  new_arr
end

# p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]         # => true
# p reverse([1, 2, 3, 4, 1]) == [1, 4, 3, 2, 1]   # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)       # => true
# p reverse(['abc']) == ['abc']                   # => true
# p reverse([]) == []                             # => true

# list = [1, 3, 2]                                # => [1, 3, 2]
# new_list = reverse(list)                        # => [2, 3, 1]
# p list.object_id != new_list.object_id          # => true
# p list == [1, 3, 2]                             # => true
# p new_list == [2, 3, 1]                         # => true

def merge1(arr1, arr2)
  arr1.union(arr2)
end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def halvsies(arr)
  half = (arr.size.ceildiv(2))
  first_half = arr.slice(0, half)
  second_half = arr.slice(half , arr.size)
  [first_half, second_half]
end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 2, 3, 4, 1]) == [[1, 2, 3], [4, 1]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

def find_dup(arr)
  the_one = arr.select {|x| arr.count(x) == 2}
  the_one.first.to_i
end

# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#             38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#             14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#             78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#             89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#             41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#             55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#             85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#             40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#             7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

def include?(arr, the_one)
  arr.any?(the_one)
end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

def interleave(arr1, arr2)
  [arr1, arr2].transpose.flatten
end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def show_multiplicative_average(arr)
  total = arr.reduce(:*).to_f
  average = total / arr.size
  "The result is #{format('%.3f', average)}"
end

# p show_multiplicative_average([3, 5])                 == "The result is 7.500"
# p show_multiplicative_average([6])                    == "The result is 6.000"
# p show_multiplicative_average([2, 5, 7, 11, 13, 17])  == "The result is 28361.667"

def multiply_list(arr1, arr2)
  new_arr = []
  arr1.each_with_index { |num, ind| new_arr << num * arr2[ind]}
  new_arr
end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

def multiply_all_pairs(arr1, arr2)
  new_array = []
  arr1.each do |x|
    arr2.each do |y|
      new_array << x * y
    end
  end
  new_array.sort
end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

def count_occurrences(arr)
  hsh = {}
  arr.uniq.each do |word|
    hsh[word] = arr.count(word)
  end
  hsh.each { |k, v| puts "#{k} => #{v}"}
end

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

def sum_of_sums(arr)
  total = 0
  new_arr = []
  arr.each do |x|
    new_arr << x
    total += new_arr.sum
  end
  total
end


# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

def average(arr)
  sum = arr.reduce(:+) / arr.count
end

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

def twice(int)
  arr = int.digits
  size = arr.size
  mid = size / 2
  left = arr[0, mid]
  right = arr[mid, size - 1]
  return int if right == left && size >= 2
  return int * 2
end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

def sequence_arr(int)
  (1..int).to_a
end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

def sequence(count, int)
  arr = [0]
  count.times { |x| arr << (int + arr[-1])}
  arr.shift
  arr
end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

def scores(int)
  case int
  when (0..60) then 'F'
  when (61..70) then 'D'
  when (71..80) then 'C'
  when (80..90) then 'B'
  when (90..100) then 'A'
  end
end


def get_grade(*int)
  total = 0
  int.each { |x| total += x }
  scores(total / 3)
end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

def buy_fruit(arr)
  new_arr = []
  arr.each { |x| x[1].times { new_arr << x[0]}}
  new_arr
end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

def anagrams(arr)
  anagrams = arr.group_by do |word|
    word.chars.sort
  end
  anagrams.each do |k,v|
    p v unless v.size < 2
  end
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon', 'abc']

#anagrams(words)

def sum(int)
  int.digits.sum
end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

def oddities(arr)
  odd = []
  arr.each_with_index do |int, ind|
    odd << int if ind.even?
  end
  odd
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

def rotate_rightmost_digits(arr, num)
  arr = arr.to_s.chars
  left_index = -num
  right_index = -1
  num.times do
    arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
    right_index -= 1
  end
  arr.join.to_i
end

# LS solution and way more clever
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

def max_rotation(int)
  len = int.to_s.length
  until len == 0 do
    int = rotate_rightmost_digits(int, len)
    len -= 1
  end
  int
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

def toggle_lights(int)
  arr = (1..int).to_a
  new_arr = []
  arr.each do |x|
    counter = x
    new_arr << arr.select { |int| int % counter == 0 }
  end

  result = new_arr.flatten
  result.select { |x| result.count(x).odd?}.uniq
end

# p toggle_lights(1000)

def fibonacci_last(int)
  def fibonacci_last(nth)
    last_2 = [1, 1]
    3.upto(nth) do
      last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
    end
    last_2.last
  end
end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4

def triangle(*arr)
  arr.sort!
  if arr.any?(0)
    :invalid
  elsif arr.all?(arr[0])
    :equilateral
  elsif arr.uniq == arr
    :scalene
  elsif  (arr[0] + arr[1]) > arr[2]
    :isosceles
  else
    :invalid
  end
end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

def triangle(*arr)
  if arr.any?(0) || arr.sum != 180
    :invalid
  elsif arr.any?(90)
    :right
  elsif arr.any? {|arg| arg > 90}
    :obtuse
  else
    :acute
  end
end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid

def featured(num)
  result = 0
  num.upto(num * 2) do |int|
    result = int if int % 7 == 0 && int.odd? && int.to_s.chars.uniq.size == int.to_s.size
    if result > num
      break
    elsif int > 9999999999
      p "There is no result that will fit your stupid rules, ;) "
      break
    end
  end
  result
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

def bubble_sort!(arr)
  loop do
    swapped = false
    0.upto(arr.length) do |x|
      unless arr[x + 1].nil?
        if arr[x] > arr[x + 1]
          arr[x], arr[x + 1] = arr[x + 1], arr[x]
          swapped = true
        end
      end
    end
    break unless swapped
  end
  arr
end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

def sum_square_difference(int)
  sum_of_squares = 1.upto(int).to_a.sum ** 2
  square_of_sums = 1.upto(int).to_a.map { |x| x ** 2}.sum
  sum_of_squares - square_of_sums
end

# p sum_square_difference(3) == 22
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150

def is_prime(int)
  return false if int == 1
  2.upto(int - 1) do |num|
    return false if (int % num) == 0
  end
  return true
end

# puts(is_prime(1) == false)              # true
# puts(is_prime(2) == true)               # true
# puts(is_prime(3) == true)               # true
# puts(is_prime(4) == false)              # true
# puts(is_prime(5) == true)               # true
# puts(is_prime(6) == false)              # true
# puts(is_prime(7) == true)               # true
# puts(is_prime(8) == false)              # true
# puts(is_prime(9) == false)              # true
# puts(is_prime(10) == false)             # true
# puts(is_prime(23) == true)              # true
# puts(is_prime(24) == false)             # true
# puts(is_prime(997) == true)             # true
# puts(is_prime(998) == false)            # true
# puts(is_prime(3_297_061) == true)       # true
# puts(is_prime(23_297_061) == false)     # true

def transpose(arr)
  new_arr = []
  arr[0].size.times { |num| new_arr << arr.map { |arr| arr[num]}}
  new_arr
end

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]

def rotate90(arr)
  new_arr = []
  arr[0].length.times do |col|
    new_arr << arr.map.with_index {|_,ind| arr[ind][col]}.reverse
  end
  new_arr
end

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

# p my_method([])
# p my_method([3])
# p my_method([3, 4])
# p my_method([5, 6, 7])

def merge(arr1, arr2)
  new_arr = []
  arr1_ind = 0
  arr2_ind = 0

  until new_arr.size == arr1.size + arr2.size
    if arr2[arr2_ind] == nil
      new_arr.push(arr1[arr1_ind..-1])
      return new_arr.flatten

    elsif arr1[arr1_ind] == nil
      new_arr.push(arr2[arr2_ind..-1])
      return new_arr.flatten

    elsif arr1[arr1_ind] < arr2[arr2_ind]
      new_arr.push(arr1[arr1_ind])
      arr1_ind += 1

    elsif arr2[arr2_ind] < arr1[arr1_ind]
      new_arr.push(arr2[arr2_ind])
      arr2_ind += 1
    end
  end
  new_arr.flatten
end

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]


def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left_half = merge_sort(arr[0...mid]) # Recursively split the left half
  right_half = merge_sort(arr[mid..-1]) # Recursively split the right half

  [right_half, left_half]
  merge(right_half,left_half)

end

# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort([9, 2, 7, 6, 8, 5, 0, 1]) == [0, 1, 2, 5, 6, 7, 8, 9]

# def decrease(counter)
#   counter - 1
# end

# counter = 10

# 10.times do
#   puts counter
#   counter = decrease(counter)
# end

# puts 'LAUNCH!'

def shout_out_to(name)
  name = name.chars.map { |c| c.upcase! }.join

  puts 'HEY ' + name
end

# shout_out_to('you') # expected: 'HEY YOU'
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end

# p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
# p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
# p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
# p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
# p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

# p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end
# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  score = remaining_cards.map do |card|
    score(card)
  end

  sum += score.sum
end

# puts sum
# total_sum  = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
# player_sum = player_cards.map { |card| score(card) }.sum

# puts(sum == total_sum - player_sum) #=> false

def move(n, from_array, to_array)
  return if n == 1
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

# p todo # should be: ['coffee with Tom']
# p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! do |word|
    negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

# puts neutralize('These dull boring cards are part of a chaotic board game.')
# # Expected: These cards are part of a board game.
# # Actual: These boring cards are part of a board game.
password = nil

def set_password(password)
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

# if !password
#   password = set_password(password)
# end

# verify_password(password)

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample

  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
      # Try again:
    end
  end
  puts 'Do you want to play again?(y/n)'
  replay = gets.chomp.downcase
  guess_number(max_number, max_attempts) if replay == 'y'
end

# guess_number(10, 3)

# Term frequency - inverse document frequency:
# A measure of how important a term is to a document in a collection of documents
# (the importance increases proportionally to the term frequency in the document,
# but decreases with the frequency of the word across documents)

def tfidf(term, document, documents)
  (tf(term, document) * idf(term, documents)).round(1)
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
  document.split(/[\s,.-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  Math.log(number_of_documents.fdiv(number_of_documents_with_term))
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
# puts tfidf("cat", document1, documents) # ~ 1.2
# puts tfidf("cat", document2, documents) # ~ 1.6
# puts tfidf("cat", document3, documents) # 0

# puts tfidf("quantum", document1, documents) # ~ 5.5
# puts tfidf("quantum", document2, documents) # 0
# puts tfidf("quantum", document3, documents) # 0

# puts tfidf("mastery", document1, documents) # 0
# puts tfidf("mastery", document2, documents) # 0
# puts tfidf("mastery", document3, documents) # ~ 4.4

# puts tfidf("some", document1, documents) # 0
# puts tfidf("some", document2, documents) # ~ 0.4
# puts tfidf("some", document3, documents) # ~ 0.4

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i }

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
