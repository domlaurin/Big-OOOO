class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store.first
    end

    def size 
        @store.size
    end

    def empty?
        @store.empty?
    end

    def enqueue(rabbit)
        @store << rabbit
    end

    def dequeue
        @store.shift
    end
end