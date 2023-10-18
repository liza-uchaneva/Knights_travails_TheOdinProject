require_relative 'board.rb'
require_relative 'knight_moves.rb'


board = Board.new
knight = Knight.new([0,0])

path = knight.knight_moves([3,3],[0,0])
board.display_path(path)
puts ""

# path = knight.knight_moves([0,0],[1,2])
# board.display_path(path)
# puts ""

path = knight.knight_moves([0,0],[3,3])
board.display_path(path)
puts ""

path = knight.knight_moves([3,3],[0,0])
board.display_path(path)
puts ""
