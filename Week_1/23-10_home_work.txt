Problem 1: Check array have two String and no empty String.
	   array = ["ab","abcd"]
	   def check_string_two_element (array_two_string)
	       return array_two_string.length == 2 && array_two_string.all? do |word| word.is_a?(String) && word.length > 0 end
	   end
	   puts check_string_two_element(array)
	   
Problem 2: Check all letters in the second String to see if they are at least in the first String.
	   array = [“abcd”,“abd”]

	   def check_string_two_element (array_two_string)
	       return array_two_string.length == 2 && array_two_string.all? do |word| word.is_a?(String) && word.length > 0 end
	   end

	   def check_sub_string (array_two_string)
	       if (check_string_two_element (array_two_string))
	          return array_two_string[1].split(//).all? { |char| array_two_string[0].include?(char) }
	       end
	   end

	   p check_sub_string(array)
