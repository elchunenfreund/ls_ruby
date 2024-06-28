flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|x| x[0, 3]}

p flintstones
