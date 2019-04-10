# implement the user-interaction and game logic for minesweeper

require_relative 'board'
require_relative 'tile'

class Minesweeper
    def initialize
        @board = Board.new
        @board.add_bombs_to_grid
    end

    def take_turn
        @board.display
    end
end