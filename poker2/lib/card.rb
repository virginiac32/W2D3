
class Card

  def initialize(suit, value)
    if [:spades,:hearts].include?(suit)
      @suit = suit
    else
      raise "Invalid suit"
    end
    if [:ten,:jack,:eight].include?(value)
      @value = value
    else
      raise "Invalid value"
    end
  end

  attr_reader :suit, :value

  def <=>(card2)
    values = {ten: 10, jack: 11}
    if values[self.value] > values[card2.value]
      return -1
    elsif values[self.value] == values[card2.value]
      return 0
    else
      return 1
    end
  end

end
