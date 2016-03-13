require_relative "ISBN_redo.rb"
require 'csv'

f = File.open('isbn_validity_output.rb', 'w')

def test_validity_of_isbns(f)
	CSV.foreach('isbn_numbers.rb') do |item, number|
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







