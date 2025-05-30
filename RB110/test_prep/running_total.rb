<<<<<<< HEAD
def running_total(arr)
  sum = 0
  arr.map {|x| sum += x}
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


=======
def running_total(arr)
  sum = 0
  arr.map {|x| sum += x}
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
