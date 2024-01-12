class LinkedList
  attr_accessor :head

  def initialize
    @head = Node.new('head')
  end

  def append(value)
    # add new node to end of list
    current = @head
    current = current.next_node until current.next_node.nil?
    current.next_node = Node.new(value)
  end

  def prepend(value)
    # add new node to start of list
    current = @head
    # find first node pointer
    temp = current.next_node
    # first node points to new_node(value,first_node_pointer)
    current.next_node = Node.new(value, temp)
  end

  def size
    # returns total number of nodes
    count = 0
    current = @head
    until current.next_node.nil?
      current = current.next_node
      count += 1
    end
    count
  end

  attr_reader :head

  def tail
    current = @head
    current = current.next_node until current.next_node.nil?
    current
  end

  def at(index)
    count = 0
    current = @head
    while count != index
      current = current.next_node
      count += 1
    end
    current
  end

  def pop
    # removes last element of list
    # find last element of list and make previous pointer = nil
    current = @head
    until current.next_node.nil?
      previous = current
      current = current.next_node
    end
    previous.next_node = nil
  end

  def contains(value)
    # returns true if  value is in list otherwise false
    current = @head
    output = false
    until current.next_node.nil?
      current = current.next_node
      output = true if current.value == value
    end
    output
  end

  def find(value)
    # returns index of node containing value or nil
    current = @head
    index = 0
    until current.next_node.nil?
      current = current.next_node
      index += 1
      return index if current.value == value || current.next_node.nil?
    end
  end

  def to_s
    # ( value ) -> ( value ) -> ( value ) -> nil
    current = @head
    until current.next_node.nil?
      current = current.next_node
      print "( #{current.value} ) -> "
    end
    print 'nil' + "\n"
  end

  # extra credit
  def insert_at(value, index)
    current = @head
    count = 0
    while count != index
      previous = current
      current = current.next_node
      count += 1
    end
    previous.next_node = Node.new(value, current)
  end

  def remove_at(index)
    current = @head
    count = 0
    while count != index
      previous = current
      current = current.next_node
      count += 1
    end
    previous.next_node = current.next_node
  end
end

class Node
  attr_accessor :key, :value, :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end
