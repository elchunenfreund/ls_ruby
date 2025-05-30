<<<<<<< HEAD
class Octal
  def initialize(int)
    @int = int
  end

  def to_decimal
    total = 0
    numbers = @int.split('').reverse
    return 0 unless numbers.all? { |n| n =~ /[0-7]/}
    numbers.each_with_index do |int, idx|
      total += int.to_i * 8 ** idx
    end
    total
  end

  def self.to_decimal(int)
    self.new(int).to_decimal(int)
  end

end
Octal.new('2047').to_decimal
=======
class Octal
  def initialize(int)
    @int = int
  end

  def to_decimal
    total = 0
    numbers = @int.split('').reverse
    return 0 unless numbers.all? { |n| n =~ /[0-7]/}
    numbers.each_with_index do |int, idx|
      total += int.to_i * 8 ** idx
    end
    total
  end

  def self.to_decimal(int)
    self.new(int).to_decimal(int)
  end

end
Octal.new('2047').to_decimal
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
