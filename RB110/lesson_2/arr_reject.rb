arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_arr = arr.map do |x|
  x.reject do |y|
    y % 3 != 0
  end
end

p new_arr

# LS Solution, not a fan...
arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end
# => [[], [3, 12], [9], [15]]
