require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new([Card.new("10","♦"), Card.new("J","♥")]) }
  let(:hand1) { Hand.new([Card.new("Q","♦"), Card.new("J","♥")]) }
  let(:hand2) { Hand.new([Card.new("3", "♦"),Card.new("4","♥")]) }
  let(:hand3) { Hand.new([Card.new("A","♦"), Card.new("A","♥")]) }
  let(:hand4) { Hand.new([Card.new("J","♦"), Card.new("A","♥")]) }
  let(:hand5) { Hand.new([Card.new("A","♦"), Card.new("3","♥")]) }
  let(:hand6) { Hand.new([Card.new("A","♦"), Card.new("A","♥"), Card.new("A","♠")]) }
  let(:hand7) { Hand.new([Card.new("A","♦"), Card.new("J","♥"), Card.new("A","♠")]) }
  let(:hand8) { Hand.new([Card.new("10","♦"), Card.new("10","♥"), Card.new("A","♠")]) }

  describe "#new" do
    it "creates a new object of class Hand" do
      expect(Hand.new([Card.new("10","♦"), Card.new("J","♥")])).to be_a(Hand)
    end
  end

  describe "#calculate_hand" do
    it "has one number (10) and one face card(J)" do
      expect(hand.calculate_hand).to eq(20)
    end

    it "has two face cards (Q)(J)" do
      expect(hand1.calculate_hand).to eq(20)
    end

    it "has two number cards (3)(4)" do
      expect(hand2.calculate_hand).to eq(7)
    end

    it "has two aces" do
      expect(hand3.calculate_hand).to eq(12)
    end

    it "has one face card (J) and one ace" do
      expect(hand4.calculate_hand).to eq(21)
    end

    it "has first card Ace (A) and second card number (3)" do
      expect(hand5.calculate_hand).to eq(14)
    end

    it "has three aces" do
      expect(hand6.calculate_hand).to eq(13)
    end

    it "has two aces and a face card (J)" do
      expect(hand7.calculate_hand).to eq(12)
    end

    it "has one ace and two number cards (10's)" do
      expect(hand8.calculate_hand).to eq(21)
    end
  end

  describe "#add_card" do
    it " adds a new object Card, to the array" do
      card1 = Card.new("A","♠")
      card2 = Card.new("K","♠")
      hand = Hand.new([card1,card2])
      card3 = Card.new("Q","♠")
      hand.add_card(card3)

      expect(hand.cards).to include(card3)
    end
    end

  describe "#view" do
    it " shows the cards in the players hand (10♦) (J♥)" do
      expect(hand.view).to eq(["10♦", "J♥"])
    end
  end
end
