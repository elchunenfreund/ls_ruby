<<<<<<< HEAD
def calculator
  print 'Enter the length of the room in meters: '
  length = gets.chomp.to_i
  print 'Enter the width of the room in meters:  '
  width = gets.chomp.to_i

  meters = length * width
  feet = meters * 10.7639
  puts "The area of the room is #{meters} meters (#{feet.round(2)} square feet)."
end

calculator
=======
def calculator
  print 'Enter the length of the room in meters: '
  length = gets.chomp.to_i
  print 'Enter the width of the room in meters:  '
  width = gets.chomp.to_i

  meters = length * width
  feet = meters * 10.7639
  puts "The area of the room is #{meters} meters (#{feet.round(2)} square feet)."
end

calculator
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
