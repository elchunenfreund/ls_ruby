<<<<<<< HEAD
require 'date'

class Meetup
  attr_accessor :month

  def initialize(year, month)
    @month = (Date.civil(year, month, 1)..Date.civil(year, month, -1)).to_a
  end

  def day(weekday, number)
    short_list = correct_days(weekday)

    case number.downcase
    when 'first' then short_list[0]
    when 'second' then short_list[1]
    when 'third' then short_list[2]
    when 'fourth' then short_list[3]
    when 'fifth' then short_list[4]
    when 'last' then short_list[-1]
    when 'teenth'
      short_list.each do |date|
        return date if (13..19).to_a.include?(date.day)
      end
    end
  end

  def correct_days(weekday)
    case weekday.downcase
    when 'sunday' then month.select(&:sunday?)
    when 'monday' then month.select(&:monday?)
    when 'tuesday' then month.select(&:tuesday?)
    when 'wednesday' then month.select(&:wednesday?)
    when 'thursday' then month.select(&:thursday?)
    when 'friday' then month.select(&:friday?)
    when 'saturday' then month.select(&:saturday?)
    end
  end
end
=======
require 'date'

class Meetup
  attr_accessor :month

  def initialize(year, month)
    @month = (Date.civil(year, month, 1)..Date.civil(year, month, -1)).to_a
  end

  def day(weekday, number)
    short_list = correct_days(weekday)

    case number.downcase
    when 'first' then short_list[0]
    when 'second' then short_list[1]
    when 'third' then short_list[2]
    when 'fourth' then short_list[3]
    when 'fifth' then short_list[4]
    when 'last' then short_list[-1]
    when 'teenth'
      short_list.each do |date|
        return date if (13..19).to_a.include?(date.day)
      end
    end
  end

  def correct_days(weekday)
    case weekday.downcase
    when 'sunday' then month.select(&:sunday?)
    when 'monday' then month.select(&:monday?)
    when 'tuesday' then month.select(&:tuesday?)
    when 'wednesday' then month.select(&:wednesday?)
    when 'thursday' then month.select(&:thursday?)
    when 'friday' then month.select(&:friday?)
    when 'saturday' then month.select(&:saturday?)
    end
  end
end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
