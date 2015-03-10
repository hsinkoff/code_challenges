require 'minitest/autorun'

module Luhn
	def self.is_valid?(number)
		n = number.to_s.split(//)
		total = 0
		while not n.empty?
			single = n.pop.to_i
			if not n.empty?
				double = n.pop.to_i*2
			else
				double = 0
			end
			if double >= 10
				double = double - 9
			end
			total = total + single + double
			#puts total (used to check algorithm step by step)
		end
		total%10 == 0
		#if this is true it automatically returns true else will return false
	end
end

class TestLuhn < MiniTest::Unit::TestCase

	def test_luhn_valid
		assert Luhn.is_valid?(5050000000000)
	end

	def test_luhn_valid
		assert Luhn.is_valid?(4194560385008504)
	end

	def test_luhn_invalid
		assert ! Luhn.is_valid?(4194560385008505)
	end

end

