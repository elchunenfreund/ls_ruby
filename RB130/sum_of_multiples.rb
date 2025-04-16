class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5];
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end
