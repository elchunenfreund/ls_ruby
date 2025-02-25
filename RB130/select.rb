def select(arr)
  counter = 0
  new_arr = []

  while counter < arr.size
    if yield(arr[counter])
      new_arr << arr[counter]
    end
    counter += 1
  end

  new_arr
end

array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
