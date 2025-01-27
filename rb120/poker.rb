class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  attr_accessor :deck, :hand

  def initialize(deck)
    @deck = deck
    @hand = []
    5.times { self.hand << @deck.draw }
  end

  def print
    hand.each { |card| puts card }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  # private

  def royal_flush?
    hand.max.value == 14 && straight_flush?
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    pair_finder(2)
  end

  def full_house?

  end

  def flush?
    hand.all? { |card| hand[0].suit == card.suit }
  end

  def straight?
    min, max = hand.minmax
    max.value - min.value == 4
  end

  def three_of_a_kind?
    pair_finder(3)
  end
# reson for concern!!
  def two_pair?
    pair_finder(3)
  end

  def pair?
    pair_finder(4)
  end

  def pair_finder(left_over)
    hand.uniq { |card| card.value }.size == left_over
  end
end

class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.two_pair?
