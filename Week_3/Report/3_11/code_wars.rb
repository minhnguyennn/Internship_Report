# frozen_string_literal: true

code_wars.rb

# Simple Pig Latin
def pig_it(text)
  text.gsub(/(\w)(\w+)*/, '\2\1ay')
end

# RGB To Hex Conversion
def color(rgb)
  rgb = 255 if rgb > 255
  rgb = 0 if rgb.negative?
  rgb = rgb.to_s(16).upcase
  rgb = "0#{rgb}" if rgb.length < 2
  rgb
end

def rgb(red, green, blue)
  color(red) + color(green) + color(blue)
end

# Directions Reduction
def dirReduc(arr)
  return arr if arr.nil? || arr.length <= 1

  (0...arr.length - 1).each do |i|
    next unless (arr[i] == 'NORTH' && arr[i + 1] == 'SOUTH') ||
                (arr[i] == 'SOUTH' && arr[i + 1] == 'NORTH') ||
                (arr[i] == 'EAST' && arr[i + 1] == 'WEST') ||
                (arr[i] == 'WEST' && arr[i + 1] == 'EAST')

    arr[i] = nil
    arr[i + 1] = nil
  end

  newArr = arr.compact

  return arr if newArr.length == arr.length

  dirReduc(newArr)
end

# Rot13
def rot13(string)
  string.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

# Human readable duration format

def format_duration(total)
  if total.zero?
    'now'
  else
    duration = {
      year: total / (60 * 60 * 24 * 365),
      day: total / (60 * 60 * 24) % 365,
      hour: total / (60 * 60) % 24,
      minute: total / 60 % 60,
      second: total % 60
    }

    @output = []

    duration.each do |key, value|
      if value.positive?
        @output << "#{value} #{key}"
        @output.last << 's' if value != 1
      end
    end

    @output.join(', ').gsub(/,\s(?=\d+\s\w+$)/, ' and ')
  end
end

# Maximum subarray sum
def max_sequence(array)
  (1..array.size).map { |i| array.each_cons(i).map(&:sum) }.flatten.push(0).max
end

# Pete, the baker
def cakes(recipe, available)
  available.default = 0
  recipe.map { |k, v| available[k] / v }.min
end

cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
#cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 