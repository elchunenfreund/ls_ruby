class Clock
  MIN_IN_A_DAY = 1440

  attr_reader :hours, :minutes
  def self.at(hr, min = 0)
    new(hr, min)
  end

  def initialize(hr, min)
    total_min = (hr * 60) + min

    total_min = total_min % MIN_IN_A_DAY
    total_min = total_min + MIN_IN_A_DAY if total_min < 0

    @hours = total_min / 60
    @minutes = total_min % 60
  end

  def +(int)
    self.class.at(hours, minutes + int)
  end

  def -(int)
    self.class.at(hours, minutes - int)
  end

  def ==(other)
    self.hours == other.hours && self.minutes == other.minutes
  end

  def to_s
    format("%02d:%02d", hours, minutes)
  end
end
