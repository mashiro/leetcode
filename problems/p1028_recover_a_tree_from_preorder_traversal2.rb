# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  attr_accessor :depth, :parent

  def initialize(val, depth = 0)
    @val = val
    @left, @right = nil, nil
    @depth = depth
    @parent = nil
  end

  def add_child(value)
    node = TreeNode.new value, self.depth + 1
    node.parent = self
    if @left.nil?
      @left = node
    else
      @right = node
    end

    node
  end

  def leaf?
    @left.nil? and @right.nil?
  end

  def can_add?
    @left.nil? or @right.nil?
  end
end

# @param {String} s
# @return {TreeNode}
def recover_from_preorder(s)
  tree = Tree.new
  tree.recover_from_preorder s
  tree.to_output
end

class Tree
  attr_accessor :root

  def recover_from_preorder(s)
    node = nil
    parse(s) do |depth, value|
      if depth.zero?
        @root = TreeNode.new value
        node = @root
        next
      end

      node = add_node node, depth, value
    end
  end

  def to_output
    values = []
    queue = [@root]
    node = nil
    until queue.empty?
      node = queue.shift
      unless node.nil?
        values.push node.val
        unless node.leaf?
          queue.push node.left
          queue.push node.right
        end
      else
        values.push nil
      end
    end

    values.reverse.drop_while { |v| v.nil? }.reverse
  end

  private

  def add_node(node, depth, value)
    puts "add_node: pos=#{node.val} d#{depth} c#{value}"
    parent = find_parent node, depth - 1
    puts "add: p#{parent.val} <- c#{value}"
    parent.add_child value
  end

  def find_parent(node, depth)
    return nil if node.nil?
    return node if node.depth == depth

    if node.depth > depth
      find_parent node.parent, depth
    else
      find_parent(node.left, depth) or find_parent(node.right, depth)
    end
  end

  def parse(s)
    s.scan(/(-*)(\d+)/) do |d, n|
      yield d.size, n.to_i
    end
  end
end

p recover_from_preorder("1-2--3--4-5--6--7")
p recover_from_preorder("1-2--3---4-5--6---7")
p recover_from_preorder('1-401--349---90--88')
