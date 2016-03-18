def generate_valid_isbn10()
	array = generate_array_for_isbn10()
	isbn_array = push_check_digit_to_isbn10_array(array)
	isbn10 = display_random_isbn10(isbn_array)
	puts isbn10
end

def generate_array_for_isbn10()
	array_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
	isbn_array = []
	9.times do 
		number = array_of_numbers.sample
		isbn_array << number
	end
	isbn_array
end

def generate_array_for_isbn13()
	array_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
	isbn_array = []
	12.times do
		number = array_of_numbers.sample
		isbn_array << number
	end
	isbn_array
end

def push_check_digit_to_isbn10_array(array)
	sum = 0
	array.each_with_index do |number, position|
		sum += number * (position + 1)
	end
	sum = sum % 11
		if sum == 10
			sum = "X"
		end
	array.push(sum)
	array
end

def display_random_isbn10(array)
	array = array.join
end

generate_valid_isbn10()



