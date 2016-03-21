require_relative "ISBN_redo.rb"
require 'csv'

f = File.open('isbn_confirm_validity_of_generated_ISBNs.csv', 'w')
# Creates a file.
f << "Item,  ISBN,     Validity\n"
# Adds a header.

CSV.foreach('list_of_five_random_ISBNs.csv') do |number|
	number = number[0]
	validity = valid_isbn?(number)
	if validity == true
		f << "#{number}, valid\n"
	else 
		f << "#{number}, invalid\n"
	end
end

f.close