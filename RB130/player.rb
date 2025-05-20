class Player
  attr_accessor :name, :health

  def initialize(name, health = 50)
    @name = name.capitalize
    @health = health
  end

  def to_s
    if dead?
      "I was #{@name}, now I am dead :(."
    else
      "I'm #{@name} with health = #{@health}."
    end
  end

  def boost
    raise NoMethodError if dead?
    @health += 20
  end

  def hurt
    raise NoMethodError if dead?
    @health -= 10
  end

  def dead?
    @health < 0
  end
end
