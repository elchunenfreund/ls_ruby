class Series
  def initialize(number)
    @number = number.split('').map(&:to_i)
  end

  def slices(int)
    result = []
    raise ArgumentError if int > @number.size

    @number.each_cons(int) { |sub| result << sub }
    result
  end
end

series = Series.new('81228')

