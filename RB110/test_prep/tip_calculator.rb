<<<<<<< HEAD
def tip_calculator
  print 'What is the bill? '
  bill = gets.chomp.to_f
  print 'What is the tip percentage? '
  percentage = gets.chomp.to_f

  tip = (bill * percentage) / 100
  total = bill + tip

  puts "The tip will be $#{tip.round(2)}"
  puts "The total is $#{total.round(2)}"
end

tip_calculator

=======
def tip_calculator
  print 'What is the bill? '
  bill = gets.chomp.to_f
  print 'What is the tip percentage? '
  percentage = gets.chomp.to_f

  tip = (bill * percentage) / 100
  total = bill + tip

  puts "The tip will be $#{tip.round(2)}"
  puts "The total is $#{total.round(2)}"
end

tip_calculator

>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
