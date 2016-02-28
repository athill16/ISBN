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

def invalid_characters(number)
	if number =~ /\D/
		false
	else
		true
	end
end

def isbn_last_element_is_x(number)

	number = number.split("")
	if number[9] == "X" || number[9] == "x"
		number[9] = "10"
	end
	number

end





