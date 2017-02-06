class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
    raise "must have five cards" if @cards.length != 5
  end

  def trade_cards(take_cards, new_cards)
    take_cards.each do |card|
      raise "cannot discard unowned card" unless @cards.include?(card)
      @cards.delete(card)
    end
    @cards += new_cards
    raise "must have five cards" if @cards.length != 5
  end
end
