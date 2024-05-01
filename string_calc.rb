class StringCalc
  def self.add(numbers)
    raise ArgumentError, 'Invalid input! Please add only string' unless numbers.is_a?(String)
    return 0 if numbers.empty?

    numbers = numbers.split(',').map(&:to_i).sum
  end
end
