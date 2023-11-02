# frozen_string_literal: true

# Write Number in Expanded Form
def expanded_form(num)
  array_reverse = num.to_s.chars.reverse
  result = array_reverse.map.with_index { |char, index| char.to_i * 10**index }
  result.reverse.reject(&:zero?).join(' + ')
end

# up AND down
def arrange(strng)
  words = strng.split(' ')
  words.size.times do |i|
    words[i, 2] = words[i, 2].sort { |w1, w2| i.even? ? w1.length <=> w2.length : w2.length <=> w1.length }
  end
  words.map.with_index { |_value, i| i.odd? ? words[i].upcase : words[i].downcase }.join(' ')
end

# Moving Zeros To The End
def moveZeros(arr)
  zeros = arr.count(0)
  arr.delete(0)
  arr.fill(0, arr.size, zeros)
end

# Snail
def snail(array)
  # enjoy
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end

# So Many Permutations!
def permutations(string)
  #your code here
  string.chars.permutation.map{|a| a.join}.uniq
end

# Give me a Diamond
def diamond(n)
  return nil if n.even? || n < 1
  x = 0
  add = line(x, n)
  diam = add
  while (x += 2) < n
    add = line(x / 2, n - x)
    diam = add + diam + add
  end
  return diam
end

def repeat(str, x)
  str * x
end

def line(spaces, stars)
  " " * spaces + "*" * stars + "\n"
end
