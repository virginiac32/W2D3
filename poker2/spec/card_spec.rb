require 'rspec'
require 'card'

describe Card do
  describe "#initialize" do
    subject(:card) { Card.new(:spades,:ten) }

    it "has a value and suit" do
      expect(card.suit).to eq(:spades)
      expect(card.value).to eq(:ten)
    end

    it "raises an error with invalid value" do
      expect do
        Card.new(:spades,:hi)
      end.to raise_error("Invalid value")
    end
  end

  describe "#<=>" do

    subject(:card) {Card.new(:spades,:ten)}
    subject(:card2) {Card.new(:spades,:jack)}

    it "returns 0 if values same" do
      expect(card <=> card).to eq(0)
    end

    it "returns 1 if card 1 < card 2" do
      expect(card <=> card2).to eq(1)
    end

  end

end
