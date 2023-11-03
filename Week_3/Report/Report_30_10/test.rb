# frozen_string_literal: true

test.rb

# Find even or odd number
def even_or_odd(number)
  number.even? ? 'Even' : 'Odd'
end

# Find square digis of number
def square_digits(num)
  # code goes here
  num.to_s.chars.map { |x| x.to_i**2 }.join.to_i
end

# Find plural
def plural(number)
  # code here...
  number != 1
end

# Find Distance between points in 2D
def distance_between_points(point_a, point_b)
  Math.hypot(point_a.x - point_b.x, point_a.y - point_b.y)
end

# Find Return Negative
def make_negative(num)
  # Enter code here
  -num.abs
end

# Find Is the string uppercase?
class String
  def upcase?
    self == upcase
  end
end

# Find To square(root) or not to square(root)
def square_or_square_root(arr)
  arr.map do |number|
    (Math.sqrt(number) % 1).zero? ? Math.sqrt(number).to_i : number**2
  end
end

# Find 8 kyu Is he gonna survive?
def hero(bullets, dragons)
  dragons <= bullets / 2
end

# Returning Strings
def greet(name)
  "Hello, #{name} how are you doing today?"
end

# Collatz Conjecture (3n+1)
def hotpo(number)
  return count if n == 1

  count = 0
  while number > 1
    number.even? ? number /= 2 : number = 3 * number + 1
    count += 1
  end
  count
end

# Get Planet Name By ID
def get_planet_name(id)
  %w[0 Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune][id]
end

# Simple Fun #261: Whose Move
def whose_move(last_player, win)
  if win
    last_player
  else
    last_player == 'black' ? 'white' : 'black'
  end
end

# Classy Classes
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def info
    "#{@name}s age is #{@age}"
  end
end
