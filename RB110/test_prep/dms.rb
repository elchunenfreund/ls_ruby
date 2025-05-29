DEGREE = "\u00B0"

def format(int2, int3)
  min = "%02d" % int2
  sec = "%02d" % int3
  min + "'" + sec + "\""
end

def dms(int)
  degree = int.to_i
  minutes = (int % 1) * 60
  seconds = (minutes % 1) * 60
  "#{degree}#{DEGREE}#{format(minutes, seconds)}"
end

# All test cases should return true
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
