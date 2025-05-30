<<<<<<< HEAD
def center_of(a)
  str = a.chars
  until str.size <= 2
    str.shift
    str.pop
  end
  str.join
end

# LS solution
def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

p center_of('I love Ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
=======
def center_of(a)
  str = a.chars
  until str.size <= 2
    str.shift
    str.pop
  end
  str.join
end

# LS solution
def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

p center_of('I love Ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
