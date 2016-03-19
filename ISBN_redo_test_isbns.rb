require_relative "ISBN_redo.rb"
require 'csv'

f = File.open('isbn_validity_output.csv', 'w')
f << "Item,  ISBN,     Validity\n"

def test_validity_of_isbns(f)
	CSV.foreach('isbn_numbers.csv') do |item, number|
		validity = valid_isbn?(number)
		if validity == true
			f << "#{item}, #{number}, valid\n"
		else 
			f << "#{item}, #{number}, invalid\n"
		end
	end
end

test_validity_of_isbns(f)

f.close







