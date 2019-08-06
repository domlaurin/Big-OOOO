require_relative 'MyStack.rb'

class StackQueue

  attr_reader :input, :output

  def initialize
    @input = MyStack.new
    @output = MyStack.new
    @size = 0
  end

  def size
    @size
  end

  def enqueue(el)
    @input.push(el)
    @input.store
  end

  def dequeue
    until @input.empty?
      @output.push(@input.pop)
    end
    ele = @output.pop
    until @output.empty?
        @input.push(@output.pop)
    end
    ele
  end
end

sq = StackQueue.new

p sq.enqueue(1)
p sq.enqueue(2)
p sq.enqueue(3)
p sq.enqueue(4)
p sq.dequeue
p sq.enqueue(5)
p sq.enqueue(6)
p sq.dequeue
p sq.dequeue
p sq.dequeue
p sq.enqueue(10)

# def dequeue
#   if @output.empty?
#     until @input.empty?
#       @output.push(@input.pop)
#     end
#   end
#   @output.pop
# end