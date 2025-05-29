def print_in_box(str)
  size = str.length
  puts "+-#{'-' * size}-+"
  puts "| #{' ' * size} |"
  puts "| #{str} |"
  puts "| #{' ' * size} |"
  puts "+-#{'-' * size}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
