# frozen_string_literal: true

code_wars.rb

def pig_it text
	arr = text.to_a
  arr.each { |e| e.split(/ /) }
  p arr
end
pig_it('Pig latin is cool')
