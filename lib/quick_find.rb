class QuickFind
  attr_accessor :nodes

  def initialize(num)
    @nodes = {}
    num.times { |n| @nodes[n] = n }
  end

  def connected?(node1, node2)
    @nodes[node1] == @nodes[node2]
  end

  def union(node1, node2)
    current_node1 = @nodes[node1]
    current_node2 = @nodes[node2]
    @nodes.length.times { |n| @nodes[n] = @nodes[node2] if @nodes[n] == @nodes[node1] }
  end
end
