# frozen_string_literal: true

practice_codewar.rb

# Leap Years
def leap_year(year)
  DateTime.leap?(year)
end

# Number-Star ladder
def pattern(number)
  number == 1 ? '1' : pattern(number - 1) + "\n1#{'*' * (number - 1)}#{number}"
end

# See You Next Happy Year
def next_happy_year(year)
  next_year = year.to_i + 1
  is_happy_year = next_year.to_s.chars.uniq.length == year.to_s.length
  return next_happy_year(next_year) unless is_happy_year

  next_year
end

# Find The Duplicated Number in a Consecutive Unsorted List
def find_dup(arr)
  arr.detect { |e| arr.count(e) > 1 }
end

# Elevator Distance
def elevator_distance(arr)
  arr.each_cons(2).sum { |a, b| (a - b).abs }
end

# Find the odd int
def find_it(seq)
  seq.find { |x| seq.count(x).odd? }
end

# Highest and Lowest
def high_and_low(numbers)
  numbers = numbers.split.map(&:to_i)
  "#{numbers.max} #{numbers.min}"
end
	
# Find the unique number
def find_uniq(arr)
  arr.uniq.each { |x| return x if arr.count(x) == 1 }
end

# Break camelCase
def solution_one(string)
  # complete the function
  arr = []
  string.chars.each do |char|
    arr << '' if char == char.upcase
    arr << char
  end
  arr.join
end

def solution_two(string)
  # complete the function
  string.gsub(/([A-Z])/, ' \1')
end

#Two Sum
def two_sum(numbers, target)
  numbers.each_with_index do |n1, i1|
    numbers.each_with_index do |n2, i2|
      return [i1, i2] if (n1 + n2) == target && i1 != i2
    end
  end
end

def persistence(arr_a, arr_b)
  # your code
  arr_a.each_with_index do |number1, index1|
    arr_b.each_with_index do |number2, index2|
      if number1 == number2 && index1 != index2
        p arr_a.delete(number1)
      end
    end
  end
end
p persistence([1,2],[1])
