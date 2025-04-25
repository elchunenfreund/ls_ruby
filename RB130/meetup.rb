require 'date'

class Meetup
  attr_accessor :month

  def initialize(year, month)
    first_day = Date.new(year, month, 1)
    last_day = Date.new(year, month, -1)
    @month = (first_day..last_day).to_a
  end

  
end

march = Meetup.new(2025, 4)
p march.month

