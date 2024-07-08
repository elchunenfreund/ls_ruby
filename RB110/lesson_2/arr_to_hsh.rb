arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hash = {}
arr.each do |x|
  new_hash[x[0]] = x[1]
end

p new_hash
