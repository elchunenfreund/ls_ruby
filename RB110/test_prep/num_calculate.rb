<<<<<<< HEAD
def custom_print(str)
  puts ">> #{str}"
end

def num_calculate
  custom_print 'Enter an integer greater than zero: '
  int = gets.chomp.to_i

  if int <= 0
    custom_print "The integer must be greater than zero."
    return
  end

  range = (1..int)
  int_arr = range.to_a
  total = 0

  custom_print "Enter 's' to compute the sum, 'p' to compute the product."
  cal_choice = gets.chomp

  if cal_choice == 's'
    total = int_arr.sum  # Sum all elements in the array
  elsif cal_choice == 'p'
    total = 1  # Initialize total to 1 for multiplication
    int_arr.each do |y|
      total *= y
    end
  else
    custom_print "Invalid choice. Please enter 's' or 'p'."
    return
  end

  puts "The total is #{total}"
end

num_calculate
=======
def custom_print(str)
  puts ">> #{str}"
end

def num_calculate
  custom_print 'Enter an integer greater than zero: '
  int = gets.chomp.to_i

  if int <= 0
    custom_print "The integer must be greater than zero."
    return
  end

  range = (1..int)
  int_arr = range.to_a
  total = 0

  custom_print "Enter 's' to compute the sum, 'p' to compute the product."
  cal_choice = gets.chomp

  if cal_choice == 's'
    total = int_arr.sum  # Sum all elements in the array
  elsif cal_choice == 'p'
    total = 1  # Initialize total to 1 for multiplication
    int_arr.each do |y|
      total *= y
    end
  else
    custom_print "Invalid choice. Please enter 's' or 'p'."
    return
  end

  puts "The total is #{total}"
end

num_calculate
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
