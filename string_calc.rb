class StringCalc
  def self.add(numbers)
    raise ArgumentError, 'Invalid input! Please add only string' unless numbers.is_a?(String)
    return 0 if numbers.empty?

    raise ArgumentError, "Invalid input format" if numbers.end_with?("\n") || numbers.include?("\n ")
    numbers_array = numbers.split(/[,\n]+/)

    negatives = numbers_array.select { |num| num.to_i.negative? }
    raise ArgumentError, "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers_array.map(&:to_i).sum
  end
end
