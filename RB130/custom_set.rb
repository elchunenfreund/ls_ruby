class CustomSet
  attr_accessor :set

  def initialize(set = [])
    @set = set.uniq
  end

  def add(int)
    set << int unless set.include?(int)
    self
  end

  def subset?(other)
    set.all? { |int| other.set.include?(int) }
  end

  def disjoint?(other)
    return false if set.any? { |int| other.set.include?(int) }
    true
  end

  def eql?(other)
    set.sort == other.set.sort
  end

  def intersection(other)
    CustomSet.new(set.select { |int| other.set.include?(int) })
  end

  def union(other)
    CustomSet.new(set.union(other.set))
  end

  def difference(other)
    CustomSet.new(set.select { |int| !other.set.include?(int) })
  end

  def contains?(int)
    set.include?(int)
  end

  def empty?
    set.empty?
  end

  def ==(other)
    set.uniq.sort == other.set.uniq.sort
  end
end

