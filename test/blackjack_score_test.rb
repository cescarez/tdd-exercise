require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do
    # Arrange
    hand = [3, 4]
    # Act
    score = blackjack_score(hand)
    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do
    # Arrange
    hand1 = ["Jack", 4]
    hand2 = ["Jack", "Queen"]
    hand3 = [2, "King"]
    # Act
    hand1_score = blackjack_score(hand1)
    hand2_score = blackjack_score(hand2)
    hand3_score = blackjack_score(hand3)
    # Assert
    expect(hand1_score).must_equal 14
    expect(hand2_score).must_equal 20
    expect(hand3_score).must_equal 12
  end

  it 'calculates aces as 11 where it does not go over 21' do
   # Arrange
    hand = ["Jack", "Ace"]
    # Act
    hand_score = blackjack_score(hand)
    # Assert
    expect(hand_score).must_equal 21
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
   # Arrange
    hand = [5, 10, "Ace"]
    # Act
    hand_score = blackjack_score(hand)
    # Assert
    expect(hand_score).must_equal 16
  end

  it 'raises an ArgumentError for invalid cards' do
    # Arrange && Act && Assert
    expect {
      blackjack_score([10, 2, "Kangaroo", 5])
    }.must_raise ArgumentError

    expect {
      blackjack_score(["Ace", "Jack", nil, 3])
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    # Arrange && Act && Assert

  end
end
