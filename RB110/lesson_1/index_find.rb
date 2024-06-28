flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

a = flintstones.index {|x| x.start_with?('Be')}

b = flintstones.index {|x| x[0,2] == 'Be'}

p a
p b
