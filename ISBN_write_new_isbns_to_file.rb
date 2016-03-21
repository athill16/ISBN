def ask_if_isbn10_or_isbn13_is_wanted
	puts "Would you like to generate an ISBN10 or an ISBN13? Type 10 or 13."
	answer = gets.chomp
	if answer == "10"
		generate_valid_isbn10()
	elsif answer == "13"
		generate_valid_isbn13()
	else
		puts "That is not a valid input."
	end
end

def generate_valid_isbn10()
	array10 = generate_array_for_isbn10()
	isbn10_array = push_check_digit_to_isbn10_array(array10)
	isbn10 = display_random_isbn(isbn10_array)
end

def generate_valid_isbn13()
	array13 = generate_array_for_isbn13()
	isbn13_array = push_check_digit_to_isbn13_array(array13)
	isbn13 = display_random_isbn(isbn13_array)
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

def push_check_digit_to_isbn13_array(array)
	sum = 0
	array.each_with_index do |number, position|
		if position % 2 == 0
			sum += number
		else 
			sum += number * 3
		end
	end
	sum = sum % 10
	sum = 10 - sum
	sum = sum % 10
	array.push(sum)
	array
end

def display_random_isbn(array)
	array = array.join
end

f = File.open('list_of_five_random_ISBNs.csv', 'w')

5.times do
	isbn = ask_if_isbn10_or_isbn13_is_wanted
	f << "#{isbn}\n"
end

f.close





