# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  new_hand = hand.map do |card|
    if !VALID_CARDS.include?(card)
      raise ArgumentError.new("Invalid card has been played")
    else
      case card
      when "Jack", "Queen", "King"
        10
      when "Ace"
        11
      else
        card
      end
    end
  end

  #new_hand must be destructively sorted to later remove each Ace if score >21
  score = new_hand.sort!.reduce(:+)

  while score > 21 && new_hand.include?(11)
    new_hand.pop
    score -= 10
  end

  if score > 21
    raise ArgumentError.new("Score is over 21. BUST.")
  end

  return score
end
