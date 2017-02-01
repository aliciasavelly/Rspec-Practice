require 'tdd'

describe Array do
  describe "#my_uniq" do
    context "when no duplicates are present" do
      it "returns empty array if empty" do
        expect([].my_uniq).to eq([])
      end

      it "returns array if no duplicates are present" do
        expect([1,2,3].my_uniq).to eq([1,2,3])
      end
    end

    context "when duplicates are present" do
      it "removes a duplicate of an element from array" do
        expect([1,2,1,3].my_uniq).to include(1,2,3)
      end

      it "returns elements in their original order" do
        expect([1,2,1,3].my_uniq).to eq([1,2,3])
      end

      it "does not mutate original array" do
        array = [1,2,1,3,3]
        array_dup = array.dup
        array.my_uniq
        expect(array).to eq(array_dup)
      end

      it "removes multiple duplicates from array" do
        expect([1,2,1,3,3,3,1,3].my_uniq).to eq([1,2,3])
      end
    end
  end

  describe "#my_two_sum" do
    context "when no pairs sum to zero" do
      it "returns empty array if input array is empty" do
        expect([].my_two_sum).to eq([])
      end

      it "returns empty array if no pairs sum to zero" do
        expect([0, 1, 2, 3, 4].my_two_sum).to eq([])
      end
    end

    it "does not modify the original array" do
      array = [1, 2, -1, -2]
      array_dup = array.dup
      array.my_two_sum
      expect(array).to eq(array_dup)
    end

    it "returns indices" do
      expect([0, 1, 2, 3, 0].my_two_sum).to include([0,4]) || include([4,0])
    end

    it "finds all index pairs that sum to zero" do
      expect([0, 1, 2, -1, 0, 3, -2].my_two_sum).to include([0,4],[1,3],[2,6])
    end

    it "does not return duplicates" do
      expect([0, 1, 2, -1, 0, 3, -2].my_two_sum).to_not include([4,0],[3,1],[6,2])
    end

    it "returns index pairs in dictionary order" do
      expect([0, 1, 2, -1, 0, 3, -2].my_two_sum).to eq([[0,4],[1,3],[2,6]])
    end
  end
end

describe "#my_transpose" do
  context "when the array contains no arrays" do
    it "returns itself if contains it no arrays" do
      array = [1,2,3,4]
      expect(my_transpose(array)).to eq(array)
    end
  end

  context "when the array contains arrays" do
    subject(:array) { [[1,2,3],[4,5,6],[7,8,9]] }

    it "does not return itself if it contains arrays" do
      expect(my_transpose(array)).not_to eq(array)
    end

    it "returns the transposed version of array" do
      arr = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
      expect(my_transpose(arr)).to eq([[1,5,9],[2,6,10],[3,7,11],[4,8,12]])
      expect(my_transpose(array)).to eq([[1,4,7],[2,5,8],[3,6,9]])
    end
  end
end
