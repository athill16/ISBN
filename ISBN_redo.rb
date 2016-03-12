def valid_isbn?(number)

	remove_invalid_characters(number)
	invalid_characters(number)
	isbn10_check_digit(number)
	isbn13_check_digit(number)

	if number.length == 10 && invalid_characters(number) == true  && isbn10_check_digit(number) == true
		true
	elsif number.length == 13 && invalid_characters(number) == true && isbn13_check_digit(number) == true
		true
	else
		false
	end

end

def remove_invalid_characters(number)
	number.delete!(" ")
	number.delete!("-")
	number
end

def invalid_characters(number)
	remove_invalid_characters(number)
	number = number.split("")
# Removes x from the ISBN if it's in the check digit position, since X is an invalid character unless it is at the end of an ISBN-10.
	if number.length == 10 && number[9] == "X" || number[9] == "x"
		number.slice!(9)
	end
# Checks if all elements in ISBN are numbers and not letters/characters.
	if number =~ /\D/
		false
	else
		true
	end
end

def isbn10_check_digit(number)
	remove_invalid_characters(number)
	number = number.split("")
	sum = 0
	number.each_with_index do |value, position|
# Multiplies each value by its index plus one. So the first number multiples by 1 instead of 0.

		break if position == 9
		sum += value.to_i * (position + 1)
	end
	sum = sum % 11
	if sum == 10 && number[9] == "X" || number[9] == "x"
		true
	elsif number[9].to_i == sum
		true
	else
		false
	end
end

def isbn13_check_digit(number)
	remove_invalid_characters(number)
	number = number.split("")
	sum = 0
	number.each_with_index do |value, position|
# Multiples 1 by numbers with even indexes and multiplies 3 by numbers with odd indexes.
		break if position == 12
		if position % 2 == 0
			sum += value.to_i
		else 
			sum+= value.to_i * 3
		end
	end
	sum = sum % 10
	sum = 10 - sum
	sum = sum % 10
	number[12].to_i == sum
end



