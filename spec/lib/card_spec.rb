require "spec_helper"

RSpec.describe Card do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'
  let (:card1) { Card.new("2","♠") }

  describe "#new" do
    it "creates a new object of class Card" do
      expect(Card.new("10","♦")).to be_a(Card)
    end
  end

  describe "#value" do
    it "for the card 2♠" do
      expect(card1.value).to eq("2")
    end
  end

  describe "suit" do
    it "for the card suit of 2♠" do
      expect(card1.suit).to eq("♠")
    end
  end

end
