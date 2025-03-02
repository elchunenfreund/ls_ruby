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
