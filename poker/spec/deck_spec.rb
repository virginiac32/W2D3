require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do

    it 'initializes with complete deck of cards' do
      expect(deck.stack).to be_an Array
      expect(deck.stack.count).to eq(52)
    end

  end

  describe '#shuffle' do


    it 'shuffles the cards' do
      # stack = Array.new
      #
      # Card::SUITS.each do |suit|
      #   Card::RANKS.keys.each do |rank|
      #     stack.push(Card.new(suit, rank))
      #   end
      # end

      comparison_stack = deck.stack.dup

      expect(deck.stack).to eq(comparison_stack)

      deck.shuffle!

# edge cases, what value of deck.stack can be substitute it with
#try not to use to_not, if do use another test
      expect(deck.stack).to_not eq(comparison_stack)
      expect(deck.stack).to match_array(comparison_stack)

      # stack1 = stack.map{|card| card.suit.to_s + card.rank }
      # stack2 = deck.stack.map{|card| card.suit.to_s + card.rank }
      #
      # expect(stack2).to eq(stack1)
      # deck.shuffle!
      #
      # stack3 = deck.stack.map{|card| card.suit.to_s + card.rank }
      # expect(stack3).to_not eq(stack1)

    end

  end

  describe '#pass_out_card' do

    #search for cards that don't have owners when dealing.

    #Give out hte cards

    it 'assigns a new owner for the card' do
      passed_out_card = deck.stack[0]
      deck.pass_out_card("Joe")
      expect(passed_out_card.owner).to eq("Joe")
      expect(deck.stack).to_not include(passed_out_card)
    end

  end

  describe '#take_back_cards' do
    before(:each) do
      5.times { deck.pass_out_card("jeff") }
    end

    it 'should assign all card owners to nil' do

      deck.take_back_cards
      expect()
    end

    it 'reinserts all cards back into the deck' do

    end

  end

end

#added a comment
