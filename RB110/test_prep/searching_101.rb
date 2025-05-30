<<<<<<< HEAD
def prompt(str)
  puts "=> #{str}"
end

def searching
  arr = []
  prompt 'Enter the 1st number: '
  arr << gets.to_i

  prompt 'Enter the 2nd number: '
  arr << gets.to_i

  prompt 'Enter the 3rd number: '
  arr << gets.to_i

  prompt 'Enter the 4th number: '
  arr << gets.to_i

  prompt 'Enter the 5th number: '
  arr << gets.to_i

  prompt 'Enter the last number: '
  last = gets.to_i

  if arr.include?(last)
    puts "The number #{last} appears in #{arr}"
  else
    puts "The number #{last} does not appear in #{arr}"
  end
end

searching
=======
def prompt(str)
  puts "=> #{str}"
end

def searching
  arr = []
  prompt 'Enter the 1st number: '
  arr << gets.to_i

  prompt 'Enter the 2nd number: '
  arr << gets.to_i

  prompt 'Enter the 3rd number: '
  arr << gets.to_i

  prompt 'Enter the 4th number: '
  arr << gets.to_i

  prompt 'Enter the 5th number: '
  arr << gets.to_i

  prompt 'Enter the last number: '
  last = gets.to_i

  if arr.include?(last)
    puts "The number #{last} appears in #{arr}"
  else
    puts "The number #{last} does not appear in #{arr}"
  end
end

searching
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
