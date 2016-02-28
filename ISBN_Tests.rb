require "minitest/autorun"
require_relative "ISBN.rb"

class TestISBNNumber < Minitest::Test 

	def test_number_of_elements_is_10_or_13
		assert_equal(true, verify_length("9780470059029"))
	end

end