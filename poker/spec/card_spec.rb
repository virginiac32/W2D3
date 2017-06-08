require 'rspec'
require 'card'

describe Card do
subject(:card) { Card.new(:heart,"2") }

  describe '#initialize' do

    it 'has a suit' do
      expect(card.suit).to eq(:heart)
    end

    it 'only has suits that are heart, spade, diamond, or club' do
      expect{Card.new(:clover,"2")}.to raise_error("not a suit!")
    end

    it 'only has ranks that are A,2,3,4,5,6,7,8,9,10,J,Q,K' do
      expect{Card.new(:spade,"F")}.to raise_error("not a rank!")
    end

    it 'has a rank' do
      expect(card.rank).to eq("2")
    end

    it 'initializes with no owner' do
      expect(card.owner).to eq(nil)
    end

    it 'initializes face down' do
      expect(card.face_down).to eq(true)
    end

  end

  describe "#flip" do

    it 'flips the face of the card' do
      expect(card.face_down).to eq(true)
      card.flip
      expect(card.face_down).to eq(false)
    end

  end

  describe "#change_owner" do

    it 'changes the owner of the card' do
      expect(card.owner).to eq(nil)
      card.change_owner("joe")
      expect(card.owner).to eq("joe")
    end

  end

end
