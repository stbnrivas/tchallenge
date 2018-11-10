require_relative "challenge_003"
require "minitest/autorun"

class Challenge_003_test < Minitest::Test

    def setup
    end

    def test_max_points_1
        deck = DeckOptimizer.new(1)
        assert_equal(deck.minimum_card(),1)
    end

    def test_max_points_6
        deck = DeckOptimizer.new(6)
        assert_equal(deck.minimum_card(),3)
    end

    def test_max_points_3
        deck = DeckOptimizer.new(3)
        assert_equal(deck.minimum_card(),2)
    end

end