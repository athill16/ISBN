require "minitest/autorun"
require_relative "ISBN.rb"

class TestISBNNumber < Minitest::Test 

	def test_length_is_10_or_13
		isbn_number = isbn_remove_hyphens_and_spaces("9780470059029")
		isbn_number_check = isbn_count(isbn_number)
		assert_equal(true, isbn_number_check)
		isbn_number = isbn_remove_hyphens_and_spaces("978047005902")
		isbn_number_check = isbn_count(isbn_number)
		assert_equal(false, isbn_number_check)	
	end

	def test_remove_hyphens_and_spaces
		assert_equal("9780470059029", isbn_remove_hyphens_and_spaces("978-047-00 5-9029"))
	end

end