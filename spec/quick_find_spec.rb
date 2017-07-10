require 'quick_find'

RSpec.describe QuickFind do
  before do
    @union = QuickFind.new(10)
  end

  describe "#nodes" do
    it "has 10 nodes" do
      expect(@union.nodes).to match_array [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end

  describe "#connected?" do
    it "detects if two nodes are not connected" do
      expect(@union.connected?(1, 4)).to eq false
    end
  end

  describe "#union" do
    let(:union1) { @union.union(1, 2) }
    let(:union2) { @union.union(2, 3) }
    let(:union3) { @union.union(3, 4) }
    it "connects nodes and detects connectedness" do
      union1
      union2
      union3
      expect(@union.nodes).to match_array [0, 1, 1, 1, 1, 5, 6, 7, 8, 9]
      expect(@union.connected?(1, 4)).to eq true
    end
  end
end
