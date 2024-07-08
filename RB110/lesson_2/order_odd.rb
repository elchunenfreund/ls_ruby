arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

new_arr = arr.sort_by do |x|
  x.select do |y|
    y.odd?
  end
end

p new_arr
