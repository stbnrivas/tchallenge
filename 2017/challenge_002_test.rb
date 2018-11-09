require_relative "challenge_002"
require "minitest/autorun"

class Challenge_002_test < Minitest::Test

    def setup

    end

    def test_game_1
        score1 = Scorer.new(20,[5, 4, 1, 3, 0, 7, 4, 5, 3, 0, 2, 5, 2, 4, 5, 0, 7, 1, 4, 4])
        assert_equal(score1.score, [9, 13, 20, 29, 32, 39, 45, 50, 58, 66])
    end

    def test_game_2
        score1 = Scorer.new(19,[9, 0, 4, 0, 8, 0, 4, 5, 7, 0, 10, 4, 1, 7, 1, 6, 3, 5, 4])
        assert_equal(score1.score,[9, 13, 21, 30, 37, 52, 57, 65, 74, 83])
    end

    def test_game_3
        score1 = Scorer.new(17,[10, 7, 2, 9, 1, 10, 10, 7, 1, 8, 0, 7, 0, 10, 10, 4, 2])
        assert_equal(score1.score, [19, 28, 48, 75, 93, 101, 109, 116, 140, 156])
    end

    def test_game_4
        score1 = Scorer.new(12,[10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
        assert_equal(score1.score, [30, 60, 90, 120, 150, 180, 210, 240, 270, 300])
    end

end