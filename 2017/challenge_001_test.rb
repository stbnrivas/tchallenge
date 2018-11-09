require_relative "challenge_001"
require 'minitest/autorun'



class Challenge_001_test < Minitest::Test
    def setup
    end

    def test_3_guess_8_8_8_slices
        o = PizzaOptimizer.new()
        assert_equal(o.minimum_pizzas([8,8,8]),3)
    end

    def test_2_guess_5_3_slices
        o = PizzaOptimizer.new()
        assert_equal(o.minimum_pizzas([5,3]),1)
    end

    def test_4_guess_3_4_5_6_slices
        o = PizzaOptimizer.new()
        assert_equal(o.minimum_pizzas([3,4,5,6]),3)
    end
        
end