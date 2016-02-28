def isbn_valid?(number)

	number = isbn_remove_hyphens_and_spaces(number)
	isbn_length(number)
	invalid_characters(number)
	check_digit_isbn_10(number)
	check_digit_isbn_13(number)

	if number.length == 10 && isbn_length(number) == true && check_digit_isbn_10(number) == true
		true
	elsif number.length == 13 && isbn_length(number) == true && check_digit_isbn_13(number) == true
		true
	else
		false
	end
end

def isbn_length(number)
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

def check_digit_isbn_10(number)
	sum = number[0].to_i + number[1].to_i * 2 + number[2].to_i * 3 + number[3].to_i * 4 + number[4].to_i * 5 + number[5].to_i * 6 + number[6].to_i * 7 + number[7].to_i * 8 + number[8].to_i * 9
	checksum = sum % 11
	if checksum == 10 && number[9] == "X" || number[9] == "x"
		true
	elsif number[9].to_i == checksum
		true
	else 
		false
	end
end

def check_digit_isbn_13(number)
	sum = number[0].to_i + 3 * number[1].to_i + number[2].to_i + 3 * number[3].to_i + number[4].to_i + 3 * number[5].to_i + number[6].to_i + 3 * number[7].to_i + number[8].to_i + 3 * number[9].to_i + number[10].to_i + 3 * number[11].to_i
	checksum = sum % 10
	checksum1 = 10 - checksum
	checksum2 = checksum1 % 10
	if number[12].to_i == checksum2
		true
	else
		false
	end
end





