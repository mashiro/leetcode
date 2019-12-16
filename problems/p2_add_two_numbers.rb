class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def a_to_i(arr)
  arr.each.with_index.reduce(0) { |a, (v, i)| a + (v * 10**i) }
end

def i_to_a(val)
  a = []
  while val >= 10
    a.unshift val % 10
    val /= 10
  end
  a.unshift val
end

def to_array(node)
  values = [node.val]
  n = node.next
  while n != nil
    values.push n.val
    n = n.next
  end
  values.reverse
end

def to_link(arr)
  prev = nil
  arr.each do |v|
    node = ListNode.new v
    node.next = prev if prev
    prev = node
  end
  prev
end

p to_link(i_to_a(81))
p to_link(i_to_a(0))
