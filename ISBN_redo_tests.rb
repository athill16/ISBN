require "minitest/autorun"
require_relative "ISBN_redo.rb"

class TestISBN < Minitest::Test

	def test_ISBN_has_10_or_13_numbers
		assert_equal(true, contains_10_or_13_characters?("1232455369"))
		assert_equal(true, contains_10_or_13_characters?("4692874753241"))
	end

	def test_ISBN_with_spaces_and_hyphens_returns_valid_format
		assert_equal("1232455369", remove_invalid_characters("1 2324 55369"))
		assert_equal("4692874753241", remove_invalid_characters("469287475 324 1"))
	end

	def test_invalid_character_returns_false
		assert_equal(false, contain_all_digits?("12324X5369"))
	end

	def test_sum_of_ISBN10_is_correct
		assert_equal(3, sum_of_isbn10_digits("123"))
	end

	def test_sum_of_ISBN13_is_correct
		assert_equal(8, sum_of_isbn13_digits("121"))
	end

	def test_isbn10_is_valid
		assert_equal(true, valid_isbn?("877 1958-69x"))
	end

	def test_isbn13_is_valid
		assert_equal(true, valid_isbn?("97804-714864 80"))
	end

	def test_isbn10_with_invalid_characters_is_invalid
		assert_equal(false, valid_isbn?("047s958697"))
	end

	def test_isbn13_with_invalid_characters_is_invalid
		assert_equal(false, valid_isbn?("97'0471486480"))
	end

end




