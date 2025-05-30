<<<<<<< HEAD
class Robot
  @@list_of_names = []
  def initialize
    @name = generate_unique_name
  end

  def generate_unique_name
    loop do
      letters = 2.times.map { ('A'..'Z').to_a.sample }.join
      digits = format('%03d', rand(1000))
      name = letters + digits
      unless @@list_of_names.include?(name)
        @@list_of_names << name
        return name
      end
    end
  end

  def name
    @name
  end

  def reset
    @@list_of_names.delete(@name)
    @name = generate_unique_name
  end
end
=======
class Robot
  @@list_of_names = []
  def initialize
    @name = generate_unique_name
  end

  def generate_unique_name
    loop do
      letters = 2.times.map { ('A'..'Z').to_a.sample }.join
      digits = format('%03d', rand(1000))
      name = letters + digits
      unless @@list_of_names.include?(name)
        @@list_of_names << name
        return name
      end
    end
  end

  def name
    @name
  end

  def reset
    @@list_of_names.delete(@name)
    @name = generate_unique_name
  end
end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
