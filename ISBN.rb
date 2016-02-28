def verify_length(number)

	number.length == 10 or number.length == 13

end

def delete_hyphens_and_spaces(number)

	invalid_characters = ["-", " "]
	invalid_characters.each do |character|
		number.delete! character if number.include? character
	
	end
	number

end


