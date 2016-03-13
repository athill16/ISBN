require "minitest/autorun"
require_relative "ISBN_automatic_generator.rb"

class TestISBNGenerator < Minitest::Test

	def test_array_generates_9_numbers_for_isbn_10
		array = generate_array_for_isbn10()
		assert_equal(9, array.count)
	end

end



