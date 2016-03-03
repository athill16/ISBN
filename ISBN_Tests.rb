require "minitest/autorun"
require_relative "ISBN.rb"

class TestISBNNumber < Minitest::Test 

	def test_length_is_10_or_13
		assert_equal(true, isbn_length("1234567890357"))
		assert_equal(true, isbn_length("1234567890"))
		assert_equal(false, isbn_length("4"))
	end

	def test_remove_hyphens_and_spaces
		assert_equal("9780470059029", isbn_remove_hyphens_and_spaces("978-047-00 5-9029"))
	end

	def test_for_invalid_characters
		isbn_number = invalid_characters("123456789025t")
		assert_equal(false, isbn_number)
	end

	def test_last_element_is_x
		isbn_number = isbn_remove_hyphens_and_spaces("978-047-00 5-X")
		assert_equal("X", isbn_number[9])
	end

	def test_isbn_10_check_digit_is_1
		assert_equal(true, check_digit_isbn_10("1111111111"))
	end

	def test_isbn_13_check_digit_is_9
		assert_equal(true, check_digit_isbn_13("1111111111116"))
	end

	def test_isbn_is_valid
		assert_equal(true, isbn_valid?("1111111111"))
	end

	def test_isbn_is_valid2
		assert_equal(true, isbn_valid?("9780470059029"))
	end

end



