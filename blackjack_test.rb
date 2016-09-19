require 'test/unit'
require './Deal'

class BlackjackTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @deal = Deal.new
  end

  # Tests
  def test_can_create_card
    card = Card.new('Spades', 'Ace', 11)
    assert_equal('Spades', card.suit)
    assert_equal('Ace', card.rank)
    assert_equal(11, card.value)
  end

  def test_deck_contains_52_cards
    assert_equal(52, @deal.get_deck.count)
  end

  def test_deck_is_shuffled
    non_shuffled_sample = create_non_shuffled_sample
    shuffled_sample = create_shuffled_sample
    assert_not_equal(non_shuffled_sample, shuffled_sample)
  end

  def test_deal_a_card
    assert_equal(@deal.get_deck.first.value, @deal.hit.value)
  end

  def test_remove_card_on_hit
    @deal.hit
    assert_equal(51, @deal.get_deck.count)
  end

  def test_get_two_cards_on_deal
    assert_equal(2, @deal.deal_hand.count)
  end

  def test_two_cards_removed_after_deal
    @deal.deal_hand
    assert_equal(50, @deal.get_deck.count)
  end

  def test_blackjack
    card1 = Card.new('Spades', 'Ace', 11)
    card2 = Card.new('Spades', 10, 10)
    assert_equal(21, (card1.value + card2.value))
  end



  def create_shuffled_sample
    shuffled_sample = Array.new
    deck = Pack.new.deck
    deck[0..12].each { |card| shuffled_sample << card.rank }
    shuffled_sample
  end

  def create_non_shuffled_sample
    non_shuffled_sample = Array.new
    (2..10).each { |num| non_shuffled_sample << num }
    %w(Jack Queen King Ace).each { |card| non_shuffled_sample << card }
    non_shuffled_sample
  end

end