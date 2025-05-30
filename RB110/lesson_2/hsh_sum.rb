<<<<<<< HEAD
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
new_hash = munsters.select do |key, value|
  value.value?('male')
end

sum = 0
new_hash.each do |key, value|
  sum += value['age']
end

p sum

# LS Sulution and way more elegent
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age # => 444



=======
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
new_hash = munsters.select do |key, value|
  value.value?('male')
end

sum = 0
new_hash.each do |key, value|
  sum += value['age']
end

p sum

# LS Sulution and way more elegent
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age # => 444



>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
