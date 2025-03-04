each([1, 2, 3, def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end4, 5]) do |num|
  puts num
end

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

def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number
end

def reduce(arr, var = 0)
  counter = 0
  acc = var

  while counter < arr.size

    acc = yield(acc, arr[counter])
    counter += 1
  end

  acc
end

def any?(arr)
  arr.each { |obj| return true if yield(obj)}
  false
end

def all?(arr)
  arr.each { |obj| return false unless yield(obj) }
  true
end

def none?(arr)
  arr.each { |obj| return false if yield(obj) }
  true
end

def one?(arr)
  seen_one = false
  arr.each do |obj|
    next unless yield(obj)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

def count(arr)
  counter = 0
  arr.each { |obj| counter += 1 if yield(obj) }
  counter
end

def map(arr)
  arr.each_with_object([]) { |obj, collection|  collection << yield(obj) }
end

def count(*args)
  counter = 0
  args.each { |obj| counter += 1 if yield(obj) }
  counter
end

def drop_while(arr)
  result = []
  arr.each_with_index do |obj, ind|unless yield(obj)
      result = arr[ind..-1]
      return result
    end
  end
  result
end

def each_with_index(arr)
  counter = 0
  arr.each do |obj|
    yield(obj, counter)
    counter += 1
  end
end

def each_with_object(arr, obj)
  arr.each { |object| yield(object, obj) }
  obj
end

def max_by(array)
  return nil if array.empty?

  max_element = array.first
  largest = yield(max_element)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end

def each_cons(array, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}