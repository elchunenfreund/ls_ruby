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
