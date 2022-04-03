module Enumerable
  def my_each_with_index
    i = 0

    while i < self.length
      yield(self[i], i)
      i += 1
    end

    self
  end

  def my_select
    i = 0
    result = []

    while i < self.length
      result << self[i] if yield(self[i])
      i += 1
    end

    result
  end

  def my_all?
    i = 0
    result = true

    while i < self.length && result
      result = yield(self[i])
      i += 1
    end

    result
  end

  def my_any?
    i = 0

    while i < self.length
      return yield(self[i]) if yield(self[i])
      i += 1
    end

    false
  end

  def my_none?
    i = 0
    result = true

    while i < self.length && result
      result = !yield(self[i])
      i += 1
    end

    result
  end

  def my_count
    return self.length unless block_given?

    i = 0
    result = 0

    while i < self.length
      result += 1 if yield(self[i])
      i += 1
    end

    result
  end

  def my_map
    i = 0
    result = []

    while i < self.length
      result << yield(self[i])
      i += 1
    end

    result
  end

  def my_inject(initial_value = nil)
    i = 0
    result = initial_value unless initial_value.nil?

    while i < self.length && result
      result = yield(result, self[i])
      i += 1
    end

    result
  end
end

class Array
  def my_each
    i = 0

    while i < self.length
      yield(self[i])
      i += 1
    end

    self
  end
end

