class MinMaxStack

  attr_reader :store
  def initialize
    @store = []
    @min = []
    @max = []
  end

  def peek
    @store.first
  end

  def min
    @min[-1]
  end

  def max
    @max[-1]
  end

  def size 
    @store.size
  end

  def empty?
    @store.empty?
  end

  def pop
    @min.pop
    @max.pop
    @store.pop
  end

  def push(ele)
    if @min == [] && @max == [] 
      @min << ele
      @max << ele
      return @store << ele
    end

    if ele < @min[-1]
      @min << ele
    elsif ele >= @min[-1]
      @min << @min[-1]
    end

    if ele > @max[-1]
      @max << ele
    elsif ele <= @max[-1]
      @max << @max[-1]
    end

    @store << ele
  end

end





# mms = MinMaxStack.new

# p mms.min
# p mms.max
# p mms.push(1)
# p mms.min
# p mms.max
# p mms.push(2)
# p mms.push(3)
# p mms.push(4)
# p mms.push(5)
# p mms.min
# p mms.max
# p mms.pop
# p mms.pop
# p mms.pop
# p mms.pop
# p mms.pop
# p mms.push(2)

# p mms.min
# p mms.max