class Card
  attr_reader :suit, :rank
  attr_accessor :face_down, :owner

  SUITS = [:heart,:diamond,:spade,:club]
  RANKS = {"A"=>[1,14],"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,
    "9"=>9,"10"=>10,"J" => 11,"Q"=>12,"K"=>13}


  #ace high except 1 for straight
  def initialize(suit, rank, owner=nil)
    raise 'not a suit!' unless SUITS.include?(suit)
    raise 'not a rank!' unless RANKS.keys.include?(rank)
    @suit = suit
    @rank = rank
    @owner = owner
    @face_down = true
  end


  def flip
    @face_down ? (@face_down = false) : (@face_down = true)
  end


  def change_owner(new_owner)
    @owner = new_owner
    #Might have to change something in a Player instance
    #call player. something
  end

end

#try symbol
