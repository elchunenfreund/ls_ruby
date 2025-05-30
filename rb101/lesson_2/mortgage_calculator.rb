def wrong_int(int)
  int.empty? || int.to_i < 0
end

def wrong_fl(fl)
  fl.empty? || fl.to_f < 0
end

def calculator(pr, j, n)
  pr * (j / (1 - ((1 + j)**(-n))))
end

prin = ''
intr = ''
mon = ''

loop do
  puts 'Please enter your total loan amount:'
  loop do
    prin = gets.chomp
    if wrong_fl(prin)
      puts 'Please enter a proper loan amount.'
    else
      break
    end
  end

  puts 'Please enter your interst rate:'
  loop do
    intr = gets.chomp
    if wrong_fl(intr)
      puts 'Please enter a valid Intrest rate.'
    else
      break
    end
  end

  puts 'Please enter your loan duration in years:'
  loop do
    mon = gets.chomp
    if wrong_int(mon)
      puts 'Please enter a valid number of years'
    else
      break
    end
  end

  principal = prin.to_f
  intrest = intr.to_f / 1200
  years = mon.to_i * 12

  monthly_payment = calculator(principal, intrest, years)
  puts "Your monthly payment will be $#{format('%.2f', monthly_payment)}."

  puts 'Do you want to go again? (enter "Y" to repeat.)'
  again = gets.chomp.upcase
  break unless again.start_with?('Y')
end
