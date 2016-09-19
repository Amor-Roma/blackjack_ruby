require './Pack'

# Creates starting hands and hit ability
class Deal

  def initialize
    @deck = Pack.new.deck
  end

  def get_deck
    @deck
  end

  def hit
    card = @deck.first
    remove_card_from_deck
    card
  end

  def remove_card_from_deck
    @deck.pop
  end

  def deal_hand
    hand = Array.new
    2.times { hand << hit }
    hand
  end


end