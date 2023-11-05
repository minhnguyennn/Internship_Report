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
def dir_reduc(arr)
  opposites = { 'NORTH' => 'SOUTH', 'SOUTH' => 'NORTH', 'EAST' => 'WEST', 'WEST' => 'EAST' }

  result = []

  arr.each do |direction|
    if result.last == opposites[direction]
      result.pop
    else
      result.push(direction)
    end
  end

  result
end

# Rot13
def rot13(string)
  string.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

# Human readable duration format
def seconds_in_minute
  60
end

def seconds_in_hour
  60 * seconds_in_minute
end

def seconds_in_day
  24 * seconds_in_hour
end

def seconds_in_year
  365 * seconds_in_day
end

def duration_hash(total)
  {
    year: total / seconds_in_year,
    day: (total % seconds_in_year) / seconds_in_day,
    hour: (total % seconds_in_day) / seconds_in_hour,
    minute: (total % seconds_in_hour) / seconds_in_minute,
    second: total % seconds_in_minute
  }
end

def format_duration(total)
  return 'now' if total.zero?

  output = duration_hash(total).map do |key, value|
    next if value.zero?

    str = "#{value} #{key}"
    str << 's' if value != 1
    str
  end

  output.compact.join(', ').gsub(/, (?=\d+ \w+$)/, ' and ')
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
