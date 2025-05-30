<<<<<<< HEAD
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vow = ['a', 'e', 'i', 'o', 'u']

hsh.each do |k, v|
  v.each do |str|
    str.chars do |x|
      puts x if vow.include?(x)
    end
  end
end
=======
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vow = ['a', 'e', 'i', 'o', 'u']

hsh.each do |k, v|
  v.each do |str|
    str.chars do |x|
      puts x if vow.include?(x)
    end
  end
end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
