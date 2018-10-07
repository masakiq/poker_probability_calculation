require 'test/unit'
require 'pry'
require './card.rb'
require './hands.rb'

class HandsTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def no_pair
    [
      Card.new(1,  's'),
      Card.new(5,  'h'),
      Card.new(12, 's'),
      Card.new(13, 'c'),
      Card.new(8,  'd')
    ]
  end

  def one_pair
    [
      Card.new(5,  'h'),
      Card.new(8,  's'),
      Card.new(5,  's'),
      Card.new(11, 'c'),
      Card.new(1,  'd')
    ]
  end

  def two_pair
    [
      Card.new(7, 'h'),
      Card.new(1, 's'),
      Card.new(5, 's'),
      Card.new(7, 'c'),
      Card.new(1, 'd')
    ]
  end

  def three_of_a_kind
    [
      Card.new(6, 'h'),
      Card.new(8, 's'),
      Card.new(6, 's'),
      Card.new(6, 'c'),
      Card.new(1, 'd')
    ]
  end

  def straight
    [
      Card.new(4, 'h'),
      Card.new(7, 'h'),
      Card.new(6, 's'),
      Card.new(3, 'c'),
      Card.new(5, 'd')
    ]
  end

  def flush
    [
      Card.new(4,  'd'),
      Card.new(7,  'd'),
      Card.new(6,  'd'),
      Card.new(13, 'd'),
      Card.new(12, 'd')
    ]
  end

  def full_house
    [
      Card.new(3, 'h'),
      Card.new(5, 'h'),
      Card.new(3, 's'),
      Card.new(5, 'c'),
      Card.new(3, 'd')
    ]
  end

  def four_of_a_kind
    [
      Card.new(10, 'h'),
      Card.new(1,  's'),
      Card.new(10, 's'),
      Card.new(10, 'c'),
      Card.new(10, 'd')
    ]
  end

  def straight_flush
    [
      Card.new(9,  'c'),
      Card.new(7,  'c'),
      Card.new(11, 'c'),
      Card.new(10, 'c'),
      Card.new(8,  'c')
    ]
  end

  def six_cards
    [
      Card.new(1,  's'),
      Card.new(5,  'h'),
      Card.new(12, 's'),
      Card.new(13, 'c'),
      Card.new(8,  'd'),
      Card.new(7,  's')
    ]
  end

  def test_one_pair?
    assert_equal(one_pair?(no_pair),         false)
    assert_equal(one_pair?(one_pair),        true)
    assert_equal(one_pair?(two_pair),        true)
    assert_equal(one_pair?(three_of_a_kind), true)
    assert_equal(one_pair?(straight),        false)
    assert_equal(one_pair?(flush),           false)
    assert_equal(one_pair?(full_house),      true)
    assert_equal(one_pair?(four_of_a_kind),  true)
    assert_equal(one_pair?(straight_flush),  false)
    assert_raises(OverFiveCardError) { one_pair?(six_cards) }
  end

  def test_two_pair?
    assert_equal(two_pair?(no_pair),         false)
    assert_equal(two_pair?(one_pair),        false)
    assert_equal(two_pair?(two_pair),        true)
    assert_equal(two_pair?(three_of_a_kind), false)
    assert_equal(two_pair?(straight),        false)
    assert_equal(two_pair?(flush),           false)
    assert_equal(two_pair?(full_house),      true)
    assert_equal(two_pair?(four_of_a_kind),  true)
    assert_equal(two_pair?(straight_flush),  false)
    assert_raises(OverFiveCardError) { two_pair?(six_cards) }
  end

  def test_three_of_a_kind?
    assert_equal(three_of_a_kind?(no_pair),         false)
    assert_equal(three_of_a_kind?(one_pair),        false)
    assert_equal(three_of_a_kind?(two_pair),        false)
    assert_equal(three_of_a_kind?(three_of_a_kind), true)
    assert_equal(three_of_a_kind?(straight),        false)
    assert_equal(three_of_a_kind?(flush),           false)
    assert_equal(three_of_a_kind?(full_house),      true)
    assert_equal(three_of_a_kind?(four_of_a_kind),  true)
    assert_equal(three_of_a_kind?(straight_flush),  false)
    assert_raises(OverFiveCardError) { three_of_a_kind?(six_cards) }
  end

  def test_straight?
    assert_equal(straight?(no_pair),         false)
    assert_equal(straight?(one_pair),        false)
    assert_equal(straight?(two_pair),        false)
    assert_equal(straight?(three_of_a_kind), false)
    assert_equal(straight?(straight),        true)
    assert_equal(straight?(flush),           false)
    assert_equal(straight?(full_house),      false)
    assert_equal(straight?(four_of_a_kind),  false)
    assert_equal(straight?(straight_flush),  true)
    assert_raises(OverFiveCardError) { straight?(six_cards) }
  end

  def test_flush?
    assert_equal(flush?(no_pair),         false)
    assert_equal(flush?(one_pair),        false)
    assert_equal(flush?(two_pair),        false)
    assert_equal(flush?(three_of_a_kind), false)
    assert_equal(flush?(straight),        false)
    assert_equal(flush?(flush),           true)
    assert_equal(flush?(full_house),      false)
    assert_equal(flush?(four_of_a_kind),  false)
    assert_equal(flush?(straight_flush),  true)
    assert_raises(OverFiveCardError) { flush?(six_cards) }
  end

  def test_full_house?
    assert_equal(full_house?(no_pair),         false)
    assert_equal(full_house?(one_pair),        false)
    assert_equal(full_house?(two_pair),        false)
    assert_equal(full_house?(three_of_a_kind), false)
    assert_equal(full_house?(straight),        false)
    assert_equal(full_house?(flush),           false)
    assert_equal(full_house?(full_house),      true)
    assert_equal(full_house?(four_of_a_kind),  false)
    assert_equal(full_house?(straight_flush),  false)
    assert_raises(OverFiveCardError) { full_house?(six_cards) }
  end

  def test_four_of_a_kind?
    assert_equal(four_of_a_kind?(no_pair),         false)
    assert_equal(four_of_a_kind?(one_pair),        false)
    assert_equal(four_of_a_kind?(two_pair),        false)
    assert_equal(four_of_a_kind?(three_of_a_kind), false)
    assert_equal(four_of_a_kind?(straight),        false)
    assert_equal(four_of_a_kind?(flush),           false)
    assert_equal(four_of_a_kind?(full_house),      false)
    assert_equal(four_of_a_kind?(four_of_a_kind),  true)
    assert_equal(four_of_a_kind?(straight_flush),  false)
    assert_raises(OverFiveCardError) { four_of_a_kind?(six_cards) }
  end

  def test_straight_flush?
    assert_equal(straight_flush?(no_pair),         false)
    assert_equal(straight_flush?(one_pair),        false)
    assert_equal(straight_flush?(two_pair),        false)
    assert_equal(straight_flush?(three_of_a_kind), false)
    assert_equal(straight_flush?(straight),        false)
    assert_equal(straight_flush?(flush),           false)
    assert_equal(straight_flush?(full_house),      false)
    assert_equal(straight_flush?(four_of_a_kind),  false)
    assert_equal(straight_flush?(straight_flush),  true)
    assert_raises(OverFiveCardError) { straight_flush?(six_cards) }
  end

  def test_pair_with_hands?
    cards = [
      Card.new(1,  's'),
      Card.new(5,  'h'),
      Card.new(12, 's'),
      Card.new(13, 'c'),
      Card.new(8,  'd')
    ]
    hands = [
      Card.new(3,  's'),
      Card.new(8,  'h'),
    ]
    assert_equal(pair_with_hands?(cards, hands), true)

    hands = [
      Card.new(3,  's'),
      Card.new(2,  'h'),
    ]
    assert_equal(pair_with_hands?(cards, hands), false)

    assert_raises(OverFiveCardError) { pair_with_hands?(six_cards, hands) }
  end
end
