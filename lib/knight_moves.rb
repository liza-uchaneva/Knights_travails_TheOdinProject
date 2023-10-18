class Knight
    require_relative 'board.rb'

    attr_reader :location, :parent 

    MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]].freeze
    @@history = []

    def initialize(location, parent = nil)    
        @location = location
        @parent = parent
        @@history.push(location)
    end

    def knight_moves(from, to)
        queue = []
        current_node = Knight.new(from, nil)

        until current_node.location == to
            current_node.find_available_moves.each { |child| queue.push(child) }
            current_node = queue.shift
        end

        path  = restore_the_path(current_node)
        return path
    end

    def restore_the_path(node, path = Array.new)
        if node.parent.nil?
            path.push(node.location)
            return path 
        end
        restore_the_path(node.parent, path)
        path.push(node.location)
    end

    def find_available_moves
        m = MOVES.map { |t| [@location[0] + t[0], @location[1] + t[1]] }
                 .keep_if { |e| e[0].between?(1, 8) && e[1].between?(1, 8) }
                 .reject { |e| @@history.include?(e) }
                 .map { |e| Knight.new(e, self) }
        return m
    end 
end 