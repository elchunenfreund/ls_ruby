# problem 1

=begin
  problem; given an array of numbers return a new array with all the numbers that are samller then it
  input; array
  output; array;
  rules; only count uniq numbers, so if a number is placed twice only count it once

  DS; array

  algo;
  first call uniq to to uniqify each array, then create a new array to
  store the new values, iterate throgh each number and have another loop iterate throgh
  each object, and have that loop return a variable with the desired output.

end
=end

def smaller_numbers_than_current(arr)
  uniq_arr = arr.uniq
  result = []
  arr.each do |outer_int|
    greater = 0
      uniq_arr.each do |inner_int|
      greater += 1 if inner_int < outer_int
    end
    result << greater
  end
  result
end

# p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
# p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
# result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current(my_array) == result

=begin

problem; given ann array of strings return minimum sum of 5 cosecutive
integers
input; array
output; integer
rules; if there are less than 5 object in the array return nil
the sum should be the minimum sum that is availeble

algo; iterate throgh the entire array
  create all possble combinations of 5

 use min-by and sum to exctact the desired output.
=end

def minimum_sum(arr)
  array_size = arr.length
  combinations_arr = []
  return nil if array_size < 5
  (array_size - 4).times do |iteration|
    combinations_arr << arr.slice(iteration, 5)
  end
  combinations_arr.min_by { |arr| arr.sum}.sum
end

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

=begin
problem; given a long string convert every third SECOND char in every THIRD
word to uppercase

input; str
output; str

rules; do not mutate the stirng, use a copy only

algo; split the string into an array
use each with index with the % operator to select every third word
use odd to select every second char to upcase
end
=end

def to_weird_case(str)
  str_arr = str.split(' ')
  str_arr.each_with_index do |word, ind|
    if (ind + 1) % 3 == 0
      str_arr[ind] = word.split('').each_with_index { |letter, index| letter.upcase! if index.odd? }.join('')
    end
  end
  str_arr.join(' ')
end

# original = 'Lorem Ipsum is simply dummy text of the printing world'
# expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
# p to_weird_case(original) == expected

# original = 'It is a long established fact that a reader will be distracted'
# expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case(original) == expected

# p to_weird_case('aaA bB c') == 'aaA bB c'

# original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
# expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
# p to_weird_case(original) == expected

=begin
*** more then 20 min ***
problem; create a method that takes an array as an argument and returns the two
numbers that are closest in value.

rules; if two numbers are equaly close, the first one should be returned.

input; arr
output; arr of two numbers

algo; iterate throgh the method and check each number against all numbers,
have a variable keep track of the difference
return the pair with the smallest differnce, (add the difference to the pair)
select the pair using min_by to select the pair with the smallest diffence
=end

def closest_numbers(arr)
  all_pairs = []
  arr.each do |outer_num|
    arr.each do |inner_num|
      next if outer_num == inner_num
      all_pairs << [outer_num, inner_num, (outer_num - inner_num).abs]
    end
  end
  result = all_pairs.min_by { |x| x[2] }.slice(0 ,2)
end

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 22, 7, 17]) == [12, 7]

=begin
*** Done in 7 min
problem; given a string return the char that occures most often in the str
rules; if two chars occur the same amount of times the first one should be returned
case should be ignored

input; str
output; str

algo; use downcase to have the code return downaces
use the max_by method with the count method to arrive at the disired result
=end

def most_common_char(str)
  str.downcase!
  str.chars.max_by { |x| str.count(x) }
end

# p most_common_char('Hello World') == 'l'
# p most_common_char('Mississippi') == 'i'
# p most_common_char('Happy birthday!') == 'h'
# p most_common_char('aaaaaAAAA') == 'a'

# my_str = 'Peter Piper picked a peck of pickled peppers.'
# p most_common_char(my_str) == 'p'

# my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
# p most_common_char(my_str) == 'e'

=begin
problem; Given a string return a hash that contains the number of times each
lowercase letter apears in the string with the key being the char and the
value being the number

rules; only lowercase letters should be counted not other chars

input; str
output; hash

algo; split the string into an array of chars,
loop throgh the arr with each and skip the letter if it's upcase,
otherwise add the str to the hash if it's not there yet,
if it is add 1 to the value pair
=end
def strip_other_char(str)
  str.chars.select do |x|
    ('a'...'z').to_a.include?(x)
  end
end

def count_letters(str)
  result_hsh = {}
  str = strip_other_char(str)
  str.each do |char|
    next if char.upcase.downcase != char ||
    if result_hsh.keys.include?(char)
      result_hsh[char] += 1
    else
      result_hsh[char] = 1
    end
  end
  result_hsh
end

# expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
# p count_letters('woebegone') == expected

# expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
#             'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
# p count_letters('lowercase/uppercase') == expected

# expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
# p count_letters('W. E. B. Du Bois') == expected

# p count_letters('x') == {'x' => 1}
# p count_letters('') == {}
# p count_letters('!!!') == {}

=begin
*** done on secont try in under 20 min ***
problem; gine an array of integers return a number with the total amount of
pairs,

rules; every pair should be counted once so if an there are one int occures 5 time
the result should be 2

algo; we need to count the total number of pairs we can do that by using
- the count method to count the total number of times each number apeares in
the arr add the total to a new arr if the result i greater then 1
- then we need to split each number thats greater then 2 into two or more nums
- we can do that by using the num.times method to itrate each number thats greater
then 4 and adding a num to the arr and removing two form the num till we get
get to less then 4
- then use arr.length to see how many pairs we got
- have method return 0 if there are no pairs
=end

def pairs(arr)
  result_arr = []
  arr.each do |int|
    result_arr << arr.count(int) if arr.count(int) > 1
    arr.delete(int)
  end
  result_arr.each do |int|
    if int > 3
      until int < 4
        result_arr << 1
        int -= 2
      end
    end
  end
  return result_arr.length unless result_arr.length == nil
  0
end

# p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
# p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
# p pairs([]) == 0
# p pairs([23]) == 0
# p pairs([997, 997]) == 1
# p pairs([32, 32, 32]) == 1
# p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

=begin
*** 21 min ***
problem; given a lowercase str return the length of the longest 'vowel' substring

input; str
output; int

algo; iterate throgh the str and count the number of subsequent vowels and
- add the total to an array begin end the count when we hit a non vowel char and
begin counting anew
- use arr.max to extract the desired output
=end

def longest_vowel_substring(str)
  str_arr = str.chars
  result = 0
  vowels = ['a', 'e', 'i', 'o', 'u']
  counter = 0
  str_arr.each do |char|
    if vowels.include?(char)
      counter += 1
    else
      counter = 0
    end
    result = counter unless result >= counter
  end
  result
end

# p longest_vowel_substring('cwm') == 0
# p longest_vowel_substring('many') == 1
# p longest_vowel_substring('launchschoolstudents') == 2
# p longest_vowel_substring('eau') == 3
# p longest_vowel_substring('beauteous') == 3
# p longest_vowel_substring('sequoia') == 4
# p longest_vowel_substring('miaoued') == 5

=begin
*** 23 min with some minor help from chatGPT... ***
problem; given two strings return the amount of time the first string
contains the second one

rules; - the second string can contain multipul chars
- the first string can be empty
- overlaping string should not be counted twice

input; str
output; int

algo;
use scan with regex to coutn the number of ocurrences in the string
=end

def count_substrings(str, sub)
  str.scan(/#{sub}/).count
end



# p count_substrings('babab', 'bab') == 1
# p count_substrings('babab', 'ba') == 2
# p count_substrings('babab', 'b') == 3
# p count_substrings('babab', 'x') == 0
# p count_substrings('babab', 'x') == 0
# p count_substrings('', 'x') == 0
# p count_substrings('bbbaabbbbaab', 'baab') == 2
# p count_substrings('bbbaabbbbaab', 'bbaab') == 2
# p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

=begin
*** 50 min with help from chatGPT... ***
problem; given a string of numbers return the amount of even substrings that can
be formed

input; str of ints
output; int

algo; - we need to iterate over the string creating all the possible subs
- we will do that using a seperete substring_creater method

adding them to an arr and using select to choose onlt the ones that the
last digit is even and count them
=end

def substring_creator(str)
  result = []
  str.chars.each_with_index do |_, outer_ind|
    (outer_ind...str.size).each do |inner_ind|
      result << str[outer_ind..inner_ind]
    end
  end
  result
end

def even_substrings(str)
  arr = substring_creator(str)
  arr.select! do |str|
    str.to_i.even?
  end
  arr.count
end

# p even_substrings('1432') == 6
# p even_substrings('3145926') == 16
# p even_substrings('2718281') == 16
# p even_substrings('13579') == 0
# p even_substrings('143232') == 12

=begin
** 50 min with somehelp from chatGPT ***
problem; given a non empty lowercase string return an array that will find
a pateren if there is one namely the first output should be a str and the
second should be the number of times the first should be repeted to create
the initial str return the inital str if no pattern is found

rules; we are looking for the shortest string to make the largest patteren
number

input; str
output; arr with str and int

algo; iterate throgh the first half of the str beginig with the first and
adding to it and seing if it checks out if it does return the str and num
=end

def repeated_substring(str)
  (1..str.size / 2).each do |num|
    pat_str = str[0, num]
    times = str.size / num
    return [pat_str, times] if pat_str * times == str
  end
  return [str, 1] if str == str * 1
end

# p repeated_substring('xyzxyzxyz') == ['xyz', 3]
# p repeated_substring('xyxy') == ['xy', 2]
# p repeated_substring('xyz') == ['xyz', 1]
# p repeated_substring('aaaaaaaa') == ['a', 8]
# p repeated_substring('superduper') == ['superduper', 1]

=begin
*** done in 14 min with no help... ***
problem; given a string return true if the said str contains all letters in
the alphabet

rules; case is not relevent

input; str
output; boolean

algo; - split the str into a an array and down case it
  - check wheather the str arr contains ALL of the alphabet (create an arr)
=end

def is_pangram(str)
  alphabet = ('a'..'z').to_a
  alphabet.all? { |letter| str.include?(letter) }
end

# p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
# p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
# p is_pangram("A wizard's job is to vex chumps quickly in fog.") == true
# p is_pangram("A wizard's task is to vex chumps quickly in fog.") == false
# p is_pangram("A wizard's job is to vex chumps quickly in golf.") == true

# my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
# p is_pangram(my_str) == true

=begin
*** 5 min BH ***
problem; given two string check if some chars in the first str can form the
second str

input; str
output; boolean

algo; just like in the previos example check whether all of the strings in
the second str are included in the first str
=end

def unscramble(str1, str2)
  str2.chars.all? { |letter| str1.include?(letter)}
end

# p unscramble('ansucchlohlo', 'launchschool') == true
# p unscramble('phyarunstole', 'pythonrules') == true
# p unscramble('phyarunstola', 'pythonrules') == false
# p unscramble('boldface', 'coal') == true

=begin
*** 10 min with some minor debugging ***
problem; given an int return the sum of all mutiples (it returnes 0 when divided)
of 7 and 11 that arr
that are lower then that int

rules; if a number is a multiple of both count it only once

input; int
output; int

algo; - create an arr of all the numbers lower then the given int
- pass the disired numbers into a seperate arr and return the sum
=end

def seven_eleven(int)
  result = []
  arr = (0...int).to_a
  result = arr.select { |int| (int % 7 == 0) || (int % 11 == 0) }
  result.sum
end

# p seven_eleven(10) == 7
# p seven_eleven(11) == 7
# p seven_eleven(12) == 18
# p seven_eleven(25) == 75
# p seven_eleven(100) == 1153
# p seven_eleven(0) == 0
# p seven_eleven(-100) == 0

=begin
given a str of digits return the greatest product of multiplying 4
consecutive digits, there will allways be more then 4 digits

input; str of digits
output; int

algo; - create all posible subs from 4 consecutive ints
- select the largest one using max_by etc.
=end
def subs_of_4(str)
  result = []
  (str.size - 3).times do |int|
    result << str[int, 4].chars.map { |str| str.to_i }
  end
  result
end

def greatest_product(str)
  arr_of_arrs = subs_of_4(str)
  arr_of_arrs.map { |arr| arr.reduce(1, :*)}.max
end

# p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
# p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
# p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
# p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6

=begin
*** 10 min with no help BH ***
problem; given a srt return the amount of distinct, case-insensetive,
  digits that occure more then once.

algo;
split the str into a arr and iterate through it using the select mehtod to
extract the digits that accure more then once then count the result arr
=end

def distinct_multiples(str)
  arr = str.downcase.chars
  result = []
  arr.each do |digit|
    result << digit if arr.count(digit) > 1
  end
  result.uniq.size
end

# p distinct_multiples('xyz') == 0               # (none
# p distinct_multiples('xxyypzzr') == 3          # x, y, z
# p distinct_multiples('xXyYpzZr') == 3          # x, y, z
# p distinct_multiples('unununium') == 2         # u, n
# p distinct_multiples('multiplicity') == 3      # l, t, i
# p distinct_multiples('7657') == 1              # 7
# p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
# p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

=begin
*** 15 min BH with no help ***
problem; given a arr on ints return the lowrs posibble integer that can be
added to sum of hte arr that will reuturn the closest prime number
(that is a number that can only be divided by itself)

algo; - create a method that will check if a given number is prime
- use a range of numbers to return the lowest possible int that, if added to
arr.sum will be a prime number.
=end

def is_prime?(int)
  (2...int).each do |range_int|
    return false if int % range_int == 0
  end
  true
end

def nearest_prime_sum(arr)
  (1...1000).each do |range_int|
    return range_int if is_prime?(arr.sum + range_int)
  end
end

# p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
# p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
# p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
# p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# # Nearest prime to 163 is 167
# p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4

=begin
*** 13 min BH ***
problem; given an arr of number return the index of the number that which
the numbers of both sides will sum up to the same amount

input; arr
ouput; desired index

algo; iterate throgh each number with index and check if both sides sum up
=end

def equal_sum_index(arr)
  arr.each_with_index do |int, index|
    return index if arr[0..index].sum == arr[index..-1].sum
  end
  -1
end

# p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
# p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
# p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
# p equal_sum_index([0, 2, 4, 4, 2, 3, 2]) == -1

# # The following test case could return 0 or 3. Since we're
# # supposed to return the smallest correct index, the correct
# # return value is 0.
# p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

=begin
*** 2 min BH ***
problem; given an arr of ints return the int that appares an odd number of
time

algo; use each and count to return the disired int
=end

def odd_fellow(arr)
  arr.each { |int| return int if arr.count(int).odd? }
end

# p odd_fellow([4]) == 4
# p odd_fellow([7, 99, 7, 51, 99]) == 51
# p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
# p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
# p odd_fellow([0, 0, 0]) == 0

=begin
*** 2 min BH BH ***
problem; given an arr of int return the int that appears only once

algo; use count to retun the disired int
=end

def what_is_different(arr)
  arr.each { |int| return int if arr.count(int) == 1 }
end

# p what_is_different([0, 1, 0]) == 1
# p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
# p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
# p what_is_different([3, 4, 4, 4]) == 3
# p what_is_different([4, 4, 4, 3]) == 3

=begin
problem; given an arr of ints return the min_sum of 5 consecutive ints in the arr

algo; first crest all possible arrs of 5 ints then select the one that has the
the lowest sum
=end

=begin
problem; given a str return a new str with every SECOND char in every THIRD
word converted to upcase

algo; use each with index to iterate throgh the arr (aftr converting)
- use mudulo to select every third word
- then use odd? to select each desired char and upcase it
=end
