# Creates a card object to hold suit and value
class Card
  attr_reader :suit, :rank, :value
    def initialize(suit, rank, value)
      @suit = suit
      @rank = rank
      @value = value
    end
end