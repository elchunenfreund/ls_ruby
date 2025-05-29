KEY = {1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'}

def integer_to_string(int)
  arr = int.digits.map {|x| KEY[x]}.reverse.join()
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

def signed_integer_to_string(number)
  if number.negative?
    str = integer_to_string(number.abs).prepend('-')
  elsif number == 0
    str = '0'
  else
    str = integer_to_string(number.abs).prepend('+')
  end
  str
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
