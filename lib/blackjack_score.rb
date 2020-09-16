# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  new_hand = hand.map do |card|
      case card
      when "Jack", "Queen", "King"
        10
      when "Ace"
        11
      else
        card
      end
  end

  score = new_hand.reduce(:+)

  if score > 21 && new_hand.include?(11)
    score -= 10
  end

  return score
end
