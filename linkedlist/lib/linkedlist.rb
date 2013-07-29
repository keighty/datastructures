class LinkedListStack
  include Enumerable
  attr_accessor :first, :last, :count

  def each(&block)
    return nil if @head.nil?
    entry = @head
    until entry.nil?
      yield entry
      entry = entry.next
    end
  end

  def initialize
    @count = 0
  end

  def empty?
    @first == nil
  end

  def size
    @count
  end

  def push(item)
    oldfirst = @first
    @first = Element.new
    @first.item = item
    @first.next = oldfirst
    @count += 1
  end

  def pop
    raise "Stack is empty" if empty?
    item = @first.item
    @first = @first.next
    @count -= 1
    return item
  end

  class Element
    attr_accessor :item, :next
  end

end