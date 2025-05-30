<<<<<<< HEAD
class DNA
  attr_reader :dna
  def initialize(str)
    @dna = str
  end

  def hamming_distance(other)
    differences = 0
    [dna.size, other.size].min.times do |index|
      differences += 1 if dna[index] != other[index]
    end
    differences
  end
end
=======
class DNA
  attr_reader :dna
  def initialize(str)
    @dna = str
  end

  def hamming_distance(other)
    differences = 0
    [dna.size, other.size].min.times do |index|
      differences += 1 if dna[index] != other[index]
    end
    differences
  end
end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
