require_relative 'MinMaxStackQueue.rb'

def windowed_max_range(array, window_size)
    sq = MinMaxStackQueue.new
    current_max_range = 0
    array.each_with_index do |ele, i|
        if i < window_size - 1
            sq.enqueue(ele)
            next
        end
        if i == window_size -1
            sq.enqueue(ele)
            if current_max_range < sq.max - sq.min
                current_max_range = sq.max - sq.min
            end
            next
        end
        sq.enqueue(ele)
        sq.dequeue
        if current_max_range < sq.max - sq.min
            current_max_range = sq.max - sq.min
        end
    end
    current_max_range
end

windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
1, 0, 2

def windowed_max_range(array, window_size)
    sq = MinMaxStackQueue.new

    array_with_index.each do |ele, i|
        if i < window_size
        sq.enqueue << ele 
    end

end

Basic solution
def windowed_max_range(array, window_size)
  max_range = 0
  start = 0
  stop = window_size -1 
  until stop == array.length
    window = array[start..stop] 
    range = window.max - window.min
    max_range = range if range > max_range
    start +=1
    stop += 1
  end
max_range
end

O(n) solution


windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8