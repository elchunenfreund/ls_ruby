hsh = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# Chat GPT
new_hsh = hsh.map do |hash|
  hash.map do |key, value|
    [key, value + 1]
  end.to_h
end

p new_hsh

# LS Solution

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
