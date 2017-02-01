require 'stock_picker'

describe Array do
  describe "#stock_picker" do
    it "returns empty array if less than two days are given" do
      expect([1].stock_picker).to eq([])
      expect([].stock_picker).to eq([])
    end

    it "returns pair of indices for simple case" do
      expect([9,10].stock_picker).to eq([0,1])
    end

    it "returns pair min, max indices for case where min precedes max" do
      expect([1,2,4,3,4,90,3].stock_picker).to eq([0,5])
    end

    it "returns largest difference indices when max preceds min" do
      expect([30,20,21,25].stock_picker).to eq([1,3])
    end
  end
end
