def isbn_valid?(number)

	isbn_remove_hyphens_and_spaces(number)
	number.length
	if number.length == 10 || number.length == 13
		true
	else 
		false
	end

end

def isbn_remove_hyphens_and_spaces(number)

	invalid_characters = ["-", " "]
	invalid_characters.each do |character|
		if number.include?(character)
			number.delete!(character)
		end
	end
	number

end







