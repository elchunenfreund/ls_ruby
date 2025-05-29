def triangle(int)
counter = 1
  until counter == (int + 1)
    puts "#{' ' * (int - counter)}#{'*' * counter}"
    counter += 1
  end
end

puts triangle(5)

puts triangle(9)
