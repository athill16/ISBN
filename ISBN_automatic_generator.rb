def generate_array_for_isbn10()
	array_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
	isbn_array = []
	9.times do 
		number = array_of_numbers.sample
		isbn_array << number
	end
	isbn_array
end
generate_array_for_isbn10()