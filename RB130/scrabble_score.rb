<<<<<<< HEAD
class Scrabble
  attr_reader :word
  def initialize(word)
    @word = word
  end

  SCRABBLE_SCORE = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  def self.score(word)
    self.new(word).score
  end

  def score
    return 0 if word.nil? || word.empty?
    
    total_score = 0
    word.upcase.chars.each do |char|
      SCRABBLE_SCORE.each do |score, letters|
        total_score += score if letters.include?(char)
      end
    end
    total_score
  end
end

# LS Solution
class Scrabble
  attr_reader :word

  POINTS = {
    'AEIOULNRST'=> 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
}
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars

    total = 0
    letters.each do |letter|
      POINTS.each do |all_letters, point|
        total += point if all_letters.include?(letter)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

p Scrabble.new('f').score
=======
class Scrabble
  attr_reader :word
  def initialize(word)
    @word = word
  end

  SCRABBLE_SCORE = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  def self.score(word)
    self.new(word).score
  end

  def score
    return 0 if word.nil? || word.empty?
    
    total_score = 0
    word.upcase.chars.each do |char|
      SCRABBLE_SCORE.each do |score, letters|
        total_score += score if letters.include?(char)
      end
    end
    total_score
  end
end

# LS Solution
class Scrabble
  attr_reader :word

  POINTS = {
    'AEIOULNRST'=> 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
}
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars

    total = 0
    letters.each do |letter|
      POINTS.each do |all_letters, point|
        total += point if all_letters.include?(letter)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

p Scrabble.new('f').score
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
