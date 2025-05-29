flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}

flintstones.each_with_index do |obj, ind|
  flintstones_hash[obj] = ind
end

p flintstones_hash
