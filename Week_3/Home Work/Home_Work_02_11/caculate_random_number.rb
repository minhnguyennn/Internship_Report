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
