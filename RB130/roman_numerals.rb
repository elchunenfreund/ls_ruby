=begin
I = 1
V = 5
X = 10
L = 50
C = 100
D = 500
M = 1000

we begin with the largest number on left and go down from there
we also make one less to the right of every numebr i.e. IV = 4 while VI = 6
and that is concidered one number.

algo:
use modulo to calculate how many of each unit there are and assign the
total of each calculation to the end result

=end

class RomanNumeral
  attr_accessor :number
  def initialize(int)
    @number = int
    @result = []
  end

  def to_roman
    result << thousands(number)
    result << hundreds(number)
    result << tens(number)
    result << ones(number)
  end

  def thousands(int)
    times = int / 1000

    case times
    when 1
      'M'
    when 2
      'MM'
    when 3
      'MMM'
    end
    number -= times * 1000
  end

  def hundreds(int)
    times = int / 100

    case times
    when 100
      'C'
    when 200
      'CC'
    when 300
      'CCC'
    when 400
      'CD'
    when 500
      'D'
    when 600
      'DC'
    when 700
      'DCC'
    when 800
      'DCCC'
    when 900
      'CM'
    end
    number -= times * 100
  end

  def tens
  end

  def ones
  end

end



