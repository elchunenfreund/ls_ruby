def cleanup(str)
  str = str.gsub(/[^\w]/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '

def word_sizes(str)
  size_hsh = {}
  arr = str.split.map do |x|
    clean_word = x.delete('^A-Za-z')
    size_hsh.key?(clean_word.size) ? size_hsh[clean_word.size] += 1 : size_hsh[clean_word.size] = 1
  end
  size_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
