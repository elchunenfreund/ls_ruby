# add()
=begin
Given two integers
- add them up
- print the result

START Given two integers.
- sum = num1 + num2
PRINT puts sum
END
=end

#join()
=begin
- Given a array of strings (or other objects).
- return a string that adds them all up

START Given a list of strings as parameters.
- call .join on the parameter
END
=end

#every_other()
=begin
- Given a array of integers.
- return every other integer in the array.

START Given a array of integers.
SET counter = 0
SET array = []
LOOP arr.each |int|
  - IF counter.odd?
  - array.push(int)
  - counter += 1
  RETURN array
END
=end

#third_time(str)
=begin
- Given a srting
- return the index of the third time a letter is mentiond

START Given a sting
SET iterator = 0
LOOP array.each_char.with_index do |car, ind|
  - IF car == ind
    - iterator += 1
    - RETURN ind if count == 3
    END
END
return nil
=end

#merge()
=begin
Given two arrays
- return the result of merging the two arrays

START given two arrays
- SET array to both arrrays and use transpose to well... transpose the arrays.
- SET use flatten to combine the arrays
- RETURN  the result of merging the arrays
END

end
=end
