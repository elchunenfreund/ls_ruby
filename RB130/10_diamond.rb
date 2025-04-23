class Diamond
  def self.make_diamond(max_letter)
    return "A\n" if max_letter == 'A'

    range = ('A'..max_letter).to_a
    diamond_width = max_letter.ord - 'A'.ord
    result = []

    # Generate top half (including middle row)
    range.each_with_index do |char, idx|
      side_spaces = ' ' * (diamond_width - idx)
      if char == 'A'
        result << side_spaces + char + side_spaces
      else
        inner_spaces = ' ' * (idx * 2 - 1)
        result << side_spaces + char + inner_spaces + char + side_spaces
      end
    end

    # Generate bottom half (excluding middle row)
    bottom_half = result[0...-1].reverse

    (result + bottom_half).join("\n") + "\n"
  end
end
