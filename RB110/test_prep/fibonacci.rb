def fibonacci_init(int)
  arr = [1,1]
  int.times do |x|
    arr << arr[-2] + arr[-1]
  end
  arr
end

def find_fibonacci_index_by_length(int)
  counter = 0
  until fibonacci_init(counter).last.to_s.size >= int
    counter += 1
  end
  counter + 2
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847




