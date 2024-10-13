def count_chars
  print 'Please write a word or multiple words: '
  str = gets.chomp
  size = str.delete(' ').size
  puts "there are #{size} characters in #{str}."
end

count_chars
