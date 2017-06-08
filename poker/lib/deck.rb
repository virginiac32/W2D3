require_relative 'card'

class Deck
  attr_accessor :stack

  def initialize
    @stack = create_stack
  end

  def create_stack
    stack = Array.new

    Card::SUITS.each do |suit|
      Card::RANKS.keys.each do |rank|
        stack.push(Card.new(suit, rank))
      end
    end

    stack
  end

  def shuffle!
    @stack.shuffle!
  end

  def pass_out_card(new_owner)
    card = stack[0]
    @stack.shift
    card.owner = new_owner
  end

  def take_back_cards
  end
  #the cards that have no owner are still in the deck

end
