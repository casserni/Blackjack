class Card

  attr_reader :value, :suit
  def initialize (value, suit)
    @value = value
    @suit = suit
  end

  def card_face
    "#{value}#{suit}"
  end
end
