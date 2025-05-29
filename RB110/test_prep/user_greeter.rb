def greeter
  print "What's your name? "
  name = gets.chomp

  if name.end_with?('!')
    puts "HELLO #{name.upcase.chop} WHY ARE WE SCREAMING, WHAT ARE WE WOMEN?"
  else
    puts "Hello my sweet friend #{name.capitalize}."
  end
end

greeter

