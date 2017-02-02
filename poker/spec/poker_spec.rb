require 'card'
require 'deck'
require 'game'
require 'hand'
require 'player'

describe Card do

  describe "#initialize" do

    it "receives the suit and value" do
      expect(Card.new(:clubs, :three)).to be_truthy
    end

    it "sets the suit and value" do
      card = Card.new(:clubs, :three)
      expect(card.suit).to eq(:clubs)
      expect(card.value).to eq(:three)
    end

  end

end

describe Deck do
  subject(:new_deck) { deck = Deck.new }

  describe "#initialize" do
    it "generates a standard 52-card deck" do
      expect(new_deck.cards.length).to eq(52)
      expect(new_deck.cards.all? { |card| card.is_a?(Card) }).to be true
    end
  end

  describe "#deal_card" do
    it "deals a card and does not replace" do
      card = new_deck.cards.pop
      expect(new_deck.cards.none? do |each_card|
        each_card == card
      end).to be true
    end
  end

end
