class MyStack
    attr_reader :store
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

    def pop
        @store.pop
    end

    def push(rabbit)
        @store << rabbit
    end
end
