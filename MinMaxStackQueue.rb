require_relative 'minmaxstack.rb'

class MinMaxStackQueue

  attr_reader :input, :output, :min, :max

  def initialize
    @input = MinMaxStack.new
    @output = MinMaxStack.new
  end
 
  def size
    @input.length
  end

  def max
    @input.max
  end

  def min
    @input.min
  end

  def empty?
    @input.empty?
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

sq = MinMaxStackQueue.new

p sq.min
p sq.max
p sq.enqueue(20) 
p sq.enqueue(3) 
p sq.enqueue(4) 
p sq.enqueue(10)
p sq.min
p sq.max
p sq.dequeue
p sq.enqueue(2)
p sq.min
p sq.max
