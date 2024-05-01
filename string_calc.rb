class StringCalc
  def self.add(numbers)
    raise ArgumentError, 'Invalid input! Please provide a string' unless numbers.is_a?(String)
    return 0 if numbers.empty?

    delimiter = detect_delimiter(numbers)
    validate_input_format(numbers, delimiter)

    numbers_array = numbers.split(/[#{delimiter}\n]+/).map(&:to_i)
    check_for_negatives(numbers_array)

    numbers_array = filter_numbers(numbers_array)
    numbers_array.sum
  end

  private

  def self.detect_delimiter(numbers)
    if numbers.start_with?("//")
      delimiter_section = numbers.match(/\/\/(.+?)\n/)[1]
      numbers.sub!("//#{delimiter_section}\n", "")
      delimiter_section
    else
      ","
    end
  end

  def self.validate_input_format(numbers, delimiter)
    raise ArgumentError, "Invalid input format" if numbers.end_with?("\n") || numbers.include?("\n ")
  end

  def self.check_for_negatives(numbers_array)
    negatives = numbers_array.select { |num| num.negative? }
    raise ArgumentError, "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?
  end

  def self.filter_numbers(numbers_array)
    numbers_array.select { |num| num <= 1000 }
  end
end
