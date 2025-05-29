HSH = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}

def string_to_integer(str)
  sum = 0
  multiplier = 1
  arr = str.chars.reverse
  arr.each do |x|
    sum += (HSH[x] * multiplier)
    multiplier *= 10
  end
  sum
end

def string_to_signed_integer(str)
  if str.start_with?('-')
    str.slice!(0)
    - string_to_integer(str)
  elsif str.start_with?('+')
    str.slice!(0)
    string_to_integer(str)
  else
    string_to_integer(str)
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('236556453') == 236556453

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100


