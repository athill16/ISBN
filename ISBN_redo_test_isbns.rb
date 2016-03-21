require_relative "ISBN_redo.rb"
require 'csv'

f = File.open('isbn_validity_output.csv', 'w')
# Creates a file.
f << "Item,  ISBN,     Validity\n"
# Adds a header.

CSV.foreach('isbn_numbers.csv') do |item, number|
	validity = valid_isbn?(number)
	if validity == true
		f << "#{item}, #{number}, valid\n"
	else 
		f << "#{item}, #{number}, invalid\n"
	end
end

f.close







