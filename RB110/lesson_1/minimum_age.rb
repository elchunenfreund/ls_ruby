<<<<<<< HEAD
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
min = 10000
a = ''
ages.each do |k, v|
  a = v
  if min > a
    min = v
  end
  min
end

p min

p ages.values.min


=======
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
min = 10000
a = ''
ages.each do |k, v|
  a = v
  if min > a
    min = v
  end
  min
end

p min

p ages.values.min


>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
