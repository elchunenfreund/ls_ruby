<<<<<<< HEAD
def short_long_short(str1, str2)
  if str1.size < str2.size
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
=======
def short_long_short(str1, str2)
  if str1.size < str2.size
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
