require "spec_helper"

describe Blackjack do
  let(:game) {Blackjack.new}

  describe "#new" do
    it "creats a new object of class Blackjack" do
      expect(game).to be_a(Blackjack)
    end

    it "should have a deck of the Deck Class" do
      expect(game.deck).to be_a(Deck)
    end

    it "should have a player hand with two cards" do
      expect(game.player.cards.length).to eq(2)
    end

    it "should have a dealer hand with two cards" do
      expect(game.computer.cards.length).to eq(2)
    end
  end
end
