<<<<<<< HEAD
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

class CarTest < Minitest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end
end
=======
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

class CarTest < Minitest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end
end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
