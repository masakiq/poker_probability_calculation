class OverFiveCardError < StandardError; end

# 2ペア、3カード、フルハウス、4カード含む
def one_pair?(cards)
  raise OverFiveCardError if cards.size >= 6
  cards.combination(2) do |a, b|
    return true if a.number == b.number
  end
  false
end

# フルハウス、4カード含む
def two_pair?(cards)
  raise OverFiveCardError if cards.size >= 6
  cards.combination(2) do |a, b|
    if a.number == b.number
      rest = cards.reject {|card| card.same?(a) || card.same?(b) }
      return true if one_pair?(rest)
    end
  end
  false
end

# フルハウス含む
def three_of_a_kind?(cards)
  raise OverFiveCardError if cards.size >= 6
  cards.combination(3) do |a, b, c|
    return true if a.number == b.number && b.number == c.number
  end
  false
end

# ストレートフラッシュ含む
def straight?(cards)
  raise OverFiveCardError if cards.size >= 6
  sorted = cards.sort {|a, b| a.number <=> b.number }
  base = sorted[0].number
  sorted.each_with_index do |card, index|
    return false if card.number != (base + index)
  end
  true
end

# ストレートフラッシュ含む
def flush?(cards)
  raise OverFiveCardError if cards.size >= 6
  cards[0].suit == cards[1].suit && cards[0].suit == cards[2].suit && cards[0].suit == cards[3].suit && cards[0].suit == cards[4].suit
end

def full_house?(cards)
  raise OverFiveCardError if cards.size >= 6
  cards.combination(3) do |a, b, c|
    if a.number == b.number && b.number == c.number
      rest = cards.reject {|card| card.same?(a) || card.same?(b) || card.same?(c) }
      return true if rest[0].number == rest[1].number
    end
  end
  false
end

def four_of_a_kind?(cards)
  raise OverFiveCardError if cards.size >= 6
  cards.combination(4) do |a, b, c, d|
    return true if a.number == b.number && b.number == c.number && c.number == d.number
  end
  false
end

def straight_flush?(cards)
  raise OverFiveCardError if cards.size >= 6
  straight?(cards) && flush?(cards)
end