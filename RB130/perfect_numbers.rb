<<<<<<< HEAD
class PerfectNumber

  def self.classify(int)
    raise StandardError unless int > 0
    result = 0
    (1..int).to_a.each do |divisor|
      result += divisor if divisor != int && int % divisor == 0
    end

    if result == int 
        'perfect'
    elsif result > int
        'abundant'
    elsif result < int
        'deficient'
    end
  end
end

# LS Solution
class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1
    sum = sum_of_factors(number)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      (1...number).select do |possible_divisor|
        number % possible_divisor == 0
      end.sum
    end
  end
end
p PerfectNumber.classify(13)




=======
class PerfectNumber

  def self.classify(int)
    raise StandardError unless int > 0
    result = 0
    (1..int).to_a.each do |divisor|
      result += divisor if divisor != int && int % divisor == 0
    end

    if result == int 
        'perfect'
    elsif result > int
        'abundant'
    elsif result < int
        'deficient'
    end
  end
end

# LS Solution
class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1
    sum = sum_of_factors(number)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      (1...number).select do |possible_divisor|
        number % possible_divisor == 0
      end.sum
    end
  end
end
p PerfectNumber.classify(13)




>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
