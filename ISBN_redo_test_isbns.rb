require_relative "ISBN_redo.rb"
require 'csv'

isbn_numbers = CSV.read('isbn_numbers.rb')

def test_validity_of_isbns()
	CSV.foreach('isbn_numbers.rb') do |item, number|
		validity = valid_isbn?(number)
		if validity == true
			puts "#{number}, valid"
		else 
			puts "#{number}, invalid"
		end
	end
end






