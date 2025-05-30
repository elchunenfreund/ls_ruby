<<<<<<< HEAD
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

a = ages.reject {|k,v| v > 100}

ages.keep_if {|k,v| v < 100}

p a
p ages
=======
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

a = ages.reject {|k,v| v > 100}

ages.keep_if {|k,v| v < 100}

p a
p ages
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
