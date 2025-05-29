ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total = 0

ages.each_value do |val|
  total += val
end
p total

total_ages = 0

total_ages = ages.values.inject(:+)
p total
