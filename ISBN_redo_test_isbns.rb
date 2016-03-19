require_relative "ISBN_redo.rb"
require 'csv'

f = File.open('isbn_validity_output.csv', 'w')
f << "ISBN,       Validity\n"

def test_validity_of_isbns(f)
	CSV.foreach('isbn_numbers.csv') do |item, number|
		validity = valid_isbn?(number)
		if validity == true
			f << "#{number}, valid\n"
		else 
			f << "#{number}, invalid\n"
		end
	end
end

test_validity_of_isbns(f)

f.close







