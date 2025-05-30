<<<<<<< HEAD
def fizzbuzz(int1, int2)
  (int1..int2).each do |int|
    if (int % 3 == 0) && (int % 5 == 0)
      p 'FizzBuzz'
    elsif int % 3 == 0
      p 'Fizz'
    elsif int % 5 == 0
      p 'Buzz'
    else
      p int
    end
  end
end

fizzbuzz(1, 15)
=======
def fizzbuzz(int1, int2)
  (int1..int2).each do |int|
    if (int % 3 == 0) && (int % 5 == 0)
      p 'FizzBuzz'
    elsif int % 3 == 0
      p 'Fizz'
    elsif int % 5 == 0
      p 'Buzz'
    else
      p int
    end
  end
end

fizzbuzz(1, 15)
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
