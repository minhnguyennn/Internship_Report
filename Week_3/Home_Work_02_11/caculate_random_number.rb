# frozen_string_literal: true

def generate_numbers(amount)
  (1..100).to_a.sample(amount)
end

def generate_operation(amount)
  ['+', '-'].sample(amount)
end

def caculate(length, amount)
  return 0 if !(2..3).include?(amount) || length <= 0

  array_caculate = []
  while array_caculate.size < length
    expression = generate_numbers(amount).zip(generate_operation(amount - 1)).flatten.join(' ')
    result = eval(expression)
    array_caculate << expression if result.positive? && result <= 100 && !array_caculate.include?(result)
  end
  array_caculate
end

require 'test/unit'
# class Test::Unit
class TestMethodExample < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_non_empty_strings
    assert_equal(3, caculate(3, 3).size)
    assert_equal(0, caculate(0, 2).size)
    assert_equal(0, caculate(0, 3).size)
    assert_equal(1, caculate(1, 2).size)
    assert_equal(1, caculate(1, 3).size)
    assert_equal(2, caculate(2, 2).size)
    assert_equal(3, caculate(3, 2).size)
    assert_equal(3, caculate(3, 3).size)
  end
end