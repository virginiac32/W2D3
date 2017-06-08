require 'rspec'
require 'first_tdd'

describe 'Array Extensions' do

  describe "#my_uniq" do

    it 'removes duplicates and returns the uniqe elements in order' do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
      #expect
    end

    it 'removes duplicates' do
      expect([1, 1, 1].my_uniq).to eq([1])
    end

  end


  describe "#two_sum" do
    subject(:array1) {[1, 2, -2, -1, 0, 3]}

    it 'returns positions that sum to zero' do
      expect(array1.two_sum).to eq([[0, 3], [1, 2]])
    end

    it 'returns positions with smaller first elements coming first' do
      expect(array1.two_sum).to_not eq([[1,2], [0,3]])
    end

    it 'returns positions with smaller 2nd elements coming first' do
      expect([-1, 1, 1].two_sum).to_not eq([[0,2],[0,1]])
    end

  end


  describe "#my_transpose" do
    subject(:array2) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}

    it 'switches rows and columns' do
      cols = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
      expect(array2.my_transpose).to eq(cols)
    end

    it 'raises an error when the array isn\'t a square matrix' do
      expect{ [[1, 2, 3], [4, 5, 6]].my_transpose }.to raise_error('needs to be a square matrix')
    end

  end


  describe "#stock_picker" do
    subject(:stock_prices) {[10, 20, 0, 5, 30, 20, 40]}

    it 'outputs the most profitable pair of days' do
      expect(stock_prices.stock_picker).to eq([2, 6] )
    end

    it 'returns nil if there are no profitable pairs' do
      expect([50, 40, 30, 20, 10, 0].stock_picker).to eq(nil)
    end

  end

end


describe "TowersOfHanoi" do
  subject(:game) {TowersOfHanoi.new}


  describe "#move" do

    #starting grid: [[2,3], [1], []], move is [0, 1]
    it 'does not make move if piece to move is larger than piece in the end position' do
      game.grid = [[3], [1,2], []]
      expect{ game.move }.to raise_error('the piece is larger than the tower\'s top stack')
    end

    it 'doesn\'t move a piece from an empty array' do
      game.grid = [[], [1,2,3], []]
      expect{ game.move }.to raise_error('that tower has no piece')
    end

    #Case Move is [0,1]
    it 'makes the move if the move is valid' do
      game.move
      expect(game.grid).to eq([[2,3], [1], []])
    end


    it 'correctly shifts and unshifts the moved piece from the position arrays' do
      game.move
      expect(game.grid).to eq([[2,3], [1], []])
    end

  end


  describe "#won?" do
    
    it 'returns false all the pieces are still in the first tower' do
      expect(game.won?).to eq(false)
    end

    it 'returns true if first tower is empty and all pieces are in another tower' do
      game.grid = [[], [1,2,3], []]
      expect(game.won?).to eq(true)
    end

  end



end
