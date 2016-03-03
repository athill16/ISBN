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

def check_digit_isbn_10(number)
	array = []
	x = 1
	9.times do
		num = x * number[x-1].to_i
		x = x + 1
		array.push(num)
	end
	sum_1 = array.inject(0){|sum,x| sum + x }
	checksum = sum_1 % 11
	if checksum == 10 && number[9] == "X" || number[9] == "x"
		true
	elsif number[9].to_i == checksum
		true
	else 
		false
	end
end

def check_digit_isbn_13(number)
	array = [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3]
	x = 0
	array_1 = []
	12.times do
		sum = number[x].to_i * array[x]
		x = x + 1
		array_1.push(sum)
	end
	sum_1 = array_1.inject(0){|sum,x| sum + x }
	checksum = sum_1 % 10
	checksum1 = 10 - checksum
	checksum2 = checksum1 % 10
	if number[12].to_i == checksum2
		true
	else
		false
	end
end




