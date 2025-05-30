<<<<<<< HEAD
def prompt(str)
  puts "==> #{str}"
end

def arithmetic
  prompt "Enter the first number:"
  first = gets.chomp.to_i

  prompt "Enter the second number"
  second = gets.chomp.to_i

  prompt "#{first} + #{second} = #{first + second}"
  prompt "#{first} - #{second} = #{first - second}"
  prompt "#{first} * #{second} = #{first * second}"
  prompt "#{first} / #{second} = #{first / second}"
  prompt "#{first} % #{second} = #{first % second}"
  prompt "#{first} ** #{second} = #{first ** second}"
end

arithmetic
=======
def prompt(str)
  puts "==> #{str}"
end

def arithmetic
  prompt "Enter the first number:"
  first = gets.chomp.to_i

  prompt "Enter the second number"
  second = gets.chomp.to_i

  prompt "#{first} + #{second} = #{first + second}"
  prompt "#{first} - #{second} = #{first - second}"
  prompt "#{first} * #{second} = #{first * second}"
  prompt "#{first} / #{second} = #{first / second}"
  prompt "#{first} % #{second} = #{first % second}"
  prompt "#{first} ** #{second} = #{first ** second}"
end

arithmetic
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
