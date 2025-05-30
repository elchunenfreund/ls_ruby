<<<<<<< HEAD
require 'minitest/autorun'
require_relative '10_diamond'

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end
=======
require 'minitest/autorun'
require_relative '10_diamond'

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
