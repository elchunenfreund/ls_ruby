class Clock
  def self.at(hr, min = 0)
    self.new.at(hr, min)
  end

  def at(hr, min = 0)
    @hour = min / 60
    @min = min
    @time = [@hour, @min]
    format_time(hr, min)
  end

  def time
    @time
  end

  def format_time(hours, min)
    Kernel.format("%02d:%02d", hours, min)
  end

  def +(int)
    puts int
  end

  def to_s
    format_time(@hour, @min)
  end
end

p Clock.at(8).to_s

