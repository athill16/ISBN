require "minitest/autorun"
require_relative "ISBN_automatic_generator.rb"

class TestISBNGenerator < Minitest::Test

	def test_array_generates_9_numbers_for_isbn_10
		array = generate_array_for_isbn10()
		assert_equal(9, array.count)
	end

	def test_isbn10_array_contains_check_digit_at_end
		assert_equal([1, 2, 3, 3], push_check_digit_to_isbn10_array([1, 2, 3]))
	end

	def test_random_isbn10_is_displayed
		assert_equal("1234", display_random_isbn10([1, 2, 3, 4]))
	end

	def test_array_generates_12_numbers_for_isbn_13
		array = generate_array_for_isbn13()
		assert_equal(12, array.count)
	end

	def test_isbn13_array_contains_check_digit_at_end
		assert_equal([9, 7, 8, 0, 4, 7, 1, 4, 8, 6, 4, 8, 0], push_check_digit_to_isbn13_array([9, 7, 8, 0, 4, 7, 1, 4, 8, 6, 4, 8]))
	end

end



