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
	if number.length == 10 && number[9] == "X" || number[9] == "x"
		number.slice!(9)
	end
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



