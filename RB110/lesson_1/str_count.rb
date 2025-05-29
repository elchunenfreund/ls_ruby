statement = "The Flintstones Rock"
hsh = {}

statement.chars.each do |x|
  if hsh.include?(x)
    hsh[x] += 1
  else
    hsh[x] = 1
  end
end

p hsh

# LS sulution

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

p result
