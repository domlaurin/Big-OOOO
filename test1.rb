require_relative 'MinMaxStackQueue.rb'
require 'benchmark'

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

# def windowed_max_range(array, window_size)
#     max_range = 0
#     start = 0
#     stop = window_size -1 
#     until stop == array.length
#       window = array[start..stop] 
#       range = window.max - window.min
#       max_range = range if range > max_range
#       start +=1
#       stop += 1
#     end
#   max_range
#   end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


puts Benchmark.measure { windowed_max_range([*1..100000], 2) == 2 }
# puts Benchmark.measure { windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 3  }
# puts Benchmark.measure { windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 4  }
# puts Benchmark.measure { windowed_max_range([1, 0, 2, 5, 4, 8], 5) == 5  }

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6