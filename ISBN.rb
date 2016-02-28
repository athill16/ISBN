def isbn_check(number)

	invalid_characters = ["-", " "]
	invalid_characters.each do |character|
		number.delete! character if number.include? character
	end
	number

end

