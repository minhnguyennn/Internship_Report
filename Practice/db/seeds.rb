20.times do |i|
	puts "Creating student #{i + 1}"
	Student.create(
		first_name: "Student #{i + 1}",
		last_name: "Lname #{i + 1}",
		email: "student#{i + 1}@gmail.com"
	)
end