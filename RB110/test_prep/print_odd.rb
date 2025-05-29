def print_odd
  for x in (1..99)
    puts x if x.odd?
  end
end

print_odd

#LS solution
value = 1
while value <= 99
  puts value
  value += 2
end
