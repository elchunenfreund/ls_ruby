def retirement_calculator
  print 'What is your age? '
  age = gets.chomp.to_i
  print 'At what age would you like to retire? '
  retirement_age = gets.chomp.to_i

  work_span = retirement_age - age
  t = Time.now
  current_year = t.year

  print "Its #{current_year}. You will retire in #{current_year + work_span}.
you have #{work_span} years of work left in you."
end

retirement_calculator
