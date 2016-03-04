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
	# Checks if all elements in ISBN are numbers and not letters/characters.
	if number =~ /\D/
		false
	else
		true
	end
end

def check_digit_isbn_10(number)
	array = []
	number = number.split("")
	number.each do |value|
		array << value.to_i
	end

	sum = 0

	array.each_with_index do |value, index|
		# Multiplies each value by its index plus one. So the first number multiples by 1 instead of 0.
		break if index == 9
		sum += value * (index + 1)
	end

	check_digit = sum % 11

	if check_digit == 10 && number[9] == "X" || number[9] == "x"
		true
	elsif number[9].to_i == check_digit
		true
	else 
		false
	end
end

def check_digit_isbn_13(number)
	array = []
	number = number.split("")
	number.each do |value|
		array << value.to_i
	end

	sum = 0

	array.each_with_index do |value, index|
		# Multiples 1 by numbers with even indexes and multiplies 3 by numbers with odd indexes.
		break if index == 12
		if index % 2 == 0
			sum += value
		else 
			sum += value * 3
		end
	end
	sum = sum % 10
	sum = 10 - sum
	check_digit = sum % 10

	if number[12].to_i == check_digit
		true
	else
		false
	end
end




