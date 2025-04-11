class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |ana|
      ana.downcase != word && anagram?(ana, word)
    end
  end

  private

  def sorted_letters(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted_letters(word1) == sorted_letters(word2)
  end
end