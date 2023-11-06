# frozen_string_literal: true

pratice_again.rb

# Maximum subarray sum
def max_sequence(array)
  (1..array.size).map { |i| array.each_cons(i) {|e| p e} }  
  puts (1..array.size).map { |i| array.each_cons(i).map(&:sum) }
end



def max_sequence(arr)
  return 0 if arr.all? { |i| i.negative? }
  return arr.sum if arr.all? { |i| i.positive?}
  max = arr[0]
  for x in 1..arr.length
    arr.each_cons(x) do |sub| 
      p sub
      max = sub.sum if sub.sum > max
    end
  end
  max
end

max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])

# %w[1 2 3 4 5].each_cons(2){|e| p e }

# arrays = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# sums = arrays.map(&:sum)