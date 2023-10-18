class Board
    require 'colorize'
    require_relative 'string.rb'
    attr_accessor :grid
    
    def initialize()
        @grid = new_grid()
    end

    def new_grid
        board = Array.new(8){ Array.new(8) }
        board.each_with_index do |row, i|
            board.each_with_index do |cell, j|
                board[i][j] = (i + j).even? ? '   '.on_white : '   '.on_black
            end
        end
        return board
    end

    def display
        @grid.each_with_index do |row, i|
            @grid.each_with_index do |cell, j|
                print @grid[i][j]
            end
            puts ""
        end
    end

    def display_path(path)
        @grid.each_with_index do |row, i|
            @grid.each_with_index do |cell, j|
                if path.include?([i,j])
                    index = path.index([i,j])
                    if index.even?
                        print " #{index} ".black.bg_gray
                    else
                        print " #{index} ".gray.bg_black 
                    end
                else
                    print @grid[i][j]
                end
            end
            puts ""
        end
    end
end