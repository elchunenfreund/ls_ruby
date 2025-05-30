<<<<<<< HEAD
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def group(int)
  case int
  when 0..17
    "kid"
  when 18..64
    "adult"
  else
    "senior"
  end
end

changes = {}

munsters.each do |name, hsh|
  hsh.each do |key, value|
      changes[name] = {"age_group" => group(value)} if key == "age"
  end
end

changes.each do |name, new_values|
  munsters[name].merge!(new_values)
end

p munsters

# LS sulution
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
=======
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def group(int)
  case int
  when 0..17
    "kid"
  when 18..64
    "adult"
  else
    "senior"
  end
end

changes = {}

munsters.each do |name, hsh|
  hsh.each do |key, value|
      changes[name] = {"age_group" => group(value)} if key == "age"
  end
end

changes.each do |name, new_values|
  munsters[name].merge!(new_values)
end

p munsters

# LS sulution
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
