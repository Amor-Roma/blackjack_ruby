require './Card'

# Create a freshly shuffled deck
class Pack
  attr_reader :deck

  def initialize
    create_deck
    shuffle_deck
  end

  def create_deck
    @deck = Array.new()
    %w(Hearts Diamonds Clubs Spades).each do |suit|
      create_non_face_cards(suit)
      create_face_cards(suit)
      create_ace(suit)
    end
  end

  def create_ace(suit)
    deck << Card.new(suit, 'Ace', 11)
  end

  def create_face_cards(suit)
    %w(Jack Queen King).each do |card|
      deck << Card.new(suit, card, 10)
    end
  end

  def create_non_face_cards(suit)
    (2..10).each do |num|
      deck << Card.new(suit, num, num)
    end
  end

  def shuffle_deck
    @deck = deck.shuffle()
  end

end