require "minitest/autorun"
require_relative "ISBN.rb"

class TestISBNNumber < Minitest::Test 

	def test_length_is_10_or_13
		isbn_number = isbn_check("9780470059029")
		assert_equal(true, isbn_number.length == 13 || isbn_number.length == 10)
		isbn_number = isbn_check("978047005902")
		assert_equal(false, isbn_number.length == 13 || isbn_number.length == 10)	
	end

	def test_remove_hyphens_and_spaces
		assert_equal("9780470059029", isbn_check("978-047-00 5-9029"))
	end

end