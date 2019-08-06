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


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8