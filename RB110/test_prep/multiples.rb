def multisum(int)
  arr = (0..int).to_a
  sum = arr.select {|x| x % 3 == 0 || x % 5 == 0}.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

