class LinkedList
  attr_accessor :head

  require_relative "node"

  def initialize
    @head = create_node
  end

  # Adds a new node to the end of the list
  def append
    current_node = @head
    while !current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node.next_node = create_node
  end

  # Adds a new node the the start of the list
  def prepend
    temp_node = @head
    @head = create_node
    @head.next_node = temp_node
  end

  # Returns the total number of nodes in the list
  def size
    current_node = @head
    count = 1
    while !current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    return count
  end

  # Returns the last node in the list
  def tail
    current_node = @head
    while !current_node.next_node.nil?
      current_node = current_node.next_node
    end
    return current_node
  end

  # Returns the node at the given index (first one is 0 like in arrays)
  def at(index)
    current_node = @head
    index.times do
      if current_node.next_node.nil?
        puts "Error: out of range"
        return nil
      end
      current_node = current_node.next_node
    end
    return current_node.value
  end

  # Removes the last element from the list
  def pop
    if @head.next_node.nil?
      puts "Error: there is only one element in the list"
      return
    end
    current_node = @head
    while !current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node.next_node = nil
  end

  # Returns true if the passed in value is in the list and otherwise returns false
  def contains?(a)
    current_node = @head
    while !current_node.next_node.nil?
      if current_node.value === a
        return true
      end
      current_node = current_node.next_node
    end
    if current_node.value === a
      return true
    end
    return false
  end

  # Returns the index of the code containing data or nil if not found
  def find(data)
    current_node = @head
    index = 0
    while !current_node.next_node.nil?
      if current_node.value === data
        return index
      end
      index += 1
      current_node = current_node.next_node
    end
    if current_node.value === data
      return index
    end
    return nil
  end

  # Prints the objects of the list as strings
  def to_s
    current_node = @head
    while !current_node.next_node.nil?
      print "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    puts "(#{current_node.value}) -> nil"
  end

  # Inserts a nod at a given index
  def insert_at(index)
    if index === 0
      prepend
    elsif index === size - 1
      append
    elsif index >= size
      puts "Error: out of range"
    else
      current_node = @head
      (index - 1).times { current_node = current_node.next_node }
      temp_node = current_node.next_node
      current_node.next_node = create_node
      current_node.next_node.next_node = temp_node
    end
  end

  # Removes the node at the given index
  def remove_at(index)
    if index === 0
      @head = @head.next_node
    elsif index >= size
      puts "Error: out of range"
    else
      current_node = @head
      (index - 1).times { current_node = current_node.next_node}
      current_node.next_node = current_node.next_node.next_node
    end
  end

  private

  def create_node
    node = Node.new()
    puts "Insert value for the new node:"
    node.value = gets.chomp.to_i
    return node
  end

end
