class CustomSet
  attr_accessor :set

  def initialize(set = [])
    @set = set
  end

  def add(int)
    set << int unless set.include?(int)
  end

  def subset?(other)
    return false if other.set.empty? unless set.empty? && other.set.empty?
    return true if set.all? { |int| other.set.include?(int) }
    false
  end

  def disjoint?(other)
    return false if set.any? { |int| other.set.include?(int) }
    true
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def intersection(other)
    result = set.select { |int| other.set.include?(int) }
  end

  def union(other)
    set.union(other.set)
  end

  def difference(other)
    result = set.select { |int| !other.set.include?(int) }
  end

  def contains?(int)
    set.include?(int)
  end

  def empty?
    set.empty?
  end
end

