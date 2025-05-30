<<<<<<< HEAD
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

=======
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

>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
