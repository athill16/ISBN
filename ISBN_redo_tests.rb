require "minitest/autorun"
require_relative "ISBN_redo.rb"

class TestISBN < Minitest::Test

	def test_ISBN_has_10_or_13_numbers
		assert_equal(true, valid_isbn?("1232455369"))
		assert_equal(true, valid_isbn?("4692874753241"))
	end

	def test_ISBN_with_spaces_and_hyphens_returns_true
		assert_equal(true, valid_isbn?("1 2324 55369"))
		assert_equal(true, valid_isbn?("469287475 324 1"))
	end

	def test_invalid_character_returns_false
		assert_equal(false, valid_isbn?("12324X5369"))
	end

	def test_isbn10_that_ends_with_X_is_valid
		assert_equal(true, valid_isbn?("877195869X"))
	end

	def test_ISBN10_check_digit
		assert_equal(true, isbn10_check_digit("1 2324 55369"))
	end

	def test_ISBN13_check_digit
		assert_equal(true, isbn13_check_digit("469287475 324 1"))
	end

	def test_ISBN10_with_X_in_middle_and_end_is_invalid
		assert_equal(false, valid_isbn?("8771X5869X"))
	end

end