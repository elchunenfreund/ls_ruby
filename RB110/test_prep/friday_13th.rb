require 'date'

def friday_13th(year)
  start = Date.new(year, 1, 1)
  limit = Date.new(year, 12, 31)
  counter = 0
  start.upto(limit) {|day| counter += 1 if day.mday == 13 && day.friday? }
  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
