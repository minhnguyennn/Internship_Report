require 'test/unit'
require_relative 'caculate_random_number.rb'

# class Test::Unit

class TestMethodCaculate < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_length_array
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
