require_relative "card.rb"

class Deck

  attr_accessor :cards

  SUITS = {spades: 1, hearts: 2, diamonds: 3, clubs: 4}
  VALUES = {two: 2, three: 3, four: 4, five: 5, six: 6,
            seven: 7, eight: 8, nine: 9, ten: 10, jack: 11,
            queen: 12, king: 13, ace: 14}

  def initialize
    @cards = Deck.generate_deck
    7.times { @cards.shuffle! }
  end

  def self.generate_deck
    deck = []
    SUITS.keys.each do |suit|
      VALUES.keys.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck
  end

end
