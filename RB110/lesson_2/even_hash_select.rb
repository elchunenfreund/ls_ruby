<<<<<<< HEAD
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.map do |x|
  x.select do |k, v|
    v if v.all? {|x| x.even?}
  end
end

p new_arr

# LS Solution, and alot simpler
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}]
=======
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.map do |x|
  x.select do |k, v|
    v if v.all? {|x| x.even?}
  end
end

p new_arr

# LS Solution, and alot simpler
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}]
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
