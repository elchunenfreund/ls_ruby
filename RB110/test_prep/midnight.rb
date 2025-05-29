DAY = 1440

def time_format(int1, int2)
  hr = "%02d" % int1
  mn = "%02d" % int2
  "#{hr}:#{mn}"
end

def time_of_day(int)
  if int.positive? || int == 0
    until int <= DAY
      int -= DAY
    end
  else
    until int.abs < DAY
      int += DAY
    end
    int = DAY + int
  end
  hour, min = int.divmod(60)
  time_format(hour, min)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

def before_midnight(str)
  hour = str.slice(0, 2).to_i * 60
  min = str.slice(3, 4).to_i
  total = min + hour
  total.positive? ? DAY - total : 0
end

def after_midnight(str)
  hour = str.slice(0, 2).to_i * 60
  min = str.slice(3, 4).to_i
  total = hour + min
  total < DAY ? total : 0
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

