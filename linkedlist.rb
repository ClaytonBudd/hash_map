class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  Node = Struct.new(:key, :value, :next_node)

  def add_node(key, value)
    @head = Node.new(key, value, @head)
  end

  def find_value(key)
    # returns index of node containing key or nil
    return @head.value if @head.key == key

    current = @head
    index = 0
    until current.next_node.nil?
      current = current.next_node
      index += 1
      return index if current.key == key || current.next_node.nil?
    end
  end

  def find_key_index(key)
    # returns index of node containing key or nil
    current = @head
    index = 0

    return index if @head.key == key

    until current.next_node.nil?
      current = current.next_node
      index += 1
      return index if current.key == key || current.next_node.nil?
    end
  end

  def remove_at(index)
    return @head = nil if @head.next_node.nil?

    current = @head
    count = 0
    while count != index
      previous = current
      current = current.next_node
      count += 1
    end
    previous.next_node = current.next_node
  end

  def size
    # returns total number of nodes
    count = 1
    current = @head
    until current.next_node.nil?
      current = current.next_node
      count += 1
    end
    count
  end

  def to_array_key
    # ( value ) -> ( value ) -> ( value ) -> nil
    keys = []
    return keys.append(@head.key) if @head.next_node.nil?

    current = @head
    until current.next_node.nil?
      current = current.next_node
      keys.append(@head.key)
    end
    keys
  end

  def to_array_value
    values = []
    return values.append(@head.value) if @head.next_node.nil?

    current = @head
    until current.next_node.nil?
      current = current.next_node
      values.append(@head.value)
    end
    values
  end

  def to_array_entries
    entries = []
    return entries.append([@head.key, @head.value]) if @head.next_node.nil?

    current = @head
    until current.next_node.nil?
      current = current.next_node
      entries.append([@head.key, @head.value])
    end
    entries
  end
end
