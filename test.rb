require 'test/unit'
include Test::Unit::Assertions

def your_method(array)
  return false if !array.is_a?(Array) || array.size != 2 || array.any? { |element| !element.is_a?(String) || element.empty? }

  fisrt_string, last_string = array
  last_string.chars.uniq.all? { |char| fisrt_string.include?(char) }
end

Test::Unit::Assertions.assert_equal(your_method(["deltas", "slated"]), true)
