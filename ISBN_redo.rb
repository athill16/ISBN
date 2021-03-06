def valid_isbn?(number)
	isbn_without_invalid_characters = remove_invalid_characters(number)

	if isbn_without_invalid_characters.length == 10
		valid_isbn10?(isbn_without_invalid_characters)
	elsif isbn_without_invalid_characters.length == 13 
		valid_isbn13?(isbn_without_invalid_characters)
	else
		false
	end
end

def valid_isbn10?(isbn_without_invalid_characters)
	isbn_without_x = remove_x_from_isbn_if_it_is_last_element(isbn_without_invalid_characters)
	isbn_contain_all_digits = contain_all_digits?(isbn_without_x)
	isbn_without_invalid_characters = add_x_back_into_isbn(isbn_without_invalid_characters)		
	isbn10_sum = sum_of_isbn10_digits(isbn_without_invalid_characters)
	isbn10_check = isbn10_check_digit_equal_sum?(isbn_without_invalid_characters)
	isbn_contain_all_digits == true && isbn10_check == true
end

def valid_isbn13?(isbn_without_invalid_characters)
	isbn_contain_all_digits = contain_all_digits?(isbn_without_invalid_characters)
	isbn13_sum = sum_of_isbn13_digits(isbn_without_invalid_characters)
 	isbn13_check = isbn13_check_digit_equal_sum?(isbn_without_invalid_characters)
	isbn_contain_all_digits == true && isbn13_check == true
end

def remove_invalid_characters(number)
	number.delete!(" ")
	number.delete!("-")
	number
end

def remove_x_from_isbn_if_it_is_last_element(number)
	array = number.split("")
# Removes x from the ISBN if it's in the check digit position, since X is an invalid character unless it is at the end of an ISBN-10.
	if number.length == 10 && array[9] == "X" || array[9] == "x"
		number.slice!(9)
		number
	else
		number
	end
end

def add_x_back_into_isbn(number)
	number = number.split("")
	if number.length == 9
		number.push("X")
	end
	number = number.join
end

def contain_all_digits?(number)
# Checks if all elements in ISBN are numbers and not letters/characters.
	if number =~ /\D/
		false
	else
		true
	end
end

def sum_of_isbn10_digits(number)
	array = number.split("")
	sum = 0
	array.each_with_index do |value, position|
# Multiplies each value by its index plus one. So the first number multiples by 1 instead of 0.
		break if position == 9
		sum += value.to_i * (position + 1)
	end
	sum = sum % 11
end

def isbn10_check_digit_equal_sum?(number)
	array = number.split("")
	sum = sum_of_isbn10_digits(number)
	if sum == 10 && array[9] == "X" || array[9] == "x"
		true
	elsif array[9].to_i == sum
		true
	else
		false
	end
end

def sum_of_isbn13_digits(number)
	array = number.split("")
	sum = 0
	array.each_with_index do |value, position|
# Multiplies 1 by numbers with even indexes and multiplies 3 by numbers with odd indexes.
		break if position == 12
		if position % 2 == 0
			sum += value.to_i
		else 
			sum += value.to_i * 3
		end
	end
	sum
end

def isbn13_check_digit_equal_sum?(number)
	array = number.split("")
	sum = sum_of_isbn13_digits(number)
	sum = sum % 10
	sum = 10 - sum
	sum = sum % 10
	number[12].to_i == sum
end


