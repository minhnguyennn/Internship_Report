# frozen_string_literal: true

# Count characters in your string.
def count_chars(str)
  hash = {}
  str.chars.uniq.each do |char|
    hash[char] = str.count(char)
  end
  hash
end

# Persistent Bugger.
def persistence(numbers)
  # your code
  return 0 if numbers.to_s.chars.size == 1

  result = numbers.to_s.chars.inject(1) { |accumulator, number| accumulator * number.to_i }
  1 + persistence(result)
end

# Extract the domain name from a URL
def domain_name(url)
  # return just the domain name
  source_string = url.sub(/http:/, '').sub(/https:/, '').sub(/www./, '').split(%r{[/?#]})[0]
  source_string.split('.')[0]
end

# Array.diff
def array_diff(arr_a, arr_b)
  # your code
  result = []
  arr_a.each do |number|
    result << number unless arr_b.include?(number)
  end
  result
end

# The Supermarket Queue
def solve_supermarket_queue(customers, n)
  if customers.empty?
    return 0
  elsif n == 1
    return customers.sum
  end

  result = Array.new(n, 0)

  customers.each do |customer|
    result[0] += customer
    result.sort!
  end

  return result[n - 1]
end
