# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  score = hand.reduce(0) do |sum, card|
   if card.class == Integer
     sum + card
   else
      case card
      when "Jack", "Queen", "King"
        sum + 10
      end
    end
  end

  return score
end
