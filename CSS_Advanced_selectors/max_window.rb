def windowed_max_range(arr, size)
  max = 0
  i = 0
  while i <= arr.length - size
    window = arr[i...i + size].sort
    curr_max_range = window.last - window.first
    max = curr_max_range if curr_max_range > max
    i += 1
  end
  max
end

class MyQueue

  attr_reader :store

  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    store.dup.first
  end

  def size
    @store.length
  end

  def empty?
    store.empty?
  end

end

class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
  end
end

class StackQueue
  def initialize
    @store = MyStack.new
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(el)
    stack2 = MyStack.new
    stack2.push(el)
    until @stack.empty?
      stack2.push(@stack.pop)
    end
    @stack = stack2
  end

  def dequeue
    @stack.pop
  end

end

if $PROGRAM_NAME == __FILE__
  p windowed_max_range([1, 0, 2, 5, 4, 8], 2)
  p windowed_max_range([1, 0, 2, 5, 4, 8], 3)
  p windowed_max_range([1, 0, 2, 5, 4, 8], 4)
  p windowed_max_range([1, 3, 2, 5, 4, 8], 5)

end
