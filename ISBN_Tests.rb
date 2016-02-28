require "minitest/autorun"
require_relative "ISBN.rb"

class TestISBNNumber < Minitest::Test 

	def test_length_is_10_or_13
		isbn_number = isbn_remove_hyphens_and_spaces("9780470059029")
		assert_equal(13, isbn_number.length)
		isbn_number = isbn_remove_hyphens_and_spaces("9780470059")
		assert_equal(10, isbn_number.length)	
	end

	def test_remove_hyphens_and_spaces
		assert_equal("9780470059029", isbn_remove_hyphens_and_spaces("978-047-00 5-9029"))
	end

	def test_isbn_is_valid
		isbn_number = isbn_valid?("978-047-00 5-9029")
		assert_equal(true, isbn_number)
	end

end