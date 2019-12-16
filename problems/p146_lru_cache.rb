class Node
  attr_accessor :next, :prev
  attr_accessor :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @nodes = {}
    @head = nil
    @tail = nil
  end

  def get(key)
    node = @nodes[key]
    return -1 unless node

    update node
    node.value
  end

  def put(key, value)
    node = @nodes[key]
    if node
      node.value = value
      update node
    else
      node = Node.new(key, value)
      @nodes[key] = node

      unless @head
        @head = node
        @tail = node
      else
        node.next = @head
        node.next.prev = node
        @head = node
      end

      if @nodes.size > @capacity
        if @tail && @tail.prev
          rkey = @tail.key
          @tail.prev.next = nil
          @tail = @tail.prev
          @nodes.delete rkey
        end
      end
    end

    nil
  end

  def update(node)
    if node != @head
      if node.next
        node.next.prev = node.prev
      else
        @tail = node.prev
      end
      if node.prev
        node.prev.next = node.next
      end

      node.next = @head
      @head.prev = node
      @head = node
    end
  end
end
