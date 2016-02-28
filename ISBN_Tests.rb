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

	def test_isbn_is_valid_or_invalid
		assert_equal(true, isbn_valid?("978-047-00 5-9029"))
		assert_equal(false, isbn_valid?("978  047-0-0"))
	end

	def test_for_invalid_characters
		isbn_number = invalid_characters("123456789025t")
		assert_equal(false, isbn_number)
	end

	def test_last_element_is_x
		isbn_number = isbn_remove_hyphens_and_spaces("978-047-00 5-X")
		isbn_number_2 = isbn_last_element_is_x(isbn_number)
		assert_equal("10", isbn_number_2[9])
	end

end