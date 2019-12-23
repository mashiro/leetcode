# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {String} s
# @return {TreeNode}
def recover_from_preorder(s)
  nodes = []

  inputs = parse s
  nodes.push TreeNode.new(inputs.shift[1])

  inputs.each do |depth, val|
    nodes.pop while nodes.size > depth
    nodes << add_node(nodes.last, val)
  end

  nodes.first
end

def add_node(parent, val)
  node = TreeNode.new val
  if parent.left.nil?
    parent.left = node
  else
    parent.right = node
  end
  node
end

def parse(s)
  s.scan(/(-*)(\d+)/).map { |d, n| [d.size, n.to_i] }
end

p recover_from_preorder("1-2--3---4-5--6---7")
