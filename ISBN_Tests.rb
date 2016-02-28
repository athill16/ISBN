require "minitest/autorun"
require_relative "ISBN.rb"

class TestISBNNumber < Minitest::Test 

	def test_length_is_10_or_13
		assert_equal(true, verify_length("9780470059029"))
		assert_equal(false, verify_length("12378"))
		assert_equal(true, verify_length("9780470059"))
	end

	def test_remove_hyphens_and_spaces
		assert_equal("9780470059029", delete_hyphens_and_spaces("978-047-00 5-9029"))
	end

end