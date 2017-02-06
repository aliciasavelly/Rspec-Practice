require_relative "card.rb"
require_relative "hand.rb"

class Deck

  # attr_reader :cards

  SUITS = {spades: 1, hearts: 2, diamonds: 3, clubs: 4}
  VALUES = {two: 2, three: 3, four: 4, five: 5, six: 6,
            seven: 7, eight: 8, nine: 9, ten: 10, jack: 11,
            queen: 12, king: 13, ace: 14}

  def initialize(cards = Deck.all_cards)
    @cards = cards
    7.times { @cards.shuffle! }
  end

  def self.all_cards
    deck = []
    SUITS.keys.each do |suit|
      VALUES.keys.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck
  end

  def count
    @cards.count
  end

  def take(n)
    raise "not enough cards" if n > count
    taken = []
    n.times { taken << @cards.shift }
    taken
  end

  def return(more_cards)
    @cards += more_cards
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_hand
    Hand.new(take(5))
  end

end
