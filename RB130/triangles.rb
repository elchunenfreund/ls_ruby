<<<<<<< HEAD
class Triangle
  attr_reader :triangle

  def initialize(int1, int2, int3)
    @triangle = [int1, int2, int3]
    raise ArgumentError unless valid_triangle?(triangle)
  end

  def valid_triangle?(arr)
    arr.each do |side|
      return false if arr.sum - side <= side || side <= 0
    end
  end

  def equilateral?
    triangle.all? { |x| x == triangle[0] }
  end

  def isosceles?
    result = false
    triangle.each do |side| 
      result = true if triangle.count(side) == 2
    end
    result
  end

  def scalene?
    result = false
    triangle.each do |side| 
      result = true if triangle.count(side) == 1
    end
    result
  end

  def kind 
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    elsif scalene?
      'scalene'
    end
  end
=======
class Triangle
  attr_reader :triangle

  def initialize(int1, int2, int3)
    @triangle = [int1, int2, int3]
    raise ArgumentError unless valid_triangle?(triangle)
  end

  def valid_triangle?(arr)
    arr.each do |side|
      return false if arr.sum - side <= side || side <= 0
    end
  end

  def equilateral?
    triangle.all? { |x| x == triangle[0] }
  end

  def isosceles?
    result = false
    triangle.each do |side| 
      result = true if triangle.count(side) == 2
    end
    result
  end

  def scalene?
    result = false
    triangle.each do |side| 
      result = true if triangle.count(side) == 1
    end
    result
  end

  def kind 
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    elsif scalene?
      'scalene'
    end
  end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
end