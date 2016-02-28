def isbn_remove_hyphens_and_spaces(number)

	invalid_characters = ["-", " "]
	invalid_characters.each do |character|
		number.delete! character if number.include? character
	end
	number

end

def isbn_count(number)

	number.length
	if number.length == 10 || number.length == 13
		true
	else 
		false
	end

end






