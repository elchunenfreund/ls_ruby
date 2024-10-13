file_contant = File.read('text.txt')

def letter_case_count(str)
  count = {}
  count[:lowercase] = str.scan(/[a-z]/).size
  count[:uppercase] = str.scan(/[A-Z]/).size
  count[:neither] = str.scan(/\W|\d/).size
  count
end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

def word_cap(str)
  arr = str.split.map { |x| x.downcase.capitalize}.join(' ')
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# LS solution and thats more elgent
def swapcase(str)
  characters = str.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

# p swapcase('PascalCase') == 'pASCALcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

def staggered_case(str)
  new_str = ''
  up_case = true
  str.chars.each do |char|
    if up_case && char =~ /[a-zA-Z]/
      new_str += char.upcase
      up_case = false
    elsif !up_case && char =~ /[a-zA-Z]/
      new_str += char.downcase
      up_case = true
    else
      new_str += char
    end
  end
  new_str
end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

def penultimate(str)
  str.split[-2]
end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

def leading_substrings(str, starting_ind)
  new_arr = []
  starting_ind.upto(str.length-1) do |x|
    new_arr << str[starting_ind..x]
  end
  new_arr
end

# p leading_substrings('abc', 0) #== ['a', 'ab', 'abc']
# p leading_substrings('a', 0) == ['a']
# p leading_substrings('xyzzy', 0) == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def substrings(str)
  arr = []
  counter = 0
  until counter >= str.size
    arr << leading_substrings(str, counter)
    counter += 1
  end
  arr.flatten(1)
end

# p substrings('abcde') == [
#     'a', 'ab', 'abc', 'abcd', 'abcde',
#     'b', 'bc', 'bcd', 'bcde',
#     'c', 'cd', 'cde',
#     'd', 'de',
#     'e'
#   ]

def palindromes(str)
  pal_arr = substrings(str).select do |x|
    x.size >= 2 && x == x.reverse
  end
  pal_arr
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo']
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']

def repeater(str)
  new_str = []
  new_str = str.chars.map { |x| x =~ /'aeiouAEIOU'/ ? x : x + x }
  new_str.join
end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

def reverse_sentence(str)
  str.split.reverse.join(' ')
end

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

def greetings(name, hsh)
  p "Hello, #{name.join(" ")}! nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

def word_lengths(str)
  str.split.map { |word| "#{word} #{word.size}"}
end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# p word_lengths("It ain't easy, is it?") ==
#   ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]
# p word_lengths("") == []

def swap_name(str)
  arr = str.split.reverse.join(', ')
end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

def diamond(int)
  sides, middle = int.divmod(2)
  counter = 1
  until counter > int
    puts  "#{' ' * sides}#{'*' * counter}#{' ' * sides}"
    sides -= 1
    counter += 2
  end
  sides = 1
  counter -= 4
  until counter < middle
    puts  "#{' ' * sides}#{'*' * counter}#{' ' * sides}"
    sides += 1
    counter -= 2
  end
end

# LS solution and way more elgent
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end


#p diamond(9)

DIGIT_HASH = {'one': '1', 'two': '2', 'three': '3', 'four': '4', 'five': '5', 'six': '6', 'seven': '7', 'eight': '8', 'nine': '9'}

def word_to_digit(str)
  DIGIT_HASH.keys.each do |word|
    str.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  str
end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

def longest_sentence(file)
  sentences = file.split(/\.|\?|!/)
  longest = sentences.max_by {|x| x.size}
  longest = longest.split(' ')
  p longest.join(' ')
  p longest.size
end

# longest_sentence(file_contant)

MY_BLOCKS = [['B','O'], ['X','K'], ['C','P'], ['N','A'],
  ['G','T'], ['R','E'], ['F','S'], ['J','W'], ['H','U'],
  ['V','I'], ['L','Y'], ['Z', 'M']]

def block_word?(str)
  arr = str.upcase.chars
  result = MY_BLOCKS.select {|block| block.count {|letter| arr.include?(letter)} > 1}.any? ||
  arr.select {|letter| arr.count(letter) > 1}.any?
  !result
end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze


# LS Solution and way simpler.
def block_word?(str)
  arr = str.upcase
  BLOCKS.none? { |block| arr.count(block) >= 2 }
end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true
# p block_word?('apples') == false
# p block_word?('Baby') == false

def letter_percentages(str)
  counts = {}
  str = str.chars
  counts[:lowercase] = str.count {|ltr| ltr =~ /[a-z]/}
  counts[:uppercase] = str.count {|ltr| ltr =~ /[A-Z]/}
  counts[:neither] = str.count {|ltr| ltr =~ /[^A-Za-z]/}
  total_sum = counts.values.sum.to_f
  result = counts.each {|k,v| counts[k] = (v / total_sum) * 100 }
end

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

def balanced?(str)
  pers = str.scan(/[()]/)
  counter = 1
  pers.each do |per|
    per == '(' ? counter += 1 : counter -= 1
    break if counter < 1
  end
  counter == 1
end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('What ())(is() up') == false

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS = %w(fox dog head leg cat tail).freeze
VERBS = %w(spins bites licks hurdles).freeze
ADVERBS = %w(easily lazily noisly excitedly).freeze

# File.open('text.txt') do |file|
#   file.each do |line|
#     puts format(line, noun: NOUNS.sample,
#                       verb: VERBS.sample,
#                       adjective: ADJECTIVES.sample,
#                       adverb: ADVERBS.sample)
#   end
# end

def new_star(int)
  (int / 2).downto(1) do |num|
    line = '*' + ' ' * (num - 1) + '*' + ' ' * (num - 1) + '*'
    puts line.center(int)
  end

  puts '*' * int

  0.upto((int / 2) - 1) do |num|
    line = '*' + ' ' * num + '*' + ' ' * num + '*'
    puts line.center(int)
  end
end

new_star(9)
new_star(7)

