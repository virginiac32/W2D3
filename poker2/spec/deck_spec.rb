require 'deck'
require 'rspec'
require_relative './card'

describe Deck do

  let(:deck) {Deck.new()}

  describe "#initialize" do

    subject(:deck) { Deck.new() }

    it "initializes with a deck of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

  end

  describe "#draw" do

    let(:cards) {[double('card1', suit: :spades, value: :eight),
      double('card2', suit: :spades, value: :jack)]}

    it "removes a card from the deck" do
      expect(deck.cards.length).to eq(51)
      deck.draw
    end

    it "adds a card to a player's hand" do

    end

    it "returns an error if there are no more cards in the deck" do

    end

  end

end
