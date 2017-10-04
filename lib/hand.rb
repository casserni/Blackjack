require_relative 'deck'
require_relative 'card'

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def values
    @cards.map { |card| card.value}
  end

  def add_card (card)
    @cards << card
  end

  def view
    @cards.map { |card| card.card_face }
  end

  def aces
    score = 0
    values.map {|card| score += 11 if card == "A"}
    score
  end

  def face_cards
    values.inject(0) do |sum, card|
      if card == "J" || card == "Q" || card == "K"
        sum.to_i + 10
      else
        sum.to_i
      end
    end
  end

  def num_cards
    values.inject do |sum, card|
      sum.to_i + card.to_i
    end
  end

   def calculate_hand
     total = face_cards + num_cards + aces
     number_of_aces = values.count("A")
      while total > 21 && values.count("A") > 0
        total -= 10
        number_of_aces -= 1
      end
     total
   end

 end

#
# deck = Deck.new
# cards = deck.deal(3)
# hand = Hand.new([Card.new("A","♦"), Card.new("A","♥"), Card.new("A","♠"), Card.new("K","♠")])
# puts hand.calculate_hand
