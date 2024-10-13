=begin
  rules: a year is a leap year if its evenly deviseble by 4
  unless its deviseble by hundred, then its not.
  but if its deviseble by 400 then it is a leap years
=end

def leap_year?(int)
  if (int < 1752) && (int % 4) == 0
    true
  else
    case
    when (int % 400) == 0
      true
    when (int % 100) == 0
      false
    when (int % 4) == 0
      true
    when int
      false
    end
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

