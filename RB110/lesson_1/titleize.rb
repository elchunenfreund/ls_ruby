words = "the flintstones rock"

arr = words.split.map {|x| x.capitalize!}.join(' ')
p arr

