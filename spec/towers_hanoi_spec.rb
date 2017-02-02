require 'towers_hanoi'

describe Towers do
  subject(:tower_game) { Towers.new }
  describe "#initialize" do

    it "produces initial game state" do
      expect(tower_game.game).to eq ([[3,2,1],[],[]])
    end
  end

  describe "#play" do
    subject(:tower_game) { Towers.new }
    it "calls #valid_move?" do
      expect(tower_game).to receive(:valid_move?).with(0, 1)
    end

    it "calls #move_disc" do
      expect(tower_game).to receive(:move_disc).with(0, 1)
    end
  end

  describe "#valid_move?" do

    context "when chosen pile is empty" do
      it "considers the choice valid" do
        pile1 = 0
        pile2 = 1
        expect(tower_game.valid_move?(pile1, pile2)).to be true
      end
    end

    context "when chosen disc is bigger than any disc on target pile" do
      it "considers the choice invalid" do
        tower_game.game = [[3,2],[1],[]]
        expect(tower_game.valid_move?(0, 1)).to be false
      end
    end

    context "when chosen disc is smaller than discs on target pile" do
      it "considers the choice valid" do
        tower_game.game = [[3],[1],[2]]
        expect(tower_game.valid_move?(1, 0)).to be true
      end
    end
  end

  describe "#move_disc" do

    it "moves one disc to the chosen pile" do
      tower_game.move_disc(0,1)
      expect(tower_game.game).to eq([[3,2],[1],[]])
    end

    it "moves one disc to the top of chosen pile" do
      tower_game.game = [[3],[2],[1]]
      tower_game.move_disc(1,0)
      expect(tower_game.game).to eq([[3,2],[],[1]])
    end

  end

  describe "#won?" do

    it "correctly sees that the game has not been won" do
      expect(tower_game.won?).to be false
    end

    it "recognizes when the game has been won" do
      tower_game.game = [[],[],[3,2,1]]
      expect(tower_game.won?).to be true
    end
  end

end
